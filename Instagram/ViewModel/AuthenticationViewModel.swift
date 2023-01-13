//
//  AuthenticationViewModel.swift
//  Instagram
//
//  Created by 김재훈 on 2022/12/21.
//

import UIKit

protocol FormViewModel {
    func updateForm()
}


protocol AuthenticationViewMoel {
    var formIsVaild: Bool { get }
    var buttonBackgroundColor: UIColor { get }
    var buttonTitleColor: UIColor { get }
}


struct LoginViewModel {
    var email: String?
    var password: String?
    
    var formIsVaild: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
    
    var buttonBackgroundColor: UIColor {
       
        return formIsVaild ? #colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1) : #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
        
    }
    var buttonTitleColor: UIColor {
        return formIsVaild ? .white : UIColor(white: 1, alpha: 0.67)
    }
}

struct RegistrationViewModel: AuthenticationViewMoel {
    var email: String?
    var password: String?
    var fullname: String?
    var username: String?
    
    var formIsVaild: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
        && fullname?.isEmpty == false && username?.isEmpty == false
    }
    
    var buttonBackgroundColor: UIColor {
        return formIsVaild ? #colorLiteral(red: 0.476841867, green: 0.5048075914, blue: 1, alpha: 1) : #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1).withAlphaComponent(0.5)
    }
    
    var buttonTitleColor: UIColor {
        return formIsVaild ? .white : UIColor(white: 1, alpha: 0.67)
    }
    
}
