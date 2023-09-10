//
//  LovedView.swift
//  TodayFeature
//
//  Created by 이상헌 on 2023/09/03.
//  Copyright © 2023 Omos. All rights reserved.
//

import UIKit

import DesignSystem

final class LovedRecordView: BaseView {
    
    // MARK: - Constants
    
    enum UI {
        
    }
    
    // MARK: - UI Components
    
    private lazy var baseView = UIView()
    
    private lazy var backImageView = UIImageView().builder
        .clipsToBounds(true)
        .contentMode(.scaleAspectFill)
        .alpha(0.3)
        .build()
    
    private lazy var albumImageView = UIImageView(image: UIImage(named: "albumCover")).builder
        .contentMode(.scaleAspectFill)
        .clipsToBounds(true)
        .build()
    
    private lazy var trackTitleLabel = UILabel().builder
        .text("노래 제목이 들어갑니다.")
        .textAlignment(.center)
        .textColor(.white)
        .font(.systemFont(ofSize: 16, weight: .light))
        .build()
    
    private lazy var artistAlbumTitleLabel = UILabel().builder
        .text("가수 이름이 들어갑니다")
        .textAlignment(.center)
        .textColor(.white)
        .font(.systemFont(ofSize: 14, weight: .light))
        .build()
    
    private lazy var spotifyImageView = UIImageView(image: UIImage(named: "spotifywithlogo")).builder
        .contentMode(.scaleAspectFill)
        .clipsToBounds(true)
        .build()
    
    private lazy var buttonView = UIButton().builder
        .isUserInteractionEnabled(false)
        .backgroundColor(.clear)
        .set(\.layer.cornerRadius, to: 5)
        .set(\.layer.borderWidth, to: 1)
        .set(\.layer.borderColor, to: UIColor.white.cgColor)
        .with {
            $0.setTitle("레코드 보러가기", for: .normal)
            $0.setTitleColor(.white, for: .normal)
            $0.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        }
        .build()
    
    // MARK: - Initialization & Deinitialization
    
    override func initialize() {
        super.initialize()
        addSubview(baseView)
        baseView.addSubview(backImageView)
        baseView.addSubview(albumImageView)
        baseView.addSubview(trackTitleLabel)
        baseView.addSubview(artistAlbumTitleLabel)
        baseView.addSubview(spotifyImageView)
        baseView.addSubview(buttonView)
        self.layout()
    }
    
    private func layout() {
        baseView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        backImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
        albumImageView.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.447)
            make.width.equalTo(albumImageView.snp.height)
            make.center.equalToSuperview()
        }
        
        trackTitleLabel.snp.makeConstraints { make in
            make.top.lessThanOrEqualTo(albumImageView.snp.bottom).offset(14)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        artistAlbumTitleLabel.snp.makeConstraints { make in
            make.top.equalTo(trackTitleLabel.snp.bottom).offset(4)
            make.leading.trailing.equalTo(trackTitleLabel)
        }
        
        spotifyImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(16)
            make.top.equalToSuperview().offset(20)
            make.width.equalTo(albumImageView).multipliedBy(0.46)
            make.height.equalTo(spotifyImageView.snp.width).multipliedBy(0.3)
        }
        
        buttonView.snp.makeConstraints { make in
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalTo(spotifyImageView)
            make.height.equalTo(spotifyImageView.snp.height).offset(10)
            make.width.equalTo(120)
        }
    }
    
}
