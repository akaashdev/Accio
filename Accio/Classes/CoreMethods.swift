//
//  CoreMethods.swift
//  ViewUtilsApp
//
//  Created by Akaash Dev on 26/05/20.
//  Copyright © 2020 Akaash Dev. All rights reserved.
//

import UIKit

extension UIView {
    
    func constraintAnchoring<Anchor>(_ anchor: NSLayoutAnchor<Anchor>, with otherAnchor: NSLayoutAnchor<Anchor>) -> NSLayoutConstraint {
        return anchor.constraint(equalTo: otherAnchor)
    }
    
    func lessThanOrEqualToConstraintAnchoring<Anchor>(_ anchor: NSLayoutAnchor<Anchor>, with otherAnchor: NSLayoutAnchor<Anchor>) -> NSLayoutConstraint {
        return anchor.constraint(lessThanOrEqualTo: otherAnchor)
    }
    
    func greaterThanOrEqualToConstraintAnchoring<Anchor>(_ anchor: NSLayoutAnchor<Anchor>, with otherAnchor: NSLayoutAnchor<Anchor>) -> NSLayoutConstraint {
        return anchor.constraint(greaterThanOrEqualTo: otherAnchor)
    }
    
}


extension UIView {
    
    func setConstant(_ value: CGFloat, for dimension: NSLayoutDimension) -> NSLayoutConstraint {
        return dimension.constraint(equalToConstant: value)
    }
    
    func setMinimum(value: CGFloat, for dimension: NSLayoutDimension) -> NSLayoutConstraint {
        return dimension.constraint(greaterThanOrEqualToConstant: value)
    }
    
    func setMaximum(value: CGFloat, for dimension: NSLayoutDimension) -> NSLayoutConstraint {
        return dimension.constraint(lessThanOrEqualToConstant: value)
    }
    
}


extension UIView {
    
    func setDimension(_ dimension: NSLayoutDimension, relativeTo otherDimension: NSLayoutDimension, multipliedBy factor: CGFloat) -> NSLayoutConstraint {
        return dimension.constraint(equalTo: otherDimension, multiplier: factor)
    }
    
    func setMinimumDimension(_ dimension: NSLayoutDimension, relativeTo otherDimension: NSLayoutDimension, multipliedBy factor: CGFloat) -> NSLayoutConstraint {
        return dimension.constraint(greaterThanOrEqualTo: otherDimension, multiplier: factor)
    }
    
    func setMaximumDimension(_ dimension: NSLayoutDimension, relativeTo otherDimension: NSLayoutDimension, multipliedBy factor: CGFloat) -> NSLayoutConstraint {
        return dimension.constraint(lessThanOrEqualTo: otherDimension, multiplier: factor)
    }
    
}
