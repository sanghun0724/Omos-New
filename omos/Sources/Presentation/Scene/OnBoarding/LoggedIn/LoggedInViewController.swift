//
//  LoggedInViewController.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//


import UIKit

import RIBs
import RxCocoa
import RxDataSources
import RxSwift

// MARK: - LoggedInPresentableAction

enum LoggedInPresentableAction {
    case viewDidLoad
    case localLoginButtonDidTap(email: String, password: String)
    case kakaoLoginButtonDidTap
}

// MARK: - LoggedInPresentableListener

protocol LoggedInPresentableListener: AnyObject {
    typealias Action = LoggedInPresentableAction
    typealias State = LoggedInPresentableState
    
    func sendAction(_ action: Action)
    var state: Observable<State> { get }
}

// MARK: - LoggedInViewController

final class LoggedInViewController:
    BaseViewController,
    LoggedInPresentable,
    LoggedInViewControllable
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
            $0.fetchLeftTopLabelText(text: "이메일")
            $0.fetchRightTopLabelText(text: "이메일을 입력해주세요.")
        }
        .build()
    
    private lazy var passwordTextFieldView = CustomTextFieldView()
        .builder
        .with {
            $0.fetchLeftTopLabelText(text: "비밀번호")
            $0.fetchRightTopLabelText(text: "비밀번호를 입력해주세요.")
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
}

// MARK: Private methods

extension LoggedInViewController {}

// MARK: Bind UI

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
        bindViewDidLoadAction()
        bindLocalButtonDidTapAction()
        bindKakaoButtonDidTapAction()
    }
    
    private func bindViewDidLoadAction() {
        rx.viewDidLoad
            .throttle(.seconds(1), latest: false, scheduler: MainScheduler.instance)
            .map { _ in .viewDidLoad }
            .bind(to: self.actionRelay)
            .disposed(by: disposeBag)
    }
    
    private func bindLocalButtonDidTapAction() {
        //TODO: 원리 체크
        bottomButtonView.loginButton
            .rx
            .tapWithPreventDuplication()
            .debug("tap")
            .flatMapLatest { [emailTextFieldView, passwordTextFieldView] in
                Observable.combineLatest(emailTextFieldView.textField.rx.text.orEmpty,
                                         passwordTextFieldView.textField.rx.text.orEmpty)
                }
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
        self.bindValidationState(from: listener)
    }
    
    private func bindValidationState(from listener: LoggedInPresentableListener) {
        //TODO: TEMP
        listener.state.map(\.isValidLoggedIn)
            .distinctUntilChanged()
            .asDriver(onErrorDriveWith: .never())
            .drive(self.bottomButtonView.kakaoButton.rx.isHidden)
            .disposed(by: disposeBag)
    }
    
}

// MARK: Layout

extension LoggedInViewController {
    private func setupUI() {
        view.backgroundColor = Asset.Colors.mainBackground.color
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
            $0.top.equalTo(headerView.snp.bottom)
            $0.leading.trailing.equalToSuperview().inset(UI.leadingTrailingMargin)
        }
        passwordTextFieldView.snp.makeConstraints {
            $0.top.equalTo(emailTextFieldView.snp.bottom)
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
            $0.bottom.greaterThanOrEqualToSuperview().offset(-34)
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
