//
//  CoreMethods.swift
//  ViewUtilsApp
//
//  Created by Akaash Dev on 26/05/20.
//  Copyright © 2020 Akaash Dev. All rights reserved.
//

import UIKit

final class Helper {
    // MARK: Anchor Methods
    class func constraintAnchoring<Anchor>(_ anchor: NSLayoutAnchor<Anchor>, with otherAnchor: NSLayoutAnchor<Anchor>, offset: CGFloat) -> NSLayoutConstraint {
        return anchor.constraint(equalTo: otherAnchor, constant: offset)
    }
    
    class func lessThanOrEqualToConstraintAnchoring<Anchor>(_ anchor: NSLayoutAnchor<Anchor>, with otherAnchor: NSLayoutAnchor<Anchor>, offset: CGFloat) -> NSLayoutConstraint {
        return anchor.constraint(lessThanOrEqualTo: otherAnchor, constant: offset)
    }
    
    class func greaterThanOrEqualToConstraintAnchoring<Anchor>(_ anchor: NSLayoutAnchor<Anchor>, with otherAnchor: NSLayoutAnchor<Anchor>, offset: CGFloat) -> NSLayoutConstraint {
        return anchor.constraint(greaterThanOrEqualTo: otherAnchor, constant: offset)
    }
    
    // MARK: Dimension Methods
    class func setConstant(_ value: CGFloat, for dimension: NSLayoutDimension) -> NSLayoutConstraint {
        return dimension.constraint(equalToConstant: value)
    }
    
    class func setMinimum(value: CGFloat, for dimension: NSLayoutDimension) -> NSLayoutConstraint {
        return dimension.constraint(greaterThanOrEqualToConstant: value)
    }
    
    class func setMaximum(value: CGFloat, for dimension: NSLayoutDimension) -> NSLayoutConstraint {
        return dimension.constraint(lessThanOrEqualToConstant: value)
    }
    
    // MARK: Relative Dimension Methods
    class func setDimension(_ dimension: NSLayoutDimension, relativeTo otherDimension: NSLayoutDimension, multipliedBy factor: CGFloat) -> NSLayoutConstraint {
        return dimension.constraint(equalTo: otherDimension, multiplier: factor)
    }
    
    class func setMinimumDimension(_ dimension: NSLayoutDimension, relativeTo otherDimension: NSLayoutDimension, multipliedBy factor: CGFloat) -> NSLayoutConstraint {
        return dimension.constraint(greaterThanOrEqualTo: otherDimension, multiplier: factor)
    }
    
    class func setMaximumDimension(_ dimension: NSLayoutDimension, relativeTo otherDimension: NSLayoutDimension, multipliedBy factor: CGFloat) -> NSLayoutConstraint {
        return dimension.constraint(lessThanOrEqualTo: otherDimension, multiplier: factor)
    }
}
