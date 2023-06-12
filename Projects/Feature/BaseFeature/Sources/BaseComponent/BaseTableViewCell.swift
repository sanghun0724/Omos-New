//
//  BaseTableViewCell.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/19.
//

import UIKit

import RxSwift

class BaseTableViewCell:
    UITableViewCell,
    BaseViewable,
    Reusable,
    HasDisposeBag,
    HasCompositeDisposable,
    DisposablesManageable
{
    
    // MARK: Properties
    
    var disposeBag = DisposeBag()
    var disposables = CompositeDisposable()
    
    private(set) var didSetupConstrints: Bool = false
    
    // MARK: - initialization & Deinitialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.initialize()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
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
    
    // MARK: Layout Constraints
    
    override func updateConstraints() {
        self.setupConstraintsIfNeeded()
        super.updateConstraints()
    }
    
    func initialize() {
        // Override point
        setNeedsUpdateConstraints()
        selectionStyle = .none
    }
    
    
    func setupConstraints() {
        // Override here
    }
    
    private func setupConstraintsIfNeeded() {
        guard !self.didSetupConstrints else { return }
        self.setupConstraints()
        self.didSetupConstrints = true
    }

}
