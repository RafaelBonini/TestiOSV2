//
//  AppDelegate+Methods.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 22/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import UIKit
extension AppDelegate {
    func startApp() {
        let rootVc = LoginViewController(viewModel: LoginViewModel())
        let navController =  UINavigationController(rootViewController: rootVc)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()
    }
}
