//
//  File.swift
//  CafeNibm
//
//  Created by isuru on 4/15/21.
//  Copyright © 2021 isuru. All rights reserved.
//

import Foundation
class CheckEmail{
    static func isValidEmail(email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
