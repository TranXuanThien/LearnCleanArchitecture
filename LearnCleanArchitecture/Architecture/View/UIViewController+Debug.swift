//
//  UIViewController+Debug.swift
//  LearnCleanArchitecture
//
//  Created by tran.xuan.thien on 8/30/18.
//  Copyright © 2018 tran.xuan.thien. All rights reserved.
//

import UIKit

extension UIViewController {
    func logDeinit() {
        print(String(describing: type(of: self)) + " deinit")
    }
}
