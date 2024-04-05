//
//  MainTabViewController.swift
//  Chessbic
//
//  Created by Marcel Canhisares on 2023-09-09.
//

import Foundation
import UIKit
import Inject

class MainTabViewController: UITabBarController, UITabBarControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create Tab one
        let tabOne = GameViewController()
        let tabOneItem = UITabBarItem(title: "Chess", image: UIImage(named: "chess.png"), tag: 0)
        
        tabOne.tabBarItem = tabOneItem
        
        
        // Create Tab two
        let tabTwo = UINavigationController(rootViewController: MenuViewController())
        let tabTwoItem = UITabBarItem(title: "Menu", image: UIImage(named: "menu.png"), tag: 1)
        
        tabTwo.tabBarItem = tabTwoItem
        
        
        self.viewControllers = [tabOne, tabTwo]
    }
    
    // UITabBarControllerDelegate method
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        
    }
}


