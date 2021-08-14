//
//  MainCoordinator.swift
//  nft_marketplace_ios
//
//  Created by Heriberto Prieto on 7/20/21.
//

import UIKit

class MainCoordinator {
    
    // MARK: - Tab
    
    enum Tab: Int, RawRepresentable {
        case home
        
        public var title: String {
            let title: String
            
            switch self {
            case .home:
                title = "Home"
            }
            
            return title
        }
        
        public var image: UIImage? {
            let imageName: String
            
            switch self {
            case .home:
                imageName = "house"
            }
            
            return UIImage(systemName: imageName)
        }
        
        public static func TabBarItem(for tab: Tab) -> UITabBarItem {
            UITabBarItem(
                title: tab.title,
                image: tab.image,
                tag: tab.rawValue
            )
        }
    }
    
    // MARK: - Destination
    
    enum Destination: Int, RawRepresentable {
        case root
    }
    
    // MARK: - Private Properties
    
    private let window: UIWindow?
    
    // MARK: - NavigationControllers
    
    private(set) lazy var rootNavigationController: UINavigationController = {
        UINavigationController(
            rootViewController: make(viewControllerFor: .root)
        )
    }()
    
    // MARK: - ViewControllers
    
    private(set) lazy var cameraViewController: CameraViewController = {
        let controller = CameraViewController()
        return controller
    }()
    
    private(set) lazy var poseViewController: PoseViewController = {
        PoseViewController()
    }()
    
    // MARK: - Private Methods
    
    private func make(viewControllerFor destination: Destination) -> UIViewController {
        let viewController: UIViewController
        
        switch destination {
        case .root:
            viewController = poseViewController
        }
        
        return viewController
    }
    
    // MARK: - Public Methods
    
    public func show(viewControllerFor destination: Destination = .root) {
        let viewController: UIViewController = make(viewControllerFor: destination)
        
        // assure desired viewController is not already presented
        guard rootNavigationController.presentedViewController != viewController else {
            return
        }
        
        switch destination {
        case .root:
            rootNavigationController.viewControllers = [rootNavigationController]
        }
    }
    
    // MARK: - Init
    
    init(window: UIWindow?) {
        self.window = window
        self.window?.rootViewController = rootNavigationController
    }
}
