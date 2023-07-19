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
    
    private let items = Observable.just(
        [
        "emailSignUp",
        "passwordSignUp",
        "Agreement",
        "Nickname"
        ]
    )

    func bindTableView() {
        items
        .bind(to: tableView.rx.items) { tableView, row, element in
            let cell = UITableViewCell()
            cell.textLabel?.text = element
            return cell
        }
        .disposed(by: disposeBag)
        
        tableView.rx.itemSelected
        .bind { [weak self] indexPath in
            print(indexPath)
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
