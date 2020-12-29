//
//  MainRouter.swift
//  TestCleanSwift
//
//  Created by Alexander Myskin on 29.12.2020.
//

import UIKit

protocol SceneRoutingLogic {
    func routeToRedScene()
}

class MainRouter: SceneRoutingLogic {
    
    weak var viewController: UIViewController?
    
    func routeToRedScene() {
        let redVC = RedViewController()
        self.viewController?.present(redVC, animated: true)
    }

}
