//
//  AppRootRouter.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import RIBs

import DesignSystem
import OnboardingFeatureInterface

protocol AppRootInteractable:
    Interactable,
    OnboardingListener,
    EmailSignUpListener,
    PasswordListener,
    AgreementListener,
    NicknameListener
{
    var router: AppRootRouting? { get set }
    var listener: AppRootListener? { get set }
    var presentationDelegateProxy: AdaptivePresentationControllerDelegateProxy { get }
}

protocol AppRootViewControllable: ViewControllable {
    // TODO: Declare methods the router invokes to manipulate the view hierarchy.
}

final class AppRootRouter:
    LaunchRouter<AppRootInteractable,
    AppRootViewControllable>,
    AppRootRouting
{
    private let onboardingBuilder: OnboardingBuildable
    private var onboardingRouter: OnboardingRouting?
    
    private let passwordBuilder: PasswordBuildable
    private var passwordRouter: PasswordRouting?
    
    private let emailSignUpBuilder: EmailSignUpBuildable
    private var emailSignUpRouter: EmailSignUpRouting?
    
    private let agreementBuilder: AgreementBuildable
    private var agreementRouter: AgreementRouting?
    
    private let nicknameBuilder: NicknameBuildable
    private var nicknameRouter: NicknameRouting?
    
    init(
        interactor: AppRootInteractable,
        viewController: AppRootViewControllable,
        onboardingBuilder: OnboardingBuildable,
        passwordBuilder: PasswordBuildable,
        emailSignUpBuilder: EmailSignUpBuildable,
        agreementBuilder: AgreementBuildable,
        nicknameBuilder: NicknameBuildable
    ) {
        self.onboardingBuilder = onboardingBuilder
        self.passwordBuilder = passwordBuilder
        self.emailSignUpBuilder = emailSignUpBuilder
        self.agreementBuilder = agreementBuilder
        self.nicknameBuilder = nicknameBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
    
    override func didLoad() {
        super.didLoad()
        
    }
    
    func attachOnboardingRIB() {
        if onboardingRouter != nil {
            return
        }
        
        let router = onboardingBuilder.build(
            with: OnboardingBuildDependency(
                listener: interactor
            )
        )
        self.onboardingRouter = router
        attachChild(router)
        router.viewControllable.uiviewController.presentationController?.delegate = interactor.presentationDelegateProxy
        viewController.show(router.viewControllable, animated: false, completion: nil)
    }
    
    func detachOnboardingRIB() {
        guard let router = onboardingRouter else { return }
        detachChild(router)
        onboardingRouter = nil
        viewController.remove(router.viewControllable)
    }
    
    func attachPasswordRIB() {
        if passwordRouter != nil {
            return
        }
        let router = passwordBuilder.build(
            with: PasswordBuildDependency(
                listener: interactor
            )
        )
        self.passwordRouter = router
        attachChild(router)
        router.viewControllable.uiviewController.presentationController?.delegate = interactor.presentationDelegateProxy
        viewController.show(router.viewControllable, animated: false, completion: nil)
    }
    
    func detachPasswordRIB() {
        guard let router = passwordRouter else { return }
        detachChild(router)
        passwordRouter = nil
        viewController.remove(router.viewControllable)
    }
    
    func attachEmailSignUpRIB() {
        guard emailSignUpRouter == nil else { return }
        let router = emailSignUpBuilder.build(
            with: EmailSignUpBuildDependency(
                listener: interactor
            )
        )
        emailSignUpRouter = router
        router.viewControllable.uiviewController.presentationController?.delegate = interactor.presentationDelegateProxy
        viewController.show(router.viewControllable)
    }
    
    func detachEmailSignUpRIB() {
        guard let router = emailSignUpRouter else { return }
        detachChild(router)
        emailSignUpRouter = nil
        viewController.remove(router.viewControllable)
    }
    
    func attachAgreementRIB() {
        guard agreementRouter == nil else { return }
        let router = agreementBuilder.build(
            with: AgreementBuildDependency(
                listener: interactor
            )
        )
        agreementRouter = router
        router.viewControllable.uiviewController.presentationController?.delegate = interactor.presentationDelegateProxy
        viewController.show(router.viewControllable)
    }
    
    func detachAgreementRIB() {
        guard let router = agreementRouter else { return }
        detachChild(router)
        agreementRouter = nil
        viewController.remove(router.viewControllable)
    }
    
    func attachNicknameRIB() {
        guard nicknameRouter == nil else { return }
        let router = nicknameBuilder.build(
            with: NicknameBuildDependency(
                listener: interactor
            )
        )
        attachChild(router)
        router.viewControllable.uiviewController.presentationController?.delegate = interactor.presentationDelegateProxy
        viewController.show(router.viewControllable)
    }
    
    func detachNicknameRIB() {
        guard let router = nicknameRouter else { return }
        detachChild(router)
        nicknameRouter = nil
        viewController.remove(router.viewControllable)
    }
}
