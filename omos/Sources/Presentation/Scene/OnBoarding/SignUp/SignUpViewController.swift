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
    
}

// MARK: - SignUpPresentableListener

protocol SignUpPresentableListener: AnyObject {
    typealias Action = SignUpPresentableAction
    typealias State = SignUpPresentableState
    
    func sendAction(_ action: Action)
    var state: Observable<State> { get }
}

// MARK: - SignUpViewController

final class SignUpViewController:
    BaseViewController,
    SignUpPresentable,
    SignUpViewControllable
{
    
    // MARK: - Constants
    
    private enum UI {
        static let headerViewHeight = 173
        static let emailValidationButtonHeight = 20
        static let emailValidationButtonWidth = 100
        static let leadingTrailingMargin = 16
    }
    
    // MARK: - Properties
    
    weak var listener: SignUpPresentableListener?
    
    private let actionRelay = PublishRelay<SignUpPresentableListener.Action>()
    
    // MARK: - UI Components
    
    private lazy var headerView = OnBoardingHeaderView().builder
        .with {
            $0.fetchTitle(text: "회원가입")
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
            $0.setTitle("인증메일 보내기", for: .normal)
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
    
    private lazy var checkPasswordTextFieldView = PasswordTextFieldView()
        .builder
        .with {
            $0.fetchLeftTopLabelText(text: Strings.Onboarding.password)
            $0.fetchRightTopLabelText(text: Strings.Onboarding.passwordwarning)
        }
        .build()
    
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
        bindUI()
        bind(listener: self.listener)
    }
    
    // MARK: Override
    
    override func isNeedCustomNavigationBarView() -> Bool {
        false
    }
}


// MARK: Private methods

extension SignUpViewController {}

// MARK: - Bind UI

extension SignUpViewController {
    private func bindUI() {
        
    }
}

// MARK: - Bind listener

extension SignUpViewController {
    private func bind(listener: SignUpPresentableListener?) {
        guard let listener = listener else { return }
        
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
        
    }
}

// MARK: - Binding State

extension SignUpViewController {
    private func bindState(from listener: SignUpListener) {
        
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
        contentView.addSubview(checkPasswordTextFieldView)
        contentView.addSubview(confirmButton)
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
        checkPasswordTextFieldView.snp.makeConstraints {
            $0.top.equalTo(passwordTextFieldView.snp.bottom).offset(22)
            $0.leading.trailing.equalToSuperview().inset(UI.leadingTrailingMargin)
        }
        confirmButton.snp.makeConstraints {
            $0.top.greaterThanOrEqualTo(checkPasswordTextFieldView.snp.bottom).offset(100)
                .priority(249)
            $0.height.equalTo(100)
            $0.leading.trailing.equalToSuperview().inset(UI.leadingTrailingMargin)
            $0.bottom.equalToSuperview().offset(-34).priority(750)
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
