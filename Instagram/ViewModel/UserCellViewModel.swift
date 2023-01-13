//
//  UserCellViewModel.swift
//  Instagram
//
//  Created by 김재훈 on 2023/01/05.
//

import Foundation

struct UserCellViewModel {
    
    private let user: User
    
    var profileImageUrl: URL? {
        return URL(string: user.profileImageUrl)
    }
    
    var username: String {
        return user.username
    }
    var fullname: String {
        return user.fullname
    }
    
    init(user: User) {
        self.user = user
    }
    
}
