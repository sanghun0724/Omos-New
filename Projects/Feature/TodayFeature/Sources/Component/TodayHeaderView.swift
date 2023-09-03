//
//  TodayHeaderView.swift
//  TodayFeature
//
//  Created by 이상헌 on 2023/09/03.
//  Copyright © 2023 Omos. All rights reserved.
//

import UIKit

import DesignSystem

final class TodayHeaderView: BaseView {
    
    // MARK: - Constants
    
    enum UI {
        
    }
    
    // MARK: - UI Components
    
    let groundView = UIView().builder
        .backgroundColor(.clear)
        .build()
    
    let backImageView = UIImageView().builder
        .contentMode(.scaleAspectFill)
        .clipsToBounds(true)
        .with {
            let random = Int.random(in: 1...7)
            switch random {
            case 1:
                $0.image = UIImage(named: "photo1")
            case 2:
                $0.image = UIImage(named: "photo2")
            case 3:
                $0.image = UIImage(named: "photo3")
            case 4:
                $0.image = UIImage(named: "photo4")
            case 5:
                $0.image = UIImage(named: "photo5")
            case 6:
                $0.image = UIImage(named: "photo6")
            case 7:
                $0.image = UIImage(named: "photo7")
            default:
                $0.image = UIImage(named: "photo1")
            }
        }
        .build()
    
    let backView = UIView().builder
        .backgroundColor(.clear)
        .build()

    let omosImageView = UIImageView().builder
        .image(UIImage(named: "logo"))
        .contentMode(.scaleAspectFit)
        .build()

    let notiButton = UIButton().builder
        .isHidden(true)
        .with {
            $0.setImage(UIImage(named: "bell"), for: .normal)
        }
        .build()

    let decoLabel = UILabel().builder
        .text("현재 OMOS DJ들이\n가장 많이 기록하고 있는,")
        .textColor(.white)
        .font(.systemFont(ofSize: 16, weight: .light))
        .numberOfLines(2)
        .build()

    let todayLabel = UILabel().builder
        .text("OMOS' PICK")
        .textColor(.white)
        .font(.systemFont(ofSize: 22, weight: .medium))
        .build()

    let albumImageView = UIImageView().builder
        .image(UIImage(named: "albumCover"))
        .contentMode(.scaleToFill)
        .build()
    
    let spotifyImageView = UIImageView().builder
        .image(UIImage(named: "spotify"))
        .contentMode(.scaleAspectFill)
        .build()

    let songTitleLabel = UILabel().builder
        .text("노래 제목이 들어갑니다.")
        .textColor(.white)
        .font(.systemFont(ofSize: 16, weight: .light))
        .build()

    let artistAlbumTitleLabel = UILabel().builder
        .text("가수 이름이 들어갑니다")
        .textColor(.white)
        .font(.systemFont(ofSize: 14, weight: .light))
        .build()

    let createdButton = UIButton().builder
        .isHidden(true)
        .with {
            $0.setImage(UIImage(named: "edit3"), for: .normal)
        }
        .build()
    
    let touchBindButtonView = UIButton().builder
        .backgroundColor(.clear)
        .build()
    
    // MARK: - Initialization & Deinitialization
    
    override func initialize() {
        super.initialize()
        addSubview(groundView)
        groundView.addSubview(backImageView)
        groundView.addSubview(backView)
        backView.addSubview(omosImageView)
        backView.addSubview(notiButton)
        backView.addSubview(decoLabel)
        backView.addSubview(todayLabel)
        backView.addSubview(albumImageView)
        backView.addSubview(songTitleLabel)
        backView.addSubview(artistAlbumTitleLabel)
        backView.addSubview(createdButton)
        backView.addSubview(spotifyImageView)
        backView.addSubview(touchBindButtonView)
        self.layout()
    }
    
    private func layout() {
        groundView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        backImageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }

        backView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(44)
        }

        omosImageView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.top.equalToSuperview().offset(14)
            make.width.equalToSuperview().multipliedBy(0.256)
            make.height.equalTo(omosImageView.snp.width).multipliedBy(0.204)
        }

        notiButton.snp.makeConstraints { make in
            make.top.trailing.equalToSuperview()
            make.height.width.equalTo(24)
        }

        decoLabel.snp.makeConstraints { make in
            make.top.equalTo(omosImageView.snp.bottom).offset(24)
            make.leading.equalToSuperview()
            decoLabel.sizeToFit()
        }

        todayLabel.snp.makeConstraints { make in
            make.top.equalTo(decoLabel.snp.bottom).offset(16)
            make.leading.equalToSuperview()
            todayLabel.sizeToFit()
        }

        albumImageView.snp.makeConstraints { make in
            make.height.equalToSuperview().multipliedBy(0.26)
            make.width.equalTo(albumImageView.snp.height)
            make.leading.equalToSuperview()
            make.top.equalTo(todayLabel.snp.bottom).offset(28).priority(250)
            make.bottom.equalToSuperview().offset(-20).priority(751)
        }

        createdButton.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(albumImageView)
            make.height.equalTo(albumImageView.snp.height).multipliedBy(0.28)
            make.width.equalTo(createdButton.snp.height)
        }

       // bottom part
        songTitleLabel.snp.makeConstraints { make in
            make.leading.equalTo(albumImageView.snp.trailing).offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.centerY.equalTo(albumImageView)
        }
        
        artistAlbumTitleLabel.snp.makeConstraints { make in
            make.leading.trailing.equalTo(songTitleLabel)
            make.top.equalTo(songTitleLabel.snp.bottom).offset(2)
        }
        
        spotifyImageView.snp.makeConstraints { make in
            make.leading.equalTo(songTitleLabel)
            make.height.width.equalTo(21)
            make.bottom.equalTo(songTitleLabel.snp.top).offset(-8)
        }
        
        touchBindButtonView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(albumImageView)
            make.top.equalTo(albumImageView)
        }
    }
    
}
