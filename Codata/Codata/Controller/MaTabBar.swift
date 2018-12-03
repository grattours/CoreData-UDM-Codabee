//
//  AppDelegate.swift
//  Codata
//
//  Created by Luc Derosne on 28/11/2018.
//  Copyright © 2018 Luc Derosne. All rights reserved.
//


import UIKit

class MaTabBar: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tabBar.tintColor = .darkGray
        tabBar.unselectedItemTintColor = .lightGray
        
        // changer le background color de ma tabbar
        //tabBar.barTintColor = .yellow
        
        //TabbarTransparente
        //tabBar.barTintColor = .clear
        //tabBar.backgroundImage = UIImage()
    }
}
