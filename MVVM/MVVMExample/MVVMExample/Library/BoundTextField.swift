//
//  BoundTextField.swift
//  MVVMExample
//
//  Created by daleijn on 06.08.2020.
//  Copyright © 2020 daleijn. All rights reserved.
//

import UIKit

class BoundTextField: UITextField {
    private var changedClosure: (()->())?
    
    
    // MARK: - API
    
    func bind(to observable: Observable<String>) {
        addTarget(self, action: #selector(valueChanged), for: .editingChanged)
        
        changedClosure = { [weak self] in
            let currentText = self?.text ?? ""
            observable.bindingChanged(to: currentText)
        }
        
        observable.valueChanged = { [weak self] text in
            self?.text = text
        }
    }
    
    
    // MARK: - Impl
    
    @objc private func valueChanged() {
        changedClosure?()
    }
    
}
