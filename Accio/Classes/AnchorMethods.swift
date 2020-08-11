//
//  AnchorMethods.swift
//  ViewUtilsApp
//
//  Created by Akaash Dev on 30/05/20.
//  Copyright © 2020 Akaash Dev. All rights reserved.
//

import UIKit

public extension UIView {
    func anchorTop(with view: UIView? = nil, following guideType: LayoutGuideType = .none, padded offset: CGFloat = 0) {
        constraintAnchoringTop(with: view, following: guideType).setConstant(offset).activate()
    }
    
    func anchorBottom(with view: UIView? = nil, following guideType: LayoutGuideType = .none, padded offset: CGFloat = 0) {
        constraintAnchoringBottom(with: view, following: guideType).setConstant(-offset).activate()
    }
    
    func anchorLeading(with view: UIView? = nil, following guideType: LayoutGuideType = .none, padded offset: CGFloat = 0) {
        constraintAnchoringLeading(with: view, following: guideType).setConstant(offset).activate()
    }
    
    func anchorTrailing(with view: UIView? = nil, following guideType: LayoutGuideType = .none, padded offset: CGFloat = 0) {
        constraintAnchoringTrailing(with: view, following: guideType).setConstant(-offset).activate()
    }
    
    func anchorLeft(with view: UIView? = nil, following guideType: LayoutGuideType = .none, padded offset: CGFloat = 0) {
        constraintAnchoringLeft(with: view, following: guideType).setConstant(offset).activate()
    }
    
    func anchorRight(with view: UIView? = nil, following guideType: LayoutGuideType = .none, padded offset: CGFloat = 0) {
        constraintAnchoringRight(with: view, following: guideType).setConstant(-offset).activate()
    }
}
