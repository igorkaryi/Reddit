//
//  BaseViewController.swift
//  Reddit
//
//  Created by Igor Karyi on 08.11.2019.
//  Copyright © 2019 IK. All rights reserved.
//

import UIKit
import JGProgressHUD

class BaseViewController: UIViewController {
    
    let hud = JGProgressHUD(style: .dark)

    func showHud() {
        hud.show(in: self.view)
    }
    
    func hideHud() {
        hud.dismiss()
    }

}
