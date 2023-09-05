//
//  Cell.swift
//  DesignSystem
//
//  Created by 이상헌 on 2023/09/05.
//  Copyright © 2023 Omos. All rights reserved.
//

import UIKit

// MARK: - PreviewRecordCell

public class PreviewRecordCell:
    BaseCollectionViewCell
{
    
    // MARK: - Constants
    
    enum UI {
        
    }
    
    // MARK: - UI Components
    
    private lazy var coverView: UIView = {
        let view = UIView()
        return view
    }()
    
    private lazy var backImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "test"))
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .mainBackGround
        imageView.clipsToBounds = true
        imageView.alpha = 0.4
        return imageView
    }()
    
    private lazy var albumImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "albumCover"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var labelCoverView: UIView = {
        let view = UIView()
        view.layer.cornerCurve = .continuous
        view.layer.backgroundColor = UIColor(red: 0.388, green: 0.388, blue: 0.4, alpha: 0.5).cgColor
        return view
    }()
    
    private lazy var spotifyImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "spotify"))
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "노래제목이 들어갑니다.노래제목이 들어갑니다.노래제목이 들어갑니다."
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var subTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .mainGrey4
        label.text = "노래제목이 들어갑니다.노래제목이 들어갑니다.노래제목이 들어갑니다."
        label.font = .systemFont(ofSize: 12, weight: .light)
        label.textAlignment = .left
        return label
    }()
    
    private lazy var descLabel: UILabel = {
        let label = UILabel()
        label.text = "record main title here..노래제목이 들어갑니다.노래제목이 들어갑니다.노래제목이 들어갑니다.노래제목이 들어갑니다"
        label.font = .systemFont(ofSize: 16, weight: .light)
        label.textColor = .white
        label.textAlignment = .left
        label.numberOfLines = 2
        return label
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "by. nickname"
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 12, weight: .light)
        return label
    }()
    
    private lazy var dummyView: UIView = {
        let view = UIView()
        view.backgroundColor = .mainOrange
        return view
    }()
    
    // MARK: - Initialization & Deinitialization
    
    override func initialize() {
        super.initialize()
        addSubview(coverView)
        coverView.addSubview(backImageView)
        labelCoverView.addSubview(titleLabel)
        labelCoverView.addSubview(albumImageView)
        labelCoverView.addSubview(subTitleLabel)
        labelCoverView.addSubview(spotifyImageView)
        coverView.addSubview(labelCoverView)
        coverView.addSubview(descLabel)
        coverView.addSubview(nameLabel)
        self.layout()
    }
    
    override func setupConstraints() {
      super.setupConstraints()
      layout()
    }
    
}

// MARK: - Layout

extension PreviewRecordCell {
    private func layout() {
        coverView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().inset(14)
            nameLabel.sizeToFit()
        }
        
        descLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(14)
            make.bottom.equalTo(nameLabel.snp.top).offset(-8)
            descLabel.sizeToFit()
        }
        
        labelCoverView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(48)
        }
        
        albumImageView.snp.makeConstraints { make in
            make.leading.top.bottom.equalToSuperview()
            make.width.equalTo(albumImageView.snp.height)
        }
        
        spotifyImageView.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.48)
            make.width.equalTo(spotifyImageView.snp.height)
            make.trailing.equalToSuperview().offset(-12)
            make.centerY.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(albumImageView.snp.trailing).offset(10)
            make.trailing.equalTo(spotifyImageView.snp.leading).offset(-14)
            make.top.equalToSuperview().offset(4)
        }
        
        subTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(4)
            make.trailing.leading.equalTo(titleLabel)
            make.bottom.equalToSuperview().offset(-6)
        }
    }
}
