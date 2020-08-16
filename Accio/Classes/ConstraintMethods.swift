//
//  ConstraintMethods.swift
//  Accio
//
//  Created by Akaash Dev on 26/05/20.
//  Copyright © 2020 Akaash Dev. All rights reserved.
//

import UIKit

public extension UIView {
    @discardableResult
    func constraintAnchoringTop(with view: UIView?, following guideType: LayoutGuideType = .none, padding: CGFloat = 0) -> NSLayoutConstraint {
        return constraintAnchoring(.top, of: view, following: guideType, padding: padding)
    }
    
    @discardableResult
    func constraintAnchoringBottom(with view: UIView?, following guideType: LayoutGuideType = .none, padding: CGFloat = 0) -> NSLayoutConstraint {
        return constraintAnchoring(.bottom, of: view, following: guideType, padding: padding)
    }
    
    @discardableResult
    func constraintAnchoringLeading(with view: UIView?, following guideType: LayoutGuideType = .none, padding: CGFloat = 0) -> NSLayoutConstraint {
        return constraintAnchoring(.leading, of: view, following: guideType, padding: padding)
    }
    
    @discardableResult
    func constraintAnchoringTrailing(with view: UIView?, following guideType: LayoutGuideType = .none, padding: CGFloat = 0) -> NSLayoutConstraint {
        return constraintAnchoring(.trailing, of: view, following: guideType, padding: padding)
    }
    
    @discardableResult
    func constraintAnchoringLeft(with view: UIView?, following guideType: LayoutGuideType = .none, padding: CGFloat = 0) -> NSLayoutConstraint {
        return constraintAnchoring(.left, of: view, following: guideType, padding: padding)
    }
    
    @discardableResult
    func constraintAnchoringRight(with view: UIView?, following guideType: LayoutGuideType = .none, padding: CGFloat = 0) -> NSLayoutConstraint {
        return constraintAnchoring(.right, of: view, following: guideType, padding: padding)
    }
    
    @discardableResult
    func constraintAnchoringCenterX(with view: UIView?, following guideType: LayoutGuideType = .none, xOffset: CGFloat = 0) -> NSLayoutConstraint {
        return constraintAnchoring(.centerX, of: view, following: guideType, padding: xOffset)
    }
    
    @discardableResult
    func constraintAnchoringCenterY(with view: UIView?, following guideType: LayoutGuideType = .none, yOffset: CGFloat = 0) -> NSLayoutConstraint {
        return constraintAnchoring(.centerY, of: view, following: guideType, padding: yOffset)
    }
}

public extension UIView {
    func constraintsFillingWidth(of view: UIView?, following guideType: LayoutGuideType = .none, padding: CGFloat = 0) -> [NSLayoutConstraint] {
        return [constraintAnchoringLeading(with: view, following: guideType, padding: padding),
                constraintAnchoringTrailing(with: view, following: guideType, padding: padding)]
    }
    
    func constraintsFillingHeight(of view: UIView?, following guideType: LayoutGuideType = .none, padding: CGFloat = 0) -> [NSLayoutConstraint] {
        return [constraintAnchoringTop(with: view, following: guideType, padding: padding),
                constraintAnchoringBottom(with: view, following: guideType, padding: padding)]
    }
    
    func constraintsToCenter(in view: UIView?, following guideType: LayoutGuideType = .none, offset: CGPoint = .zero) -> [NSLayoutConstraint] {
        return [constraintAnchoringCenterX(with: view, following: guideType, xOffset: offset.x),
                constraintAnchoringCenterY(with: view, following: guideType, yOffset: offset.y)]
    }
    
    func constraints(toFill view: UIView?, following guideType: LayoutGuideType = .none, insets: UIEdgeInsets = .zero) -> [NSLayoutConstraint] {
        return [constraintAnchoringLeading(with: view, following: guideType, padding: insets.left),
                constraintAnchoringTrailing(with: view, following: guideType, padding: insets.right),
                constraintAnchoringTop(with: view, following: guideType, padding: insets.top),
                constraintAnchoringBottom(with: view, following: guideType, padding: insets.bottom)]
    }
}

extension UIView {
    private func constraintAnchoring(_ anchorType: AnchorType, of view: UIView?, following guideType: LayoutGuideType, padding: CGFloat) -> NSLayoutConstraint {
        guard let viewB = getViewB(from: view) else { fatalError() }
        let offset = anchorType.usesNegativeOffset ? -padding : padding
        return anchorType.isXAxis
            ? Helper.constraintAnchoring(anchorType.xAxisAnchor(of: self), with: anchorType.xAxisAnchor(of: viewB, following: guideType), offset: offset)
            : Helper.constraintAnchoring(anchorType.yAxisAnchor(of: self), with: anchorType.yAxisAnchor(of: viewB, following: guideType), offset: offset)
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
