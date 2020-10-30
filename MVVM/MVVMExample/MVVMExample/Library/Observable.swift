//
//  Observable.swift
//  MVVMExample
//
//  Created by daleijn on 06.08.2020.
//  Copyright © 2020 daleijn. All rights reserved.
//

import Foundation

class Observable<ObservedType> {
    private var _value: ObservedType?
    
    
    // MARK: - API
    
    var valueChanged: ((ObservedType?) -> ())?
    
    var value: ObservedType? {
        get {
            return _value
        }
        set {
            _value = newValue
            valueChanged?(_value)
        }
    }
    
    func bindingChanged(to newValue: ObservedType) {
        _value = newValue
        print("Value in now: \(newValue)")
    }
    
    
    // MARK: - Init
    
    init(_ value: ObservedType) {
        _value = value
    }
    
}
