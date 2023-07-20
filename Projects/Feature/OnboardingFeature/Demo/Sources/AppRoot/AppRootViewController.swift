//
//  AppRootViewController.swift
//  omos
//
//  Created by sangheon on 2023/04/09.
//

import UIKit

import RIBs
import RxSwift
import RxCocoa

import DesignSystem

protocol AppRootPresentableListener: AnyObject {
    func attachRIB(type: DemoSingleRIBType)
}

final class AppRootViewController:
    BaseViewController,
    AppRootPresentable,
    AppRootViewControllable {
    
    // MARK: UI Components
    
    private lazy var tableView = UITableView().builder
        .rowHeight(UITableView.automaticDimension)
        .build()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        bindTableView()
    }
    
    weak var listener: AppRootPresentableListener?

    func bindTableView() {
        Observable.just(DemoSingleRIBType.allCases)
        .bind(to: tableView.rx.items) { tableView, row, element in
            let cell = UITableViewCell()
            cell.textLabel?.text = element.rawValue
            return cell
        }
        .disposed(by: disposeBag)
        
        tableView.rx.itemSelected
        .bind { [weak self] indexPath in
            self?.listener?.attachRIB(type: DemoSingleRIBType.allCases[indexPath.row])
                self?.tableView.deselectRow(at: indexPath, animated: true)
            }.disposed(by: disposeBag)
        
    }
}

// MARK: - Layout

extension AppRootViewController {
    private func setupUI() {
        contentView.addSubview(tableView)
        self.layout()
    }
    
    private func layout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

enum DemoSingleRIBType: String, CaseIterable {
    case 처음_메인_온보딩_화면
    case 이메일_회원가입
    case 비밀번호_회원가입
    case 약관동의
    case 닉네임_회원가입
}
