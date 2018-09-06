//
//  ProductViewController.swift
//  LearnCleanArchitecture
//
//  Created by tran.xuan.thien on 9/5/18.
//  Copyright © 2018 tran.xuan.thien. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController, BindableType {
    var viewModel: ProductViewModel!

    @IBOutlet weak var tableView: LoadMoreTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }

    func configView() {
        tableView.do {
            $0.estimatedRowHeight = 550
            $0.rowHeight = UITableViewAutomaticDimension
            $0.register(cellType: ProductCell.self)
        }
        tableView.rx
            .setDelegate(self)
            .disposed(by: rx.disposeBag)
    }
    
    func bindViewModel() {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK: - UITableViewDelegate
extension ProductViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

// MARK: - StoryboardSceneBased
extension ProductViewController: StoryboardSceneBased {
    static var sceneStoryboard = Storyboards.product
}
