//
//  NicknameViewController.swift
//  omos
//
//  Created by sangheon on 2023/06/10.
//

import UIKit

import RIBs
import RxCocoa
import RxSwift

// MARK: - NicknamePresentableAction

enum NicknamePresentableAction {
    case nicknameTextFieldDidChange(nickname: String)
    case toggleTerms(toggled: Bool)
    case togglePolicy(toggled: Bool)
    case showTermsDetail
    case showPolicyDetail
    case confirmButtonDidTap
    case detach
}

// MARK: - NicknamePresentableListener

protocol NicknamePresentableListener: AnyObject, HasLoadingStream, HasErrorStream {
    typealias Action = NicknamePresentableAction
    typealias State = NicknamePresentableState
    
    func sendAction(_ action: Action)
    var state: Observable<State> { get }
}

// MARK: - NicknameViewController

final class NicknameViewController:
    BaseViewController,
    NicknamePresentable,
    NicknameViewControllable,
    CloseButtonBindable,
    ErrorStreamBindable,
    LoadingStreamBindable
{
    
    // MARK: - Constants
    
    private enum UI {
        static let headerViewHeight = 173
        static let leadingTrailingMargin = 20
        static let separatedLineHeight = 1
        static let confirmButtonHeight = 48
        static let agreementHeight = 20
    }
    
    // MARK: - Properties
    
    weak var listener: NicknamePresentableListener?
    
    private let actionRelay = PublishRelay<NicknamePresentableListener.Action>()
    
    // MARK: - UI Components
    
    private lazy var headerView = OnBoardingHeaderView().builder
        .with {
            $0.fetchTitle(text: Strings.Onboarding.signUp)
        }
        .build()
    
    private lazy var nicknameTextFieldView = CustomTextFieldView()
        .builder
        .with {
            $0.fetchLeftTopLabelText(text: Strings.Onboarding.nickname)
            $0.fetchRightTopLabelText(text: Strings.Onboarding.nicknameWarning)
        }
        .build()
    
    private lazy var separatedLineView = UIView().builder
        .backgroundColor(Asset.Colors.mainGray7.color)
        .build()
    
    private lazy var termAgreementView = AgreementView()
    
    private lazy var policyAgreementView = AgreementView()
    
    private lazy var confirmButton = ConfirmButton(Strings.Common.next, disableText: Strings.Common.next).builder
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
}

// MARK: Private methods

extension NicknameViewController {}

// MARK: - Bind UI

extension NicknameViewController {
    private func bindUI() {
        
    }
}

// MARK: - Bind listener

extension NicknameViewController {
    private func bind(listener: NicknamePresentableListener?) {
        guard let listener = listener else { return }
        bindLoadingStream(from: listener)
        bindErrorStream(from: listener)
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

extension NicknameViewController {
    private func bindActions() {
        self.bindNicknameTextFieldDidChange()
        self.bindToggleTerms()
        self.bindTogglePolicy()
        self.bindShowTermsDetail()
        self.bindShowPolicyDetail()
        self.bindConfirmButton()
    }
    
    private func bindNicknameTextFieldDidChange() {
        nicknameTextFieldView.textField
            .rx
            .text
            .orEmpty
            .changed
            .map { .nicknameTextFieldDidChange(nickname: $0) }
            .bind(to: self.actionRelay)
            .disposed(by: disposeBag)
    }
    
    private func bindToggleTerms() {
        termAgreementView.checkCircleView
            .rx
            .tap
            .preventDuplication()
            .scan(false) { lastState, _ in !lastState }
            .map { .toggleTerms(toggled: $0) }
            .bind(to: self.actionRelay)
            .disposed(by: disposeBag)
    }
    
    private func bindTogglePolicy() {
        policyAgreementView.checkCircleView
            .rx
            .tap
            .preventDuplication()
            .scan(false) { lastState, _ in !lastState }
            .map { .togglePolicy(toggled: $0) }
            .bind(to: self.actionRelay)
            .disposed(by: disposeBag)
    }
    
    private func bindShowTermsDetail() {
        termAgreementView.showButton
            .rx
            .tap
            .preventDuplication()
            .map { .showTermsDetail }
            .bind(to: self.actionRelay)
            .disposed(by: disposeBag)
    }
    
    private func bindShowPolicyDetail() {
        policyAgreementView.showButton
            .rx
            .tap
            .preventDuplication()
            .map { .showPolicyDetail }
            .bind(to: self.actionRelay)
            .disposed(by: disposeBag)
    }
    
    private func bindConfirmButton() {
        confirmButton
            .rx
            .tap
            .preventDuplication()
            .map { .confirmButtonDidTap }
            .bind(to: self.actionRelay)
            .disposed(by: disposeBag)
    }
}

// MARK: - Binding State

extension NicknameViewController {
    private func bindState(from listener: NicknamePresentableListener) {
        
    }
}

// MARK: - Layout

extension NicknameViewController {
    private func setupUI() {
        contentView.backgroundColor = Asset.Colors.mainBackground.color
        contentView.addSubview(headerView)
        contentView.addSubview(nicknameTextFieldView)
        contentView.addSubview(separatedLineView)
        contentView.addSubview(termAgreementView)
        contentView.addSubview(policyAgreementView)
        contentView.addSubview(confirmButton)
        self.layout()
    }
    
    private func layout() {
        headerView.snp.makeConstraints {
            $0.height.equalTo(UI.headerViewHeight)
            $0.leading.trailing.top.equalToSuperview()
        }
        nicknameTextFieldView.snp.makeConstraints {
            $0.top.equalTo(headerView.snp.bottom).offset(20)
            $0.leading.trailing.equalToSuperview().inset(UI.leadingTrailingMargin)
        }
        separatedLineView.snp.makeConstraints {
            $0.top.equalTo(nicknameTextFieldView.snp.bottom).offset(26)
            $0.height.equalTo(UI.separatedLineHeight)
            $0.leading.trailing.equalToSuperview().inset(UI.leadingTrailingMargin)
        }
        termAgreementView.snp.makeConstraints {
            $0.top.equalTo(separatedLineView.snp.bottom).offset(24)
            $0.height.equalTo(UI.agreementHeight)
            $0.leading.trailing.equalToSuperview().inset(UI.leadingTrailingMargin)
        }
        policyAgreementView.snp.makeConstraints {
            $0.top.equalTo(termAgreementView.snp.bottom).offset(12)
            $0.height.equalTo(UI.agreementHeight)
            $0.leading.trailing.equalToSuperview().inset(UI.leadingTrailingMargin)
        }
        confirmButton.snp.makeConstraints {
            $0.top.greaterThanOrEqualTo(policyAgreementView.snp.bottom).offset(100)
                .priority(249)
            $0.height.equalTo(UI.confirmButtonHeight)
            $0.leading.trailing.equalToSuperview().inset(UI.leadingTrailingMargin)
            $0.bottom.equalToSuperview().offset(-34).priority(750)
        }
        
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI

struct NicknamePreView: PreviewProvider {
    static var previews: some SwiftUI.View {
        ForEach(Device.deviceNames, id: \.self) { deviceName in
            UIViewControllerPreview {
                let viewController = NicknameViewController()
                
                return UINavigationController(rootViewController: viewController)
            }
            .previewDevice(PreviewDevice(rawValue: deviceName))
            .previewDisplayName(deviceName)
        }
    }
}

#endif
