//
//  LayoutTests.swift
//  Accio_Tests
//
//  Created by aksc on 16/08/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
import Accio

class LayoutTests: XCTestCase {
    var viewA: UIView!
    var viewB: UIView!
    
    override func setUp() {
        super.setUp()
        viewA = UIView()
        viewA.frame = CGRect(x: 0, y: 0, width: 300, height: 500)
        
        viewB = UIView()
        viewB.translatesAutoresizingMaskIntoConstraints = false
        
        viewA.addSubview(viewB)
    }
    
    func testFillView() {
        viewB.fill()
        viewA.layoutIfNeeded()
        XCTAssertEqual(frameA, frameB)
    }
    
    func testFillView_withPaddingAll() {
        viewB.fill(insets: .all(20))
        viewA.layoutIfNeeded()
        XCTAssertTrue(frameA.contains(frameB))
        XCTAssertEqual(frameA.inset(by: .all(20)), frameB)
    }
    
    func testFillView_withPaddingRandom() {
        let insets = UIEdgeInsets(top: 10, left: 20, bottom: 30, right: 40)
        viewB.fill(insets: insets)
        viewA.layoutIfNeeded()
        XCTAssertTrue(frameA.contains(frameB))
        XCTAssertEqual(frameA.inset(by: insets), frameB)
    }
    
    func testFillView_withPaddingNegative() {
        let insets = UIEdgeInsets(top: -10, left: -20, bottom: 30, right: 40)
        viewB.fill(insets: insets)
        viewA.layoutIfNeeded()
        XCTAssertFalse(frameA.contains(frameB))
        XCTAssertFalse(frameB.contains(frameA))
        XCTAssertEqual(frameA.inset(by: insets), frameB)
    }
    
    func testCenterView() {
        viewB.alignCenter()
        viewA.layoutIfNeeded()
        XCTAssertTrue(frameA.contains(frameB))
        XCTAssertEqual(frameA.midX, frameB.midX)
        XCTAssertEqual(frameA.midY, frameB.midY)
    }
    
    func testCenterView_withOffset() {
        let offset = CGPoint(x: 10, y: -20)
        viewB.alignCenter(offset: offset)
        viewA.layoutIfNeeded()
        XCTAssertTrue(frameA.contains(frameB))
        XCTAssertEqual(frameA.midX + offset.x, frameB.midX)
        XCTAssertEqual(frameA.midY + offset.y, frameB.midY)
    }
    
    func testFillWidth_withPadding() {
        viewB.fillWidth(padding: 20)
        viewA.layoutIfNeeded()
        XCTAssertEqual(frameA.minX + 20, frameB.minX)
        XCTAssertEqual(frameA.maxX - 20, frameB.maxX)
    }
    
    func testFillHeight_withPadding() {
        viewB.fillHeight(padding: 20)
        viewA.layoutIfNeeded()
        XCTAssertEqual(frameA.minY + 20, frameB.minY)
        XCTAssertEqual(frameA.maxY - 20, frameB.maxY)
    }
    
    func testAnchorMethods_withPadding() {
        let insets = UIEdgeInsets(top: 10, left: 20, bottom: 30, right: 40)
        viewB.anchorTop(padding: insets.top)
        viewB.anchorLeading(padding: insets.left)
        viewB.anchorBottom(padding: insets.bottom)
        viewB.anchorTrailing(padding: insets.right)
        viewA.layoutIfNeeded()
        XCTAssertTrue(frameA.contains(frameB))
        XCTAssertEqual(frameA.inset(by: insets), frameB)
    }
    
    func testAnchorMethods_withPaddingNegative() {
        let insets = UIEdgeInsets(top: -10, left: -20, bottom: -30, right: -40)
        viewB.anchorTop(padding: insets.top)
        viewB.anchorLeading(padding: insets.left)
        viewB.anchorBottom(padding: insets.bottom)
        viewB.anchorTrailing(padding: insets.right)
        viewA.layoutIfNeeded()
        XCTAssertFalse(frameA.contains(frameB))
        XCTAssertTrue(frameB.contains(frameA))
        XCTAssertEqual(frameA.inset(by: insets), frameB)
    }
    
    func testCenterX() {
        viewB.alignHorizontallyCenter(xOffset: 10)
        viewA.layoutIfNeeded()
        XCTAssertTrue(frameA.contains(frameB))
        XCTAssertEqual(frameA.midX + 10, frameB.midX)
    }
    
    func testCenterY() {
        viewB.alignVerticallyCenter(yOffset: 10)
        viewA.layoutIfNeeded()
        XCTAssertTrue(frameA.contains(frameB))
        XCTAssertEqual(frameA.midY + 10, frameB.midY)
    }
    
    func testCenterX_negativeOffset() {
        viewB.alignHorizontallyCenter(xOffset: -10)
        viewA.layoutIfNeeded()
        XCTAssertTrue(frameA.contains(frameB))
        XCTAssertEqual(frameA.midX - 10, frameB.midX)
    }
    
    func testCenterY_negativeOffset() {
        viewB.alignVerticallyCenter(yOffset: -10)
        viewA.layoutIfNeeded()
        XCTAssertTrue(frameA.contains(frameB))
        XCTAssertEqual(frameA.midY - 10, frameB.midY)
    }
}

private extension LayoutTests {
    var frameA: CGRect {
        return viewA.frame
    }
    
    var frameB: CGRect {
        return viewB.frame
    }
}
