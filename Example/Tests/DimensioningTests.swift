//
//  DimensioningTests.swift
//  Accio_Tests
//
//  Created by Akaash Dev on 31/05/20.
//  Copyright © 2020 Akaash Dev. All rights reserved.
//

import XCTest
import Accio

class DimensioningTests: XCTestCase {
    let testValues: [CGFloat] = [100, 200, 300, 400, 500]
    let testFactors: [CGFloat] = [0.1, 0.25, 1.34, 2.4]
    
    var viewA: UIView!
    var viewB: UIView!
    
    override func setUp() {
        super.setUp()
        viewA = UIView()
        viewB = UIView()
    }
    
    func testConstantWidth() {
        doTest(for: .equal, dimension: viewA.widthAnchor) { viewA.setConstantWidth($0) }
    }
    
    func testConstantHeight() {
        doTest(for: .equal, dimension: viewA.heightAnchor) { viewA.setConstantHeight($0) }
    }
    
    func testMinimumWidth() {
        doTest(for: .greaterThanOrEqual, dimension: viewA.widthAnchor) { viewA.setMinimumWidth($0) }
    }
    
    func testMinimumHeight() {
        doTest(for: .greaterThanOrEqual, dimension: viewA.heightAnchor) { viewA.setMinimumHeight($0) }
    }
    
    func testMaximumWidth() {
        doTest(for: .lessThanOrEqual, dimension: viewA.widthAnchor) { viewA.setMaximumWidth($0) }
    }
    
    func testMaximumHeight() {
        doTest(for: .lessThanOrEqual, dimension: viewA.heightAnchor) { viewA.setMaximumHeight($0) }
    }
    
    func doTest(for relation: NSLayoutConstraint.Relation, dimension: NSLayoutDimension, method: (CGFloat)->()) {
        testValues.forEach { value in
            method(value)
            let constraint = viewA.constraints.first!
            XCTAssertEqual(constraint.constant, value)
            XCTAssertTrue(constraint.isActive)
            XCTAssertEqual(constraint.relation, relation)
            XCTAssertEqual(constraint.firstAnchor, dimension)
            viewA.removeConstraint(constraint)
        }
    }
}
