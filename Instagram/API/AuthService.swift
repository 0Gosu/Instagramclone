//
//  AuthService.swift
//  Instagram
//
//  Created by 김재훈 on 2022/12/21.
//

import UIKit
import Firebase

struct AuthCredentials {
    let email: String
    let password: String
    let fullname: String
    let username: String
    let profileImage: UIImage
    
    
}


struct AuthService {
    static func logUserIn(withEmail email: String, password: String , completion: @escaping(AuthDataResult?, Error?) -> Void){
        Auth.auth().signIn(withEmail: email, password: password,completion: completion)
    }
    
    
    static func registerUser(withCredential credentials: AuthCredentials, completion: @escaping (Error?) -> Void ) {
        
        ImageUploader.uploadImage(image: credentials.profileImage) { imageuUrl in
            Auth.auth().createUser(withEmail: credentials.email, password: credentials.password) { (result, error) in
                
                if let error = error {
                    print( "유저 등록 실패  \(error.localizedDescription)")
                    return
                }
                
                guard let uid = result?.user.uid else { return }
                let ref = Database.database().reference().child("users").child(uid)
                
                let data: [String: Any] = ["email": credentials.email,
                                           "fullname": credentials.fullname,
                                           "profileImageUrl": imageuUrl,
                                           "uid": uid,
                                           "username": credentials.username]
                ref.updateChildValues(data) { error, ref in
                    print( " 디버그 : 성공적으로 업데이트 함")
                }
                COLLECTION_USERS.document(uid).setData(data, completion: completion)
            }
        }
        
        
    }
    
}
