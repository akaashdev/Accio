//
//  ConstraintMethods.swift
//  ViewUtilsApp
//
//  Created by Akaash Dev on 26/05/20.
//  Copyright © 2020 Akaash Dev. All rights reserved.
//

import UIKit

public extension UIView {
    
    @discardableResult
    func constraintAnchoringTop(with view: UIView?, following guideType: LayoutGuideType = .none) -> NSLayoutConstraint {
        return constraintAnchoring(.top, of: view, following: guideType)
    }
    
    @discardableResult
    func constraintAnchoringBottom(with view: UIView?, following guideType: LayoutGuideType = .none) -> NSLayoutConstraint {
        return constraintAnchoring(.bottom, of: view, following: guideType)
    }
    
    @discardableResult
    func constraintAnchoringLeading(with view: UIView?, following guideType: LayoutGuideType = .none) -> NSLayoutConstraint {
        return constraintAnchoring(.leading, of: view, following: guideType)
    }
    
    @discardableResult
    func constraintAnchoringTrailing(with view: UIView?, following guideType: LayoutGuideType = .none) -> NSLayoutConstraint {
        return constraintAnchoring(.trailing, of: view, following: guideType)
    }
    
    @discardableResult
    func constraintAnchoringLeft(with view: UIView?, following guideType: LayoutGuideType = .none) -> NSLayoutConstraint {
        return constraintAnchoring(.left, of: view, following: guideType)
    }
    
    @discardableResult
    func constraintAnchoringRight(with view: UIView?, following guideType: LayoutGuideType = .none) -> NSLayoutConstraint {
        return constraintAnchoring(.right, of: view, following: guideType)
    }
    
    @discardableResult
    func constraintAnchoringCenterX(with view: UIView?, following guideType: LayoutGuideType = .none) -> NSLayoutConstraint {
        return constraintAnchoring(.centerX, of: view, following: guideType)
    }
    
    @discardableResult
    func constraintAnchoringCenterY(with view: UIView?, following guideType: LayoutGuideType = .none) -> NSLayoutConstraint {
        return constraintAnchoring(.centerY, of: view, following: guideType)
    }
    
}


extension UIView {
    
    private func constraintAnchoring(_ anchorType: AnchorType, of view: UIView?, following guideType: LayoutGuideType) -> NSLayoutConstraint {
        guard let viewB = getViewB(from: view) else { fatalError() }
        return anchorType.isXAxis
            ? constraintAnchoring(anchorType.xAxisAnchor(of: self), with: anchorType.xAxisAnchor(of: viewB, following: guideType))
            : constraintAnchoring(anchorType.yAxisAnchor(of: self), with: anchorType.yAxisAnchor(of: viewB, following: guideType))
    }
    
    private func getViewB(from view: UIView?) -> UIView? {
        if let view = view {
            return view
        }
        if let view = superview {
            return view
        }
        print("No parent view to anchor with.")
        return nil
    }
    
}
