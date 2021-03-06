//
//  CoreAnchoringTests.swift
//  Accio_Tests
//
//  Created by Akaash Dev on 25/05/20.
//  Copyright © 2020 Akaash Dev. All rights reserved.
//

import XCTest
@testable import Accio

class CoreAnchoringTests: XCTestCase {
    var viewA: UIView!
    var viewB: UIView!

    override func setUp() {
        super.setUp()
        viewA = UIView()
        viewB = UIView()
    }

    func testConstraintAnchoring_withDirectCases() {
        let topConstraint = Helper.constraintAnchoring(viewA.topAnchor, with: viewB.topAnchor, offset: 0)
        let bottomConstraint = Helper.constraintAnchoring(viewA.bottomAnchor, with: viewB.bottomAnchor, offset: 0)
        let leadingConstraint = Helper.constraintAnchoring(viewA.leadingAnchor, with: viewB.leadingAnchor, offset: 0)
        let trailingConstraint = Helper.constraintAnchoring(viewA.trailingAnchor, with: viewB.trailingAnchor, offset: 0)
        let leftConstraint = Helper.constraintAnchoring(viewA.leftAnchor, with: viewB.leftAnchor, offset: 0)
        let rightConstraint = Helper.constraintAnchoring(viewA.rightAnchor, with: viewB.rightAnchor, offset: 0)

        XCTAssertEqual(viewA.topAnchor, topConstraint.firstAnchor)
        XCTAssertEqual(viewA.leadingAnchor, leadingConstraint.firstAnchor)
        XCTAssertEqual(viewA.trailingAnchor, trailingConstraint.firstAnchor)
        XCTAssertEqual(viewA.leftAnchor, leftConstraint.firstAnchor)
        XCTAssertEqual(viewA.rightAnchor, rightConstraint.firstAnchor)
        XCTAssertEqual(viewA.bottomAnchor, bottomConstraint.firstAnchor)

        XCTAssertEqual(viewB.topAnchor, topConstraint.secondAnchor)
        XCTAssertEqual(viewB.leadingAnchor, leadingConstraint.secondAnchor)
        XCTAssertEqual(viewB.trailingAnchor, trailingConstraint.secondAnchor)
        XCTAssertEqual(viewB.leftAnchor, leftConstraint.secondAnchor)
        XCTAssertEqual(viewB.rightAnchor, rightConstraint.secondAnchor)
        XCTAssertEqual(viewB.bottomAnchor, bottomConstraint.secondAnchor)
    }

    func testAllCoreAnchoringMethods_anchorOrdering() {
        func check<Anchor>(_ viewAAnchor: NSLayoutAnchor<Anchor>, _ viewBAnchor: NSLayoutAnchor<Anchor>) {
            let constraint = Helper.constraintAnchoring(viewAAnchor, with: viewBAnchor, offset: 0)
            let lessConstraint = Helper.lessThanOrEqualToConstraintAnchoring(viewAAnchor, with: viewBAnchor, offset: 0)
            let greatConstraint = Helper.greaterThanOrEqualToConstraintAnchoring(viewAAnchor, with: viewBAnchor, offset: 0)

            XCTAssertEqual(viewAAnchor, constraint.firstAnchor)
            XCTAssertEqual(viewBAnchor, constraint.secondAnchor)

            XCTAssertEqual(viewAAnchor, lessConstraint.firstAnchor)
            XCTAssertEqual(viewBAnchor, lessConstraint.secondAnchor)

            XCTAssertEqual(viewAAnchor, greatConstraint.firstAnchor)
            XCTAssertEqual(viewBAnchor, greatConstraint.secondAnchor)
        }

        AnchorType.xAxisAnchors.forEach {
            let viewAAnchor = $0.xAxisAnchor(of: viewA)  // Eg: viewA.leadingAnchor
            let viewBAnchor = $0.xAxisAnchor(of: viewB)  // Eg: viewB.leadingAnchor
            check(viewAAnchor, viewBAnchor)
        }

        AnchorType.yAxisAnchors.forEach {
            let viewAAnchor = $0.yAxisAnchor(of: viewA)  // Eg: viewA.topAnchor
            let viewBAnchor = $0.yAxisAnchor(of: viewB)  // Eg: viewB.bottomAnchor
            check(viewAAnchor, viewBAnchor)
        }
    }

    func testAllCoreAnchoringMethods_mixingAnchors_sameAnchors() {
        func check<Anchor>(_ viewAAnchor: NSLayoutAnchor<Anchor>, _ viewBAnchor: NSLayoutAnchor<Anchor>) {
            let constraint = Helper.constraintAnchoring(viewAAnchor, with: viewBAnchor, offset: 0)
            let lessConstraint = Helper.lessThanOrEqualToConstraintAnchoring(viewAAnchor, with: viewBAnchor, offset: 0)
            let greatConstraint = Helper.greaterThanOrEqualToConstraintAnchoring(viewAAnchor, with: viewBAnchor, offset: 0)

            XCTAssertNotEqual(viewBAnchor, constraint.firstAnchor)
            XCTAssertNotEqual(viewAAnchor, constraint.secondAnchor)
            XCTAssertNotEqual(constraint.firstAnchor, constraint.secondAnchor)

            XCTAssertNotEqual(viewBAnchor, lessConstraint.firstAnchor)
            XCTAssertNotEqual(viewAAnchor, lessConstraint.secondAnchor)
            XCTAssertNotEqual(lessConstraint.firstAnchor, lessConstraint.secondAnchor)

            XCTAssertNotEqual(viewBAnchor, greatConstraint.firstAnchor)
            XCTAssertNotEqual(viewAAnchor, greatConstraint.secondAnchor)
            XCTAssertNotEqual(greatConstraint.firstAnchor, greatConstraint.secondAnchor)
        }

        AnchorType.xAxisAnchors.forEach {
            let viewAAnchor = $0.xAxisAnchor(of: viewA)  // Eg: viewA.leadingAnchor
            let viewBAnchor = $0.xAxisAnchor(of: viewB)  // Eg: viewB.leadingAnchor
            check(viewAAnchor, viewBAnchor)
        }

        AnchorType.yAxisAnchors.forEach {
            let viewAAnchor = $0.yAxisAnchor(of: viewA)  // Eg: viewA.topAnchor
            let viewBAnchor = $0.yAxisAnchor(of: viewB)  // Eg: viewB.bottomAnchor
            check(viewAAnchor, viewBAnchor)
        }
    }


    func testConstraintAnchoring_relation() {
        let constraint = Helper.constraintAnchoring(viewA.leadingAnchor, with: viewB.leadingAnchor, offset: 0)
        XCTAssertEqual(constraint.relation, NSLayoutConstraint.Relation.equal)
    }
    
    func testLessThanOrEqualToConstraintAnchoring_relation() {
        let constraint = Helper.lessThanOrEqualToConstraintAnchoring(viewA.leadingAnchor, with: viewB.leadingAnchor, offset: 0)
        XCTAssertEqual(constraint.relation, NSLayoutConstraint.Relation.lessThanOrEqual)
    }

    func testGreaterThanOrEqualToConstraintAnchoring_relation() {
        let constraint = Helper.greaterThanOrEqualToConstraintAnchoring(viewA.leadingAnchor, with: viewB.leadingAnchor, offset: 0)
        XCTAssertEqual(constraint.relation, NSLayoutConstraint.Relation.greaterThanOrEqual)
    }
}
