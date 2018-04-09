//
//  MyTabBarController.swift
//  MyLocations
//
//  Created by Fernanda Araújo on 08/04/18.
//  Copyright © 2018 thoughtworks. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override var childViewControllerForStatusBarStyle:
        UIViewController? {
        return nil
    }
}
