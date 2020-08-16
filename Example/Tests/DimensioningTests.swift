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
    let testSizes: [CGSize] = [.init(width: 100, height: 200), .init(width: 150, height: 250), .init(width: 200, height: 300), .init(width: 235, height: 432)]
    
    var viewA: UIView!
    var viewB: UIView!
    
    override func setUp() {
        super.setUp()
        viewA = UIView()
        viewB = UIView()
        viewA.addSubview(viewB)
    }
    
    // MARK: Constant Dimensioning
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
    
    // MARK: Relative Dimensioning
    func testRelativeWidth() {
        doTest(for: .equal, dimension: viewA.widthAnchor, relativeTo: viewB.widthAnchor) { viewA.setWidth(relativeTo: viewB.widthAnchor, multipliedBy: $0, constant: $1) }
    }
    
    func testRelativeHeight() {
        doTest(for: .equal, dimension: viewA.heightAnchor, relativeTo: viewB.widthAnchor) { viewA.setHeight(relativeTo: viewB.widthAnchor, multipliedBy: $0, constant: $1) }
    }
    
    func testMinimumRelativeWidth() {
        doTest(for: .greaterThanOrEqual, dimension: viewA.widthAnchor, relativeTo: viewB.widthAnchor) { viewA.setMinimumWidth(relativeTo: viewB.widthAnchor, multipliedBy: $0, constant: $1) }
    }
    
    func testMinimumRelativeHeight() {
        doTest(for: .greaterThanOrEqual, dimension: viewA.heightAnchor, relativeTo: viewB.widthAnchor) { viewA.setMinimumHeight(relativeTo: viewB.widthAnchor, multipliedBy: $0, constant: $1) }
    }
    
    func testMaximumRelativeWidth() {
        doTest(for: .lessThanOrEqual, dimension: viewA.widthAnchor, relativeTo: viewB.widthAnchor) { viewA.setMaximumWidth(relativeTo: viewB.widthAnchor, multipliedBy: $0, constant: $1) }
    }
    
    func testMaximumRelativeHeight() {
        doTest(for: .lessThanOrEqual, dimension: viewA.heightAnchor, relativeTo: viewB.widthAnchor) { viewA.setMaximumHeight(relativeTo: viewB.widthAnchor, multipliedBy: $0, constant: $1) }
    }
    
    // MARK: Size Methods
    func testConstantSize() {
        doSizeTest(for: .equal) { viewA.setConstantSize(width: $0.width, height: $0.height) }
    }
    
    func testMinimumSize() {
        doSizeTest(for: .greaterThanOrEqual) { viewA.setMinimumSize(width: $0.width, height: $0.height) }
    }
    
    func testMaximumSize() {
        doSizeTest(for: .lessThanOrEqual) { viewA.setMaximumSize(width: $0.width, height: $0.height) }
    }
}

private extension DimensioningTests {
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
    
    func doTest(for relation: NSLayoutConstraint.Relation, dimension: NSLayoutDimension, relativeTo otherDimension: NSLayoutDimension, method: (_ multiplier: CGFloat, _ constant: CGFloat)->()) {
        testValues.forEach { value in
            testFactors.forEach { factor in
                method(factor, value)
                let constraint = viewA.constraints.first!
                XCTAssertEqual(constraint.constant, value)
                XCTAssertEqual(Int(constraint.multiplier * 100), Int(factor * 100)) // To avoid failing cuz of 0.100000004 != 0.1
                XCTAssertTrue(constraint.isActive)
                XCTAssertEqual(constraint.relation, relation)
                XCTAssertEqual(constraint.firstAnchor, dimension)
                XCTAssertEqual(constraint.secondAnchor, otherDimension)
                viewA.removeConstraint(constraint)
            }
        }
    }
    
    func doSizeTest(for relation: NSLayoutConstraint.Relation, method: (_ size: CGSize)->()) {
        testSizes.forEach { size in
            method(size)
            let constraints = viewA.constraints
            let widthConstraint = constraints.first { $0.firstAnchor == viewA.widthAnchor }!
            let heightConstraint = constraints.first { $0.firstAnchor == viewA.heightAnchor }!
            XCTAssertEqual(constraints.count, 2)
            
            XCTAssertEqual(widthConstraint.firstAnchor, viewA.widthAnchor)
            XCTAssertEqual(widthConstraint.relation, relation)
            XCTAssertEqual(widthConstraint.constant, size.width)
            XCTAssertNil(widthConstraint.secondAnchor)
            XCTAssertTrue(widthConstraint.isActive)
            
            XCTAssertEqual(heightConstraint.firstAnchor, viewA.heightAnchor)
            XCTAssertEqual(heightConstraint.relation, relation)
            XCTAssertEqual(heightConstraint.constant, size.height)
            XCTAssertNil(heightConstraint.secondAnchor)
            XCTAssertTrue(heightConstraint.isActive)
            
            viewA.removeConstraint(widthConstraint)
            viewA.removeConstraint(heightConstraint)
        }
    }
}
