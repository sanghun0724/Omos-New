//
//  BaseLabel.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/20.
//

import UIKit

import RxSwift

public class BaseLabel:
    UILabel,
    BaseViewable,
    HasDisposeBag
{
    // MARK: Properties
    
    public var disposeBag = DisposeBag()
    
    private(set) var didSetupConstrints: Bool = false
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Inheritance
    
    // MARK: - Inheritance

    // MARK: - Layout Constraints

    public override func updateConstraints() {
      self.setupConstraintsIfNeeded()
      super.updateConstraints()
    }

    // MARK: - Internal methods

    func initialize() {
      // Override point
      setNeedsUpdateConstraints()
    }

    func setupConstraints() {
      // Override here
    }

    // MARK: - Private methods

    private func setupConstraintsIfNeeded() {
      guard !self.didSetupConstrints else { return }
      self.setupConstraints()
      self.didSetupConstrints = true
    }
}
