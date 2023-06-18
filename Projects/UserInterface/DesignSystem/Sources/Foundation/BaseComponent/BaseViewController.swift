//
//  BaseCollectionView.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/16.
//

import UIKit

import RxSwift
import RxRelay

open class BaseViewController:
    UIViewController,
    CustomNavigationPresentable,
    HasSetupConstraints,
    HasDetachAction,
    HasAlertable,
    HasDisposeBag
{
    
    private(set) lazy var navigationBarView = CustomNavigationBarView().builder
        .with {
            $0.leftImageButton.isHidden = !navigationBarShowLeftButton()
            $0.leftImageButton.setImage(navigationBarLeftButtonImage(), for: .normal)
            $0.leftImageButton.setTitle(navigationBarLeftButtonText(), for: .normal)
            $0.leftImageButton.setTitleColor(navigationBarTitleTextColor(), for: .normal)
    
            $0.rightImageButton.isHidden = !navigationBarShowRightButton()
            $0.rightImageButton.setImage(navigationBarRightButtonImage(), for: .normal)
            $0.rightImageButton.setTitle(navigationBarRightButtonText(), for: .normal)
            $0.rightImageButton.setTitleColor(navigationBarTitleTextColor(), for: .normal)
            
            $0.titleLabel.isHidden = !navigationBarShowTitle()
            $0.titleLabel.text = navigationBarTitleText()
            $0.titleLabel.textColor = navigationBarTitleTextColor()
            $0.titleLabel.font = navigationBarTitleTextFont()

            $0.titleImageView.isHidden = !navigationBarShowImage()
            $0.titleImageView.image = navigationBarTitleImage()
            
            $0.bottomBorderLine.backgroundColor = navigationBarBottomBorderLineColor()

            $0.backgroundColor = navigationBarBackgroundColor()
        }
        .build()
    
    // MARK: Views
    
    private lazy var layoutGuideView = UIView()
    public private(set) lazy var contentView = UIView()
    
    // MARK: Properties
    
    public let detachAction = PublishRelay<Void>()
    public var disposeBag: DisposeBag = DisposeBag()
    
    private(set) var didSetupConstrints: Bool = false
    
    // MARK: - init & deinit
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    public required convenience init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

    deinit {
     print(type(of: self))
    }
    
    // MARK: - View LifeCycle
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        hideOriginNavigationBar()
        view.setNeedsUpdateConstraints()
    }
    
    open override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        guard isMovingToParent || isBeingDismissed else { return }
        self.detachAction.accept(Void())
    }
    
    
    // MARK: Layout Constraints
    
    open override func updateViewConstraints() {
        self.setupConstraintsIfNeeded()
        super.updateViewConstraints()
    }
    
    func setupConstraints() {
        // override
    }
    
    // MARK: Private
    
    private func setupConstraintsIfNeeded() {
        guard !self.didSetupConstrints else { return }
        self.setupConstraints()
        self.baseLayoutSetupConstraints()
        self.didSetupConstrints = true
    }
    
    private func baseLayoutSetupConstraints() {
        view.addSubview(layoutGuideView)
        
        layoutGuideView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            $0.left.equalTo(view.safeAreaLayoutGuide.snp.left)
            $0.right.equalTo(view.safeAreaLayoutGuide.snp.right)
            $0.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
        
        layoutGuideView.addSubview(navigationBarView)
        layoutGuideView.addSubview(contentView)
        
        navigationBarView.snp.makeConstraints {
            $0.left.top.right.equalToSuperview()
            $0.height.equalTo(isNeedCustomNavigationBarView() ? 60 : 0)
        }
        contentView.snp.makeConstraints {
            $0.top.equalTo(navigationBarView.snp.bottom)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(layoutGuideView)
        }
    }
    
}
