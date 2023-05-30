//
//  LoggedInViewController.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//


import UIKit

import RIBs
import RxCocoa
import RxSwift

// MARK: - LoggedInPresentableAction

enum LoggedInPresentableAction {
    case textDidChanged(email: String, password: String)
    case findButtonDidTap
    case signUpButtonDidTap
    case localLoginButtonDidTap(email: String, password: String)
    case kakaoLoginButtonDidTap
    case appleLoginButtonDidTap
}

// MARK: - LoggedInPresentableListener

protocol LoggedInPresentableListener: AnyObject, HasLoadingStream, HasErrorStream {
    typealias Action = LoggedInPresentableAction
    typealias State = LoggedInPresentableState
    
    func sendAction(_ action: Action)
    var state: Observable<State> { get }
}

// MARK: - LoggedInViewController

final class LoggedInViewController:
    BaseViewController,
    LoggedInPresentable,
    LoggedInViewControllable,
    ErrorStreamBindable,
    LoadingStreamBindable
{
    // MARK: Constants
    
    private enum UI {
        static let headerViewHeight = 173
        static let authSupportedViewHeight = 64
        static let leadingTrailingMargin = 16
    }
    
    // MARK: UI Components
    
    private lazy var scrollView = UIScrollView()
    
    private lazy var scrollContentView = UIView()
    
    private lazy var headerView = OnBoardingHeaderView()
    
    private lazy var emailTextFieldView = CustomTextFieldView()
        .builder
        .with {
            $0.fetchLeftTopLabelText(text: Strings.Onboarding.email)
            $0.fetchRightTopLabelText(text: Strings.Onboarding.emailwarning)
        }
        .build()
    
    private lazy var passwordTextFieldView = PasswordTextFieldView()
        .builder
        .with {
            $0.fetchLeftTopLabelText(text: Strings.Onboarding.password)
            $0.fetchRightTopLabelText(text: Strings.Onboarding.passwordwarning)
        }
        .build()
    
    private lazy var authSupportedView = AuthSupportedView()
    
    private lazy var bottomButtonView = BottomButtonsView()
    
    // MARK: - Properties
    
    weak var listener: LoggedInPresentableListener?
    
    private let actionRelay = PublishRelay<LoggedInPresentableListener.Action>()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        bind(listener: self.listener)
    }
    
    // MARK: Override
    
    override func isNeedCustomNavigationBarView() -> Bool {
        false
    }
    
    override func navigationLeftButtonDidTapped() {
        popViewController(animated: false)
    }
}

// MARK: Private methods

extension LoggedInViewController {}

// MARK: - Bind listener

extension LoggedInViewController {
    private func bind(listener: LoggedInPresentableListener?) {
        guard let listener = listener else { return }
        self.bindActionRelay()
        bindActions()
        bindState(from: listener)
    }
    
    private func bindActionRelay() {
        self.actionRelay.asObservable()
            .bind(with: self, onNext: { owner, action in
                owner.listener?.sendAction(action)
            })
            .disposed(by: disposeBag)
    }
}

// MARK: - Binding Action

extension LoggedInViewController {
    private func bindActions() {
        bindTextFieldsAction()
        bindFindButtonDidTapAction()
        bindSignUpButtonDidTapAciton()
        bindLocalButtonDidTapAction()
        bindKakaoButtonDidTapAction()
    }
    
    private func bindTextFieldsAction() {
        Observable.combineLatest(emailTextFieldView.textField.rx.text.orEmpty.distinctUntilChanged(),
                                 passwordTextFieldView.textField.rx.text.orEmpty.distinctUntilChanged())
            .map { .textDidChanged(email: $0.0, password: $0.1) }
            .bind(to: self.actionRelay)
            .disposed(by: disposeBag)
    }
    
    private func bindFindButtonDidTapAction() {
        authSupportedView.findButton
            .rx
            .tapWithPreventDuplication()
            .map { .findButtonDidTap }
            .bind(to: self.actionRelay)
            .disposed(by: disposeBag)
    }
    
    private func bindSignUpButtonDidTapAciton() {
        authSupportedView.signUpButton
            .rx
            .tapWithPreventDuplication()
            .map { .signUpButtonDidTap }
            .bind(to: self.actionRelay)
            .disposed(by: disposeBag)
    }
    
    private func bindLocalButtonDidTapAction() {
        bottomButtonView.loginButton
            .rx
            .tapWithPreventDuplication()
            .withLatestFrom (Observable.combineLatest(emailTextFieldView.textField.rx.text.orEmpty,
                                                        passwordTextFieldView.textField.rx.text.orEmpty))
            .map { .localLoginButtonDidTap(email: $0.0, password: $0.1) }
            .bind(to: self.actionRelay)
            .disposed(by: disposeBag)
    }
    
    private func bindKakaoButtonDidTapAction() {
        bottomButtonView.kakaoButton
            .rx
            .tapWithPreventDuplication()
            .map { _ in .kakaoLoginButtonDidTap }
            .bind(to: self.actionRelay)
            .disposed(by: disposeBag)
    }
}

// MARK: - Binding State

extension LoggedInViewController {
    private func bindState(from listener: LoggedInPresentableListener) {
        bindLoadingStream(from: listener)
        bindErrorStream(from: listener)
        self.bindLoggedInbuttonIsEnable(from: listener)
        self.bindValidationTextState(from: listener)
    }

    private func bindLoggedInbuttonIsEnable(from listener: LoggedInPresentableListener) {
        listener.state.map(\.hasLoggedInInput)
            .distinctUntilChanged()
            .asDriver(onErrorDriveWith: .never())
            .drive(self.bottomButtonView.loginButton.rx.isEnabled)
            .disposed(by: disposeBag)
    }
    
    private func bindValidationTextState(from listener: LoggedInPresentableListener) {
        listener.state
            .map(\.isValidEmailFormat)
            .asDriver(onErrorDriveWith: .never())
            .drive(self.emailTextFieldView.rx.isValidFormatted)
            .disposed(by: disposeBag)

        listener.state
            .map(\.isValidPasswordFormat)
            .asDriver(onErrorDriveWith: .empty())
            .drive(self.passwordTextFieldView.rx.isValidFormatted)
            .disposed(by: disposeBag)
    }
}

// MARK: Layout

extension LoggedInViewController {
    private func setupUI() {
        contentView.backgroundColor = Asset.Colors.mainBackground.color
        contentView.addSubview(scrollView)
        scrollView.addSubview(scrollContentView)
        scrollContentView.addSubview(headerView)
        scrollContentView.addSubview(emailTextFieldView)
        scrollContentView.addSubview(passwordTextFieldView)
        scrollContentView.addSubview(authSupportedView)
        scrollContentView.addSubview(bottomButtonView)
        
        self.layout()
    }
    
    private func layout() {
        scrollView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        scrollContentView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalTo(contentView)
        }
        headerView.snp.makeConstraints {
            $0.height.equalTo(UI.headerViewHeight)
            $0.leading.trailing.top.equalToSuperview()
        }
        emailTextFieldView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(UI.leadingTrailingMargin)
        }
        passwordTextFieldView.snp.makeConstraints {
            $0.top.equalTo(emailTextFieldView.snp.bottom).offset(22)
            $0.leading.trailing.equalToSuperview().inset(UI.leadingTrailingMargin)
        }
        authSupportedView.snp.makeConstraints {
            $0.top.equalTo(passwordTextFieldView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(UI.leadingTrailingMargin)
            $0.height.equalTo(64)
        }
        bottomButtonView.snp.makeConstraints {
            $0.top.greaterThanOrEqualTo(authSupportedView.snp.bottom).offset(100)
                .priority(249)
            $0.leading.trailing.equalToSuperview().inset(UI.leadingTrailingMargin)
            $0.bottom.greaterThanOrEqualToSuperview().offset(-34).priority(750)
        }
    }
    
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct LoggedInViewControllerPreView: PreviewProvider {
    static var previews: some SwiftUI.View {
        ForEach(Device.deviceNames, id: \.self) { deviceName in
            UIViewControllerPreview {
                let viewController = LoggedInViewController().builder
                    .build()
                
                return UINavigationController(rootViewController: viewController)
            }
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}

#endif
