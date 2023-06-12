//
//  BaseView.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/22.
//

import UIKit

import RxSwift

class BaseView:
    UIView,
    BaseViewable,
    HasDisposeBag
{
    
    // MARK: Properties
    
    var disposeBag = DisposeBag()
    
    private(set) var didSetupConstrints: Bool = false
    
    // MARK: Inii & deinit
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    override func updateConstraints() {
        self.setupConstraintsIfNeeded()
        super.updateConstraints()
    }
    
    func initialize() {
        // overridePoint
        setNeedsUpdateConstraints()
    }
    
    func setupConstraints() {
        // override here
    }
    
    // MARK: - Private methods
    
    private func setupConstraintsIfNeeded() {
        guard !self.didSetupConstrints else { return }
        self.setupConstraints()
        self.didSetupConstrints = true
    }
}

