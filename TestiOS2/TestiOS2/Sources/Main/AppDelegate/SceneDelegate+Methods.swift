//
//  SceneDelegate+Methods.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 22/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import UIKit
extension SceneDelegate {
    func startApp(with scene: UIScene) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.windowScene = windowScene
        let rootVc = LoginViewController(viewModel: LoginViewModel())
        let navController =  UINavigationController(rootViewController: rootVc)
        window?.rootViewController = navController
        window?.makeKeyAndVisible()

    }
}
