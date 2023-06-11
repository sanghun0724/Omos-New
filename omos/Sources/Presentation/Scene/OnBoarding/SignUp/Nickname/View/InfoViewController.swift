//
//  InfoViewController.swift
//  omos
//
//  Created by sangheon on 2023/06/11.
//

import UIKit

class InfoViewController: UIViewController {
    private lazy var infoView = UITextView().builder
        .adjustsFontForContentSizeCategory(true)
        .allowsEditingTextAttributes(false)
        .backgroundColor(Asset.Colors.mainBackground.color)
        .textColor(.white)
        .font(.systemFont(ofSize: 16))
        .build()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Asset.Colors.mainBackground.color
        self.view.addSubview(infoView)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        infoView.frame = view.bounds
    }
    
    /// 이용약관
    func setTermsInfoView() {
       setInfoView(file: "UseInfoText")
    }
    
    /// 개인정보 제공 동의
    func setPolicyInfoView() {
        setInfoView(file: "PrivateInfoText")
    }
    
    private func setInfoView(file: String) {
        let url = Bundle.main.url(forResource: file, withExtension: "rtf")!
        let opts: [NSAttributedString.DocumentReadingOptionKey: Any] =
            [.documentType: NSAttributedString.DocumentType.rtf]
        var dic: NSDictionary?
        let attText = try? NSAttributedString(url: url, options: opts, documentAttributes: &dic)
        self.infoView.text = attText?.string
    }
}
