//
//  ExtensionsTests.swift
//  Accio_Tests
//
//  Created by aksc on 16/08/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
import Accio

class ExtensionsTests: XCTestCase {
    var viewA: UIView!
    var viewB: UIView!
    
    override func setUp() {
        super.setUp()
        viewA = UIView()
        viewB = UIView()
        viewA.addSubview(viewB)
    }
    
    func testActivate() {
        let constraint = viewA.leadingAnchor.constraint(equalTo: viewB.leadingAnchor)
        XCTAssertFalse(constraint.isActive)
        constraint.activate()
        XCTAssertTrue(constraint.isActive)
    }
    
    func testDeactivate() {
        let constraint = viewA.leadingAnchor.constraint(equalTo: viewB.leadingAnchor).activate()
        XCTAssertTrue(constraint.isActive)
        constraint.deactivate()
        XCTAssertFalse(constraint.isActive)
    }
    
    func testPriortize() {
        let constraint = viewA.leadingAnchor.constraint(equalTo: viewB.leadingAnchor)
        constraint.prioritize(.defaultHigh)
        XCTAssertEqual(constraint.priority, .defaultHigh)
        constraint.prioritize(.defaultLow)
        XCTAssertEqual(constraint.priority, .defaultLow)
    }
    
    func testConstantUpdate() {
        let constraint = viewA.leadingAnchor.constraint(equalTo: viewB.leadingAnchor)
        XCTAssertEqual(constraint.constant, 0)
        constraint.setConstant(30)
        XCTAssertEqual(constraint.constant, 30)
    }
    
    func testActivate_groupConstraints() {
        let constraints = dummyConstraints
        constraints.forEach { XCTAssertFalse($0.isActive) }
        constraints.activate()
        constraints.forEach { XCTAssertTrue($0.isActive) }
    }
    
    func testDeactivate_groupConstraints() {
        let constraints = dummyConstraints.activate()
        constraints.forEach { XCTAssertTrue($0.isActive) }
        constraints.deactivate()
        constraints.forEach { XCTAssertFalse($0.isActive) }
    }
    
    func testPriortize_groupConstraints() {
        let constraints = dummyConstraints
        constraints.prioritize(.defaultHigh)
        constraints.forEach { XCTAssertEqual($0.priority, .defaultHigh) }
        constraints.prioritize(.defaultLow)
        constraints.forEach { XCTAssertEqual($0.priority, .defaultLow) }
    }
    
    func testConstantUpdate_groupConstraints() {
        let constraints = dummyConstraints
        constraints.forEach { XCTAssertEqual($0.constant, 0) }
        constraints.setConstant(30)
        constraints.forEach { XCTAssertEqual($0.constant, 30) }
    }
}

private extension ExtensionsTests {
    var dummyConstraints: [NSLayoutConstraint] {
        return viewB.constraints(toFill: viewA)
    }
}
