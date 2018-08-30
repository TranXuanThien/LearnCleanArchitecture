//
//  MainViewController.swift
//  LearnCleanArchitecture
//
//  Created by tran.xuan.thien on 8/30/18.
//  Copyright © 2018 tran.xuan.thien. All rights reserved.
//

import UIKit
import Reusable
import RxCocoa
import RxSwift
import NSObject_Rx

class MainViewController: UIViewController, BindableType {

    @IBOutlet weak var tableView: UITableView!
    var viewModel: MainViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        configView()
    }
    
    private func configView() {
        tableView.do {
            $0.rowHeight = 60
            $0.register(cellType: MenuCell.self)
            $0.delegate = self
        }
    }

    func bindViewModel() {
        let input = MainViewModel.Input(loadTrigger: Driver.just(()))
        let output = viewModel.transform(input)
        
        output.menuList
            .drive(tableView.rx.items) { tableView, index, menu in
                return tableView.dequeueReusableCell(for: IndexPath(row: index, section: 0),
                                                     cellType: MenuCell.self)
                    .then({
                        $0.configView(with: menu)
                    })
        }.disposed(by: rx.disposeBag)
    }
    
    deinit {
        logDeinit()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - StoryboardSceneBased
extension MainViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.main
}

extension MainViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}


