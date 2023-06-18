//
//  BaseImageView.swift
//  RibsReactorkitClone
//
//  Created by sangheon on 2023/04/20.
//

import UIKit

import RxSwift

class BaseImageView:
    UIImageView,
    BaseViewable,
    HasDisposeBag
{
    
    var disposeBag = DisposeBag()
    
    private(set) var didSetupConstrints: Bool = false
    
    //MARK: init deinit
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    
    override init(image: UIImage?) {
        super.init(image: image)
        self.initialize()
    }
    
    override init(image: UIImage?, highlightedImage: UIImage?) {
        super.init(image: image, highlightedImage: highlightedImage)
        self.initialize()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
      fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Inheritance
    
    // MARK: Layout Constrints
    
    override func updateConstraints() {
        self.setupConstraintsIfNeeded()
        super.updateConstraints()
    }
    
    func initialize() {
        // override
        setNeedsUpdateConstraints()
    }
    
    private func setupConstraintsIfNeeded() {
        guard !self.didSetupConstrints else { return }
        self.setupConstraints()
        self.didSetupConstrints = true 
    }
    
    func setupConstraints() {
        // override here
    }
    
}
