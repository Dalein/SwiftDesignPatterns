//
//  UserLoginViewModel.swift
//  MVVMExample
//
//  Created by daleijn on 09.08.2020.
//  Copyright © 2020 daleijn. All rights reserved.
//

import Foundation

enum UserValidationState {
    case valid
    case invalid(String)
}

class UserLoginViewModel {
    var username: Observable<String> = Observable("")
    var password: Observable<String> = Observable("")
    
    private let minUsernameLength = 4
    private let minPasswordLength = 5
    
    
    func validate() {
        
    }
    
    func login(_ completion: Result<String, NSError>) {
        
    }
    
}
