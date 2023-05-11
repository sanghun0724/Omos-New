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
    HasDisposeBag
{
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
    
}
