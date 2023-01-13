//
//  ImageUploader.swift
//  Instagram
//
//  Created by 김재훈 on 2022/12/21.
//

import FirebaseStorage
import UIKit


struct ImageUploader {
    static func uploadImage(image: UIImage, completion: @escaping(String) -> Void ){
        guard let imageData = image.jpegData(compressionQuality: 0.75) else { return }
        let filename = NSUUID().uuidString
        let ref = Storage.storage().reference(withPath: "/profile_images/\(filename)")
        
        ref.putData(imageData, metadata: nil) { metadata , error in
            if let error = error {
                print( "이미지 업로드 실패. \(error.localizedDescription)" )
                return
            }
            
            ref.downloadURL { (url, error) in
                guard let imageUrl = url?.absoluteString else { return }
                    completion(imageUrl)
            }
        }
    }
    
    
}

