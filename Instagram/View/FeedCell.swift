//
//  FeedCell.swift
//  Instagram
//
//  Created by 김재훈 on 2022/12/21.
//

import UIKit

class FeedCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = #imageLiteral(resourceName: "5ACE8996-5D58-4FD0-8E0A-E28A6A8AA512")
        return iv
    }()
    
    private lazy var usernameButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("짱구", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 13)
        button.addTarget(self, action: #selector(didTapUsername), for: .touchUpInside)
        return button
    }()
    
    private let postImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.isUserInteractionEnabled = true
        iv.image = #imageLiteral(resourceName: "5ACE8996-5D58-4FD0-8E0A-E28A6A8AA512")
        return iv
        
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(#imageLiteral(resourceName: "like_unselected"),for: .normal)
        return button
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(#imageLiteral(resourceName: "comment"),for: .normal)
        return button
    }()
    
    private lazy var shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .black
        button.setImage(#imageLiteral(resourceName: "send2"),for: .normal)
        return button
    }()
    
    private let likesLabel: UILabel = {
        let label = UILabel()
        label.text = "좋아요 123,203개"
        label.font = UIFont.boldSystemFont(ofSize: 13)
        return label
    }()
    private let captionLabel: UILabel = {
        let label = UILabel()
        label.text = "댓글 932개 모두 보기"
        label.font = UIFont.systemFont(ofSize: 12)
        label.textColor = .lightGray
        return label
    }()
    private let postTimeLabel: UILabel = {
        let label = UILabel()
        label.text = "1분 전"
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textColor = .lightGray
        return label
    }()
    
    
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        backgroundColor = .white
        
        addSubview(profileImageView)
        profileImageView.anchor(top: topAnchor, left: leftAnchor, paddingTop: 12, paddingLeft: 12)
        profileImageView.setDimensions(height: 40, width: 40)
        profileImageView.layer.cornerRadius = 40 / 2
        
        addSubview(usernameButton)
        usernameButton.centerY(inView: profileImageView, leftAnchor: profileImageView.rightAnchor, paddingLeft: 8)
        
        addSubview(postImageView)
        postImageView.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 8)
        postImageView.heightAnchor.constraint(equalTo: widthAnchor, multiplier: 1).isActive = true
        
        configureActionButton()
        addSubview(likesLabel)
        likesLabel.anchor(top: likeButton.bottomAnchor, left: leftAnchor, paddingTop: -4, paddingLeft: 8)
        addSubview(captionLabel)
        captionLabel.anchor(top: likesLabel.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
        addSubview(postTimeLabel)
        postTimeLabel.anchor(top: captionLabel.bottomAnchor, left: leftAnchor, paddingTop: 8, paddingLeft: 8)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Actions
    
    @objc func didTapUsername() {
        print("did tap username")
    }
    
    // MARK: - Helpers
    
    func configureActionButton() {
        let stackview = UIStackView(arrangedSubviews: [likeButton,commentButton,shareButton])
        stackview.axis = .horizontal
        stackview.distribution = .fillEqually
        
        addSubview(stackview)
        stackview.anchor(top: postImageView.bottomAnchor , width: 120 ,height: 50)
    }
    
}

