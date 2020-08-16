//
//  AnchorMethods.swift
//  ViewUtilsApp
//
//  Created by Akaash Dev on 30/05/20.
//  Copyright © 2020 Akaash Dev. All rights reserved.
//

import UIKit

public extension UIView {
    func anchorTop(with view: UIView? = nil, following guideType: LayoutGuideType = .none, padding: CGFloat = 0) {
        constraintAnchoringTop(with: view, following: guideType, padding: padding).activate()
    }
    
    func anchorBottom(with view: UIView? = nil, following guideType: LayoutGuideType = .none, padding: CGFloat = 0) {
        constraintAnchoringBottom(with: view, following: guideType, padding: padding).activate()
    }
    
    func anchorLeading(with view: UIView? = nil, following guideType: LayoutGuideType = .none, padding: CGFloat = 0) {
        constraintAnchoringLeading(with: view, following: guideType, padding: padding).activate()
    }
    
    func anchorTrailing(with view: UIView? = nil, following guideType: LayoutGuideType = .none, padding: CGFloat = 0) {
        constraintAnchoringTrailing(with: view, following: guideType, padding: padding).activate()
    }
    
    func anchorLeft(with view: UIView? = nil, following guideType: LayoutGuideType = .none, padding: CGFloat = 0) {
        constraintAnchoringLeft(with: view, following: guideType, padding: padding).activate()
    }
    
    func anchorRight(with view: UIView? = nil, following guideType: LayoutGuideType = .none, padding: CGFloat = 0) {
        constraintAnchoringRight(with: view, following: guideType, padding: padding).activate()
    }
}

public extension UIView {
    func alignCenter(with view: UIView? = nil, following guideType: LayoutGuideType = .none, offset: CGPoint = .zero) {
        constraintsToCenter(in: view, following: guideType, offset: offset).activate()
    }
    
    func alignHorizontallyCenter(with view: UIView? = nil, following guideType: LayoutGuideType = .none, xOffset: CGFloat = 0) {
        constraintAnchoringCenterX(with: view, following: guideType, xOffset: xOffset).activate()
    }
    
    func alignVerticallyCenter(with view: UIView? = nil, following guideType: LayoutGuideType = .none, yOffset: CGFloat = 0) {
        constraintAnchoringCenterY(with: view, following: guideType, yOffset: yOffset).activate()
    }
}

public extension UIView {
    func fill(view: UIView? = nil, following guideType: LayoutGuideType = .none, insets: UIEdgeInsets = .zero) {
        constraints(toFill: view, following: guideType, insets: insets).activate()
    }
    
    func fillWidth(of view: UIView? = nil, following guideType: LayoutGuideType = .none, padding: CGFloat = 0) {
        constraintsFillingWidth(of: view, following: guideType, padding: padding).activate()
    }
    
    func fillHeight(of view: UIView? = nil, following guideType: LayoutGuideType = .none, padding: CGFloat = 0) {
        constraintsFillingHeight(of: view, following: guideType, padding: padding).activate()
    }
}
