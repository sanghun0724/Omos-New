//
//  BaseCollectionReuseableView.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/23.
//

import UIKit

import RxSwift

class BaseCollectionReusableView:
  UICollectionReusableView,
  BaseViewable,
  Reusable,
  HasDisposeBag,
  HasCompositeDisposable,
  DisposablesManageable
{

  // MARK: - Properties

  var disposeBag = DisposeBag()
  var disposables = CompositeDisposable()

  private(set) var didSetupConstrints: Bool = false

  // MARK: - Initialization & Deinitialization

  override init(frame: CGRect) {
    super.init(frame: frame)
    self.initialize()
  }

  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  deinit {
    disposeDisposables()
  }

  // MARK: - Inheritance

  override func prepareForReuse() {
    super.prepareForReuse()
    resetDisposables()
  }

  // MARK: - Layout Constraints

  override func updateConstraints() {
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
