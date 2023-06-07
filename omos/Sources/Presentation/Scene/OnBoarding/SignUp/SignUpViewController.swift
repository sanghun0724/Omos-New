//
//  SignUpViewController.swift
//  omos
//
//  Created by sangheon on 2023/05/28.
//

import UIKit

import RIBs
import RxCocoa
import RxSwift

// MARK: - SignUpPresentableAction

enum SignUpPresentableAction {
    case emailValidationRequestButtonDidTap(email: String)
    case validationAlertButtonDidTap(inputCode: String)
    case confirmButtonDidTap(emailStatus: Bool, password: String, repassword: String)
}

// MARK: - SignUpPresentableListener

protocol SignUpPresentableListener: AnyObject, HasLoadingStream, HasErrorStream {
    typealias Action = SignUpPresentableAction
    typealias State = SignUpPresentableState
    
    func sendAction(_ action: Action)
    var state: Observable<State> { get }
}

// MARK: - SignUpViewController

final class SignUpViewController:
    BaseViewController,
    SignUpPresentable,
    SignUpViewControllable,
    ErrorStreamBindable,
    LoadingStreamBindable
{
    
    // MARK: - Constants
    
    private enum UI {
        static let headerViewHeight = 173
        static let emailValidationButtonHeight = 20
        static let emailValidationButtonWidth = 100
        static let leadingTrailingMargin = 16
        static let alertWidth = 300
        static let confirmButtonHeight = 48
    }
    
    // MARK: - Properties
    
    weak var listener: SignUpPresentableListener?
    
    private let actionRelay = PublishRelay<SignUpPresentableListener.Action>()
    
    // MARK: - UI Components
    
    private lazy var headerView = OnBoardingHeaderView().builder
        .with {
            $0.fetchTitle(text: Strings.Onboarding.signUp)
        }
        .build()
    
    private lazy var emailTextFieldView = CustomTextFieldView()
        .builder
        .with {
            $0.fetchLeftTopLabelText(text: Strings.Onboarding.email)
            $0.fetchRightTopLabelText(text: Strings.Onboarding.emailwarning)
        }
        .build()
    
    private lazy var emailValidationRequestButton = UIButton().builder
        .with {
            $0.setTitle(Strings.Onboarding.sendCertificationEmail, for: .normal)
            $0.titleLabel?.font = .systemFont(ofSize: 14, weight: .light)
            $0.setTitleColor(Asset.Colors.mainGray4.color, for: .normal)
        }
        .build()
    
    private lazy var passwordTextFieldView = PasswordTextFieldView()
        .builder
        .with {
            $0.fetchLeftTopLabelText(text: Strings.Onboarding.password)
            $0.fetchRightTopLabelText(text: Strings.Onboarding.passwordwarning)
        }
        .build()
    
    private lazy var repasswordTextFieldView = PasswordTextFieldView()
        .builder
        .with {
            $0.fetchLeftTopLabelText(text: Strings.Onboarding.password)
            $0.fetchRightTopLabelText(text: Strings.Onboarding.passwordwarning)
        }
        .build()
    
    private lazy var backContainerView = UIView().builder
        .backgroundColor(.clear)
        .isHidden(true)
        .build()
    
    private lazy var validationCodeAlertView = ValidationCodeAlertView()
    
    private lazy var confirmButton = ConfirmButton(Strings.Onboarding.loggedIn).builder
        .set(\.layer.cornerRadius, to: CommonUI.loginCorner)
        .set(\.layer.masksToBounds, to: true)
        .build()
    
    // MARK: - Initialization & Deinitialization
    
    override init() {
        super.init()
    }
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bind(listener: self.listener)
    }
    
}

// MARK: - Override

extension SignUpViewController {
    override func isNeedCustomNavigationBarView() -> Bool {
        true
    }
    
    override func navigationBarLeftButtonImage() -> UIImage? {
        Asset.Images.Common.arrowLeft.image
    }
    
    override func navigationLeftButtonDidTapped() {
        popViewController(animated: true)
    }
}

// MARK: - Bind listener

extension SignUpViewController {
    private func bind(listener: SignUpPresentableListener?) {
        guard let listener = listener else { return }
        self.bindActionRelay()
        bindActions()
        bindState(from: listener)
    }
    
    private func bindActionRelay() {
        self.actionRelay.asObservable()
            .bind(with: self) { onwer, action in
                onwer.listener?.sendAction(action)
            }
            .disposed(by: disposeBag)
    }
}

// MARK: - Binding Action

extension SignUpViewController {
    private func bindActions() {
        bindEmailValidationRequestButtonDidTapAction()
        bindValidationPopupButtonDidTap()
        bindConfirmButtonDidTap()
    }
    
    private func bindEmailValidationRequestButtonDidTapAction() {
        emailValidationRequestButton
            .rx
            .tapWithPreventDuplication()
            .withLatestFrom(self.emailTextFieldView.textField.rx.text.orEmpty)
            .map { .emailValidationRequestButtonDidTap(email: $0) }
            .bind(to: self.actionRelay)
            .disposed(by: disposeBag)
    }
    
    private func bindValidationPopupButtonDidTap() {
        validationCodeAlertView.varifyButton
            .rx
            .tapWithPreventDuplication()
            .withLatestFrom(self.validationCodeAlertView.codeInputField.rx.text.orEmpty)
            .map { .validationAlertButtonDidTap(inputCode: $0) }
            .bind(to: self.actionRelay)
            .disposed(by: disposeBag)
    }
    
    private func bindConfirmButtonDidTap() {
        confirmButton
            .rx
            .tapWithPreventDuplication()
            .withLatestFrom(
                Observable.combineLatest(self.passwordTextFieldView.textField.rx.text.orEmpty, self.repasswordTextFieldView.textField.rx.text.orEmpty)
            ) // TODO: check
            .map { .confirmButtonDidTap(emailStatus: false, password: $0.0, repassword: $0.1) }
            .bind(to: self.actionRelay)
            .disposed(by: disposeBag)
    }
}

// MARK: - Binding State

extension SignUpViewController {
    private func bindState(from listener: SignUpPresentableListener) {
        bindLoadingStream(from: listener)
        bindErrorStream(from: listener)
        self.bindValidationEmailState(from: listener)
        self.bindValidationPasswordState(from: listener)
        self.bindisSuccessSendValidationCodeState(from: listener)
        self.bindEmailRegisterValidation(from: listener)
    }
    
    private func bindValidationEmailState(from listener: SignUpPresentableListener) {
        listener.state
            .map(\.isValidEmailFormat)
            .asDriver(onErrorDriveWith: .never())
            .drive(self.emailTextFieldView.rx.isValidFormatted)
            .disposed(by: disposeBag)
    }
    
    private func bindValidationPasswordState(from listener: SignUpPresentableListener) {
        listener.state
            .map(\.isValidPasswordFormat)
            .asDriver(onErrorDriveWith: .empty())
            .drive(self.passwordTextFieldView.rx.isValidFormatted)
            .disposed(by: disposeBag)
    }
    
    private func bindisSuccessSendValidationCodeState(from listener: SignUpPresentableListener) {
        listener.state
            .map(\.isShowAlert)
            .map { !$0 }
            .asDriver(onErrorDriveWith: .empty())
            .drive(self.backContainerView.rx.isHidden)
            .disposed(by: disposeBag)
        
        listener.state
            .map(\.isShowAlert)
            .map { !$0 }
            .asDriver(onErrorDriveWith: .empty())
            .drive(self.validationCodeAlertView.rx.isHidden)
            .disposed(by: disposeBag)
    }
    
    private func bindEmailRegisterValidation(from listener: SignUpPresentableListener) {
        listener.state
            .map(\.isSuccessEmailCertification)
            .distinctUntilChanged()
            .skip(1)
            .asDriver(onErrorDriveWith: .empty())
            .drive(self.validationCodeAlertView.rx.isSuccess)
            .disposed(by: disposeBag)
        
        listener.state
            .map(\.isSuccessEmailCertification)
            .distinctUntilChanged()
            .skip(1)
            .filter { $0 }
            .map ({ _ in "인증 완료 ✅" })
            .asDriver(onErrorDriveWith: .empty())
            .drive(with: self) { owner, title in
                owner.emailValidationRequestButton.setTitle(title, for: .normal)
                owner.emailValidationRequestButton.isUserInteractionEnabled = false 
            }
            .disposed(by: disposeBag)
    }
}

// MARK: - Layout

extension SignUpViewController {
    private func setupUI() {
        contentView.backgroundColor = Asset.Colors.mainBackground.color
        contentView.addSubview(headerView)
        contentView.addSubview(emailTextFieldView)
        contentView.addSubview(emailValidationRequestButton)
        contentView.addSubview(passwordTextFieldView)
        contentView.addSubview(repasswordTextFieldView)
        contentView.addSubview(backContainerView)
        contentView.addSubview(confirmButton)
        backContainerView.addSubview(validationCodeAlertView)
        self.layout()
    }
    
    private func layout() {
        headerView.snp.makeConstraints {
            $0.height.equalTo(UI.headerViewHeight)
            $0.leading.trailing.top.equalToSuperview()
        }
        emailTextFieldView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(UI.leadingTrailingMargin)
        }
        emailValidationRequestButton.snp.makeConstraints {
            $0.top.equalTo(emailTextFieldView.snp.bottom).offset(12)
            $0.right.equalToSuperview().offset(-UI.leadingTrailingMargin)
            $0.width.equalTo(UI.emailValidationButtonWidth)
            $0.height.equalTo(UI.emailValidationButtonHeight)
        }
        passwordTextFieldView.snp.makeConstraints {
            $0.top.equalTo(emailValidationRequestButton.snp.bottom).offset(22)
            $0.leading.trailing.equalToSuperview().inset(UI.leadingTrailingMargin)
        }
        repasswordTextFieldView.snp.makeConstraints {
            $0.top.equalTo(passwordTextFieldView.snp.bottom).offset(22)
            $0.leading.trailing.equalToSuperview().inset(UI.leadingTrailingMargin)
        }
        confirmButton.snp.makeConstraints {
            $0.top.greaterThanOrEqualTo(repasswordTextFieldView.snp.bottom).offset(100)
                .priority(249)
            $0.height.equalTo(UI.confirmButtonHeight)
            $0.leading.trailing.equalToSuperview().inset(UI.leadingTrailingMargin)
            $0.bottom.equalToSuperview().offset(-34).priority(750)
        }
        
        backContainerView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        validationCodeAlertView.snp.makeConstraints {
            $0.center.equalToSuperview()
            $0.width.equalTo(UI.alertWidth)
        }
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct SignUpPreView: PreviewProvider {
    static var previews: some SwiftUI.View {
        ForEach(Device.deviceNames, id: \.self) { deviceName in
            UIViewControllerPreview {
                let viewController = SignUpViewController()
                
                return UINavigationController(rootViewController: viewController)
            }
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}

#endif
