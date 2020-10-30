//
//  ViewController.swift
//  MVVMExample
//
//  Created by daleijn on 19.07.2020.
//  Copyright © 2020 daleijn. All rights reserved.
//

import UIKit

class UserLoginViewController: UIViewController {
    private let viewModel = UserLoginViewModel()
    
    @IBOutlet weak var txtFieldUsername: BoundTextField! {
        didSet {
            txtFieldUsername.bind(to: viewModel.name)
        }
    }
    
    @IBOutlet weak var txtFieldPassword: BoundTextField! {
        didSet {
            txtFieldPassword.bind(to: viewModel.password)
        }
    }
    
    
    // MARK: - VC Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.viewModel.name.value = "Bilbo Baggins"
        }
    }
    
    
    // MARK: - Actions
    
    @IBAction func loginButtonDidTap(_ sender: Any) {
        
    }
    
    
}

