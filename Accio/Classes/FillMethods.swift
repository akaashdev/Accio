//
//  FillMethods.swift
//  ViewUtilsApp
//
//  Created by Akaash Dev on 30/05/20.
//  Copyright © 2020 Akaash Dev. All rights reserved.
//

import UIKit

public extension UIView {
    
    func fill(view: UIView? = nil, following guideType: LayoutGuideType = .none, insets: UIEdgeInsets = .zero) {
        anchorLeading(with: view, following: guideType, padding: insets.left)
        anchorTrailing(with: view, following: guideType, padding: -insets.right)
        anchorTop(with: view, following: guideType, padding: insets.top)
        anchorBottom(with: view, following: guideType, padding: -insets.bottom)
    }
    
    func fillWidth(of view: UIView? = nil, following guideType: LayoutGuideType = .none, padding: CGFloat = 0) {
        anchorLeading(with: view, following: guideType, padding: padding)
        anchorTrailing(with: view, following: guideType, padding: -padding)
    }
    
    func fillHeight(of view: UIView? = nil, following guideType: LayoutGuideType = .none, padding: CGFloat = 0) {
        anchorTop(with: view, following: guideType, padding: padding)
        anchorBottom(with: view, following: guideType, padding: -padding)
    }
    
}


public extension UIView {
    
    func alignCenter(with view: UIView? = nil, following guideType: LayoutGuideType = .none, offset: CGPoint = .zero) {
        alignHorizontallyCenter(with: view, following: guideType, xOffset: offset.x)
        alignVerticallyCenter(with: view, following: guideType, yOffset: offset.y)
    }
    
    func alignHorizontallyCenter(with view: UIView? = nil, following guideType: LayoutGuideType = .none, xOffset: CGFloat = 0) {
        constraintAnchoringCenterX(with: view, following: guideType).setConstant(xOffset).activate()
    }
    
    func alignVerticallyCenter(with view: UIView? = nil, following guideType: LayoutGuideType = .none, yOffset: CGFloat = 0) {
        constraintAnchoringCenterY(with: view, following: guideType).setConstant(yOffset).activate()
    }
    
}
