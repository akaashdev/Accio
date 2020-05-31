//
//  ConstraintExtension.swift
//  ViewUtilsApp
//
//  Created by Akaash Dev on 26/05/20.
//  Copyright © 2020 Akaash Dev. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
    
    @discardableResult
    func activate() -> NSLayoutConstraint {
        isActive = true
        return self
    }
    
    @discardableResult
    func deactivate() -> NSLayoutConstraint {
        isActive = false
        return self
    }
    
    @discardableResult
    func prioritize(_ priority: UILayoutPriority) -> NSLayoutConstraint {
        self.priority = priority
        return self
    }
    
    @discardableResult
    func setConstant(_ constant: CGFloat) -> NSLayoutConstraint {
        self.constant = constant
        return self
    }
    
}


extension Array where Element: NSLayoutConstraint {
    
    @discardableResult
    func activate() -> [Element] {
        forEach { $0.activate() }
        return self
    }
    
    @discardableResult
    func deactivate() -> [Element] {
        forEach { $0.deactivate() }
        return self
    }
    
    @discardableResult
    func prioritize(_ priority: UILayoutPriority) -> [Element] {
        forEach { $0.prioritize(priority) }
        return self
    }
    
    @discardableResult
    func setConstant(_ constant: CGFloat) -> [Element] {
        forEach { $0.setConstant(constant) }
        return self
    }
    
}
