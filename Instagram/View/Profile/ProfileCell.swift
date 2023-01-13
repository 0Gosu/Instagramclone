//
//  ProfileCell.swift
//  Instagram
//
//  Created by 김재훈 on 2022/12/21.
//

import UIKit

class ProfileCell: UICollectionViewCell {
    
    // MARK: - Properties
    private let postImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = #imageLiteral(resourceName: "66F43709-962A-470C-8A62-412548056309")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        return iv
    }()
    
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .lightGray
        
        addSubview(postImageView)
        postImageView.fillSuperview()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("초기화 에러")
    }
}

