//
//  MainTabController.swift
//  Instagram
//
//  Created by 김재훈 on 2022/12/21.
//

import UIKit
import Firebase

class MainTabController: UITabBarController{
    
    // MARK: - Lifecycle
    private var user: User? {
        didSet {
            guard let user = user else { return }
            configureViewControllers(withUser: user)

        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        checkIfUserIsLoggedIn()
//        configureViewControllers()
        fetchUser()

    }
    
    // MARK: - API
    
    func fetchUser() {
        UserService.fetchUser { user in
            self.user = user

        }
    }
    
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser == nil{
            DispatchQueue.main.async {
                let controller = LoginController()
                controller.delegate = self
                let nav = UINavigationController(rootViewController: controller)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true , completion: nil)
            }
        }

    }

    
    
    
    
    // MARK: - Helpers
    
    
    func configureViewControllers(withUser user: User ) {
        
    
        let layout = UICollectionViewFlowLayout()
        let feed = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "home_unselected"), selectedImage: #imageLiteral(resourceName: "home_selected"), rootViewController: FeedController(collectionViewLayout: layout))
        
        let search = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "search_unselected"), selectedImage: #imageLiteral(resourceName: "search_selected"), rootViewController: SearchController())
        
        let imageSelector = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "plus_unselected"), selectedImage: #imageLiteral(resourceName: "plus_unselected"), rootViewController: ImageSelectorController())
        
        let notifications = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "like_unselected"), selectedImage: #imageLiteral(resourceName: "like_selected"), rootViewController: NotificationController())
        
//        let profileLayout = UICollectionViewFlowLayout()
        let profileController = ProfileController(user: user)
        let profile = templateNavigationController(unselectedImage: #imageLiteral(resourceName: "profile_unselected"), selectedImage: #imageLiteral(resourceName: "profile_selected"), rootViewController: profileController)
        
        viewControllers = [feed, search, imageSelector, notifications, profile]
        
        tabBar.tintColor = .black
        tabBar.backgroundColor = .white
        
    }
    
    func templateNavigationController(unselectedImage: UIImage, selectedImage: UIImage, rootViewController: UIViewController) -> UINavigationController {
        let nav = UINavigationController(rootViewController: rootViewController)
        nav.tabBarItem.image = unselectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        return nav
        
    }
    
    
}

// MARK: - AuthenticationDelegate
extension MainTabController: AuthenticationDelegate {
    func authenticationDidComplete() {
        fetchUser()
//        print(" 뚜밥  ")
        self.dismiss(animated: true, completion: nil)
    }
}
