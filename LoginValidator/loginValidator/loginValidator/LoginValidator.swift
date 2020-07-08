//
//  LoginValidator.swift
//  loginValidator
//
//  Created by 12dot on 02.07.2020.
//  Copyright © 2020 12dot. All rights reserved.
//

import Foundation


struct LoginValidator {

    func isLoginValid(login: String) -> Bool{
        let loginTest = NSPredicate(format: "SELF MATCHES %@", "^[a-zA-Z][a-zA-Z0-9.-]{2,31}$")
        return loginTest.evaluate(with: login)
    }
}
