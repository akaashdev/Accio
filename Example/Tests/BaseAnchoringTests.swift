//
//  BaseAnchoringTests.swift
//  ViewUtilsAppTests
//
//  Created by Akaash Dev on 30/05/20.
//  Copyright © 2020 Akaash Dev. All rights reserved.
//

import XCTest
@testable import Accio

class BaseAnchoringTests: XCTestCase {
    
    let guides: [LayoutGuideType] = [.none, .layoutMargins, .readable, .safeArea]
    let paddings: [CGFloat] = [12, 16]
    
    var viewA: UIView!
    var viewB: UIView!
    
    override func setUp() {
        super.setUp()
        viewA = UIView()
        viewB = UIView()
    }
    
    func testAnchorTop() {
        checkAnchorMethods(type: .top) { viewA, viewB, guide, padding in
            viewA.anchorTop(with: viewB, following: guide, padding: padding)
        }
    }
    
    func testAnchorBottom() {
        checkAnchorMethods(type: .bottom) { viewA, viewB, guide, padding in
            viewA.anchorBottom(with: viewB, following: guide, padding: padding)
        }
    }
    
    func testAnchorLeading() {
        checkAnchorMethods(type: .leading) { viewA, viewB, guide, padding in
            viewA.anchorLeading(with: viewB, following: guide, padding: padding)
        }
    }
    
    func testAnchorTrailing() {
        checkAnchorMethods(type: .trailing) { viewA, viewB, guide, padding in
            viewA.anchorTrailing(with: viewB, following: guide, padding: padding)
        }
    }
    
    func testAnchorLeft() {
        checkAnchorMethods(type: .left) { viewA, viewB, guide, padding in
            viewA.anchorLeft(with: viewB, following: guide, padding: padding)
        }
    }
    
    func testAnchorRight() {
        checkAnchorMethods(type: .right) { viewA, viewB, guide, padding in
            viewA.anchorRight(with: viewB, following: guide, padding: padding)
        }
    }
    
    
    func testAlignCenterMethods() {
        checkAnchorMethods(type: .centerX) { viewA, viewB, guide, padding in
            viewA.alignHorizontallyCenter(with: viewB, following: guide, xOffset: padding)
        }
        checkAnchorMethods(type: .centerY) { viewA, viewB, guide, padding in
            viewA.alignVerticallyCenter(with: viewB, following: guide, yOffset: padding)
        }
    }
    
    
    func testConstraintAnchoringTop() {
        guides.forEach { guide in
            let constraint = viewA.constraintAnchoringTop(with: viewB, following: guide)
            checkConstraintCorrectness(constraint, viewA: viewA, viewB: viewB, anchorType: .top, guideType: guide, padding: 0)
            XCTAssertFalse(constraint.isActive)
        }
    }
    
    func testConstraintAnchoringBottom() {
        guides.forEach { guide in
            let constraint = viewA.constraintAnchoringBottom(with: viewB, following: guide)
            checkConstraintCorrectness(constraint, viewA: viewA, viewB: viewB, anchorType: .bottom, guideType: guide, padding: 0)
            XCTAssertFalse(constraint.isActive)
        }
    }
    
    func testConstraintAnchoringLeading() {
        guides.forEach { guide in
            let constraint = viewA.constraintAnchoringLeading(with: viewB, following: guide)
            checkConstraintCorrectness(constraint, viewA: viewA, viewB: viewB, anchorType: .leading, guideType: guide, padding: 0)
            XCTAssertFalse(constraint.isActive)
        }
    }
    
    func testConstraintAnchoringTrailing() {
        guides.forEach { guide in
            let constraint = viewA.constraintAnchoringTrailing(with: viewB, following: guide)
            checkConstraintCorrectness(constraint, viewA: viewA, viewB: viewB, anchorType: .trailing, guideType: guide, padding: 0)
            XCTAssertFalse(constraint.isActive)
        }
    }
    
    func testConstraintAnchoringLeft() {
        guides.forEach { guide in
            let constraint = viewA.constraintAnchoringLeft(with: viewB, following: guide)
            checkConstraintCorrectness(constraint, viewA: viewA, viewB: viewB, anchorType: .left, guideType: guide, padding: 0)
            XCTAssertFalse(constraint.isActive)
        }
    }
    
    func testConstraintAnchoringRight() {
        guides.forEach { guide in
            let constraint = viewA.constraintAnchoringRight(with: viewB, following: guide)
            checkConstraintCorrectness(constraint, viewA: viewA, viewB: viewB, anchorType: .right, guideType: guide, padding: 0)
            XCTAssertFalse(constraint.isActive)
        }
    }
    
    func testConstraintAnchoringCenterX() {
        guides.forEach { guide in
            let constraint = viewA.constraintAnchoringCenterX(with: viewB, following: guide)
            checkConstraintCorrectness(constraint, viewA: viewA, viewB: viewB, anchorType: .centerX, guideType: guide, padding: 0)
            XCTAssertFalse(constraint.isActive)
        }
    }
    
    func testConstraintAnchoringCenterY() {
        guides.forEach { guide in
            let constraint = viewA.constraintAnchoringCenterY(with: viewB, following: guide)
            checkConstraintCorrectness(constraint, viewA: viewA, viewB: viewB, anchorType: .centerY, guideType: guide, padding: 0)
            XCTAssertFalse(constraint.isActive)
        }
    }
    
    private func checkAnchorMethods(type: AnchorType, methodInvocation: (UIView, UIView, LayoutGuideType, CGFloat)->()) {
        var viewA: UIView! = nil
        var viewB: UIView! = nil
        paddings.forEach { padding in
            guides.forEach { guide in
                viewA = UIView()
                viewB = UIView()
                viewB.addSubview(viewA)
                methodInvocation(viewA, viewB, guide, padding)
                let constraint = viewB.constraints.first!
                checkConstraintCorrectness(constraint, viewA: viewA, viewB: viewB, anchorType: type, guideType: guide, padding: padding)
                XCTAssertTrue(constraint.isActive)
            }
        }
    }
    
    private func checkConstraintCorrectness(_ constraint: NSLayoutConstraint, viewA: UIView, viewB: UIView, anchorType: AnchorType, guideType: LayoutGuideType, padding: CGFloat) {
        XCTAssertTrue(constraint.firstItem is UIView) // First Item should only be UIView
        XCTAssertFalse(constraint.firstItem is UILayoutGuide) // First Item should not be UILayoutGuide
        XCTAssertEqual(constraint.firstItem as! NSObject, viewA)
        XCTAssertEqual(constraint.secondItem as! NSObject, guideType.layoutGuide(of: viewB) ?? viewB)
        XCTAssertEqual(constraint.relation, NSLayoutConstraint.Relation.equal)
        XCTAssertEqual(
            constraint.secondAnchor,
            anchorType.isXAxis ? anchorType.xAxisAnchor(of: viewB, following: guideType) : anchorType.yAxisAnchor(of: viewB, following: guideType)
        )
        XCTAssertEqual(constraint.constant, anchorType.usesNegativeOffset ? -padding : padding)
    }
    
}
