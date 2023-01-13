//
//  ProfileController.swift
//  Instagram
//
//  Created by 김재훈 on 2022/12/21.
//

import UIKit

private let cellIdentifier = "ProfileCell"
private let headerIdentifier = "ProfileHeader"

class ProfileController: UICollectionViewController {
    // MARK: - Properties
    
    private var user: User
    
    
    // MARK: - Lifecycle
    
    init(user: User) {
        self.user = user
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    override func viewDidLoad() {
        super .viewDidLoad()
        configureCollectionView()
//        fetchUser()
    }
    
    // MARK: - API
//    func fetchUser() {
//        UserService.fetchUser { user in
//            self.user = user
//            self.navigationItem.title = user.username
//        }
//    }

    // MARK: - Helpers
    
    func configureCollectionView() {
        navigationItem.title = user.username
        collectionView.backgroundColor = .white
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: cellIdentifier)
        collectionView.register(profileHeader.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: headerIdentifier)
    }
    
}
// MARK: -  UICollectionViewDataSource

extension ProfileController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ProfileCell
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
//        print("헤더함수 호출")
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifier,
                                                                     for: indexPath) as! profileHeader
        header.delegate = self
        
        header.viewModel = ProfileHeaderViewModel(user: user)
        
//            print( " 유저 세팅 실패 ")
        
        
            return header
    }
}

// MARK: - UICollectionViewDelegate
extension ProfileController {
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ProfileController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 2) / 3
        return CGSize(width: width, height: width)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 240)
    }
}
