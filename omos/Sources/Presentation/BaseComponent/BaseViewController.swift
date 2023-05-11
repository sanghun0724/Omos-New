//
//  BaseCollectionView.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/16.
//

import UIKit

import RxSwift
import RxRelay

class BaseViewController:
    UIViewController,
    HasSetupConstraints,
    HasDetachAction,
    HasDisposeBag,
    HasCustomNavigationBarView
{
    // MARK: Views
    
    private lazy var layoutGuideView = UIView()
    lazy var contentView = UIView()
    
    // MARK: Properties
    
    let detachAction = PublishRelay<Void>()
    var disposeBag: DisposeBag = DisposeBag()
    
    private(set) var didSetupConstrints: Bool = false
    
    // MARK: - init & deinit
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required convenience init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }

    deinit {
     print(type(of: self))
    }
    
    // MARK: - View LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setNeedsUpdateConstraints()
        baseLayoutSetupConstraints()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        guard isMovingToParent || isBeingDismissed else { return }
        self.detachAction.accept(Void())
    }
    
    
    // MARK: Layout Constraints
    
    override func updateViewConstraints() {
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
        self.didSetupConstrints = true
    }
    
    private func baseLayoutSetupConstraints() {
        view.addSubview(layoutGuideView)
        layoutGuideView.snp.makeConstraints {
            $0.top.equalTo(view.safeArea.top)
            $0.left.equalTo(view.safeArea.left)
            $0.right.equalTo(view.safeArea.right)
            $0.bottom.equalTo(view.safeArea.bottom)
        }
        
        layoutGuideView.addSubview(customTopNavigationBarView)
        layoutGuideView.addSubview(contentView)
        customTopNavigationBarView.snp.makeConstraints {
            $0.left.top.right.equalToSuperview()
            $0.height.equalTo(topAppBarIsShow() ? 60 : 0)
        }
        contentView.snp.makeConstraints {
            $0.top.equalTo(customTopNavigationBarView.snp.bottom)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(layoutGuideView)
        }
    }
    
}
