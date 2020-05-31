//
//  DimensionMethods.swift
//  ViewUtilsApp
//
//  Created by Akaash Dev on 31/05/20.
//  Copyright © 2020 Akaash Dev. All rights reserved.
//

import UIKit

public extension UIView {
    
    func setConstantWidth(_ width: CGFloat) {
        setConstant(width, for: widthAnchor).activate()
    }
    
    func setMinimumWidth(_ width: CGFloat) {
        setMinimum(value: width, for: widthAnchor).activate()
    }
    
    func setMaximumWidth(_ width: CGFloat) {
        setMaximum(value: width, for: widthAnchor).activate()
    }
    
    func setConstantHeight(_ height: CGFloat) {
        setConstant(height, for: heightAnchor).activate()
    }
    
    func setMinimumHeight(_ height: CGFloat) {
        setMinimum(value: height, for: heightAnchor).activate()
    }
    
    func setMaximumHeight(_ height: CGFloat) {
        setMaximum(value: height, for: heightAnchor).activate()
    }
    
}


public extension UIView {
    
    func setConstantSize(width: CGFloat, height: CGFloat) {
        setConstantWidth(width)
        setConstantHeight(height)
    }
    
    func setMinimumSize(width: CGFloat, height: CGFloat) {
        setMinimumWidth(width)
        setMinimumHeight(height)
    }
    
    func setMaximumSize(width: CGFloat, height: CGFloat) {
        setMaximumWidth(width)
        setMaximumHeight(height)
    }
    
}


public extension UIView {
    
    func setWidth(relativeTo dimension: NSLayoutDimension, multipliedBy factor: CGFloat = 1, constant: CGFloat = 0) {
        setDimension(widthAnchor, relativeTo: dimension, multipliedBy: factor)
            .setConstant(constant)
            .activate()
    }
    
    func setHeight(relativeTo dimension: NSLayoutDimension, multipliedBy factor: CGFloat = 1, constant: CGFloat = 0) {
        setDimension(heightAnchor, relativeTo: dimension, multipliedBy: factor)
            .setConstant(constant)
            .activate()
    }
    
    func setMinimumWidth(relativeTo dimension: NSLayoutDimension, multipliedBy factor: CGFloat = 1, constant: CGFloat = 0) {
        setMinimumDimension(widthAnchor, relativeTo: dimension, multipliedBy: factor)
            .setConstant(constant)
            .activate()
    }
    
    func setMinimumHeight(relativeTo dimension: NSLayoutDimension, multipliedBy factor: CGFloat = 1, constant: CGFloat = 0) {
        setMinimumDimension(heightAnchor, relativeTo: dimension, multipliedBy: factor)
            .setConstant(constant)
            .activate()
    }
    
    func setMaximumWidth(relativeTo dimension: NSLayoutDimension, multipliedBy factor: CGFloat = 1, constant: CGFloat = 0) {
        setMaximumDimension(widthAnchor, relativeTo: dimension, multipliedBy: factor)
            .setConstant(constant)
            .activate()
    }
    
    func setMaximumHeight(relativeTo dimension: NSLayoutDimension, multipliedBy factor: CGFloat = 1, constant: CGFloat = 0) {
        setMaximumDimension(heightAnchor, relativeTo: dimension, multipliedBy: factor)
            .setConstant(constant)
            .activate()
    }
    
}
