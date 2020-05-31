//
//  CoreAnchoringTests.swift
//  ViewUtilsAppTests
//
//  Created by Akaash Dev on 25/05/20.
//  Copyright © 2020 Akaash Dev. All rights reserved.
//

import XCTest
import Accio

//class CoreAnchoringTests: XCTestCase {
//
//    var viewA: UIView!
//    var viewB: UIView!
//
//    override func setUp() {
//        super.setUp()
//        viewA = UIView()
//        viewB = UIView()
//    }
//
//    func testConstraintAnchoring_withDirectCases() {
//        let topConstraint = viewA.constraintAnchoring(viewA.topAnchor, with: viewB.topAnchor)
//        let bottomConstraint = viewA.constraintAnchoring(viewA.bottomAnchor, with: viewB.bottomAnchor)
//        let leadingConstraint = viewA.constraintAnchoring(viewA.leadingAnchor, with: viewB.leadingAnchor)
//        let trailingConstraint = viewA.constraintAnchoring(viewA.trailingAnchor, with: viewB.trailingAnchor)
//        let leftConstraint = viewA.constraintAnchoring(viewA.leftAnchor, with: viewB.leftAnchor)
//        let rightConstraint = viewA.constraintAnchoring(viewA.rightAnchor, with: viewB.rightAnchor)
//
//        XCTAssertEqual(viewA.topAnchor, topConstraint.firstAnchor)
//        XCTAssertEqual(viewA.leadingAnchor, leadingConstraint.firstAnchor)
//        XCTAssertEqual(viewA.trailingAnchor, trailingConstraint.firstAnchor)
//        XCTAssertEqual(viewA.leftAnchor, leftConstraint.firstAnchor)
//        XCTAssertEqual(viewA.rightAnchor, rightConstraint.firstAnchor)
//        XCTAssertEqual(viewA.bottomAnchor, bottomConstraint.firstAnchor)
//
//        XCTAssertEqual(viewB.topAnchor, topConstraint.secondAnchor)
//        XCTAssertEqual(viewB.leadingAnchor, leadingConstraint.secondAnchor)
//        XCTAssertEqual(viewB.trailingAnchor, trailingConstraint.secondAnchor)
//        XCTAssertEqual(viewB.leftAnchor, leftConstraint.secondAnchor)
//        XCTAssertEqual(viewB.rightAnchor, rightConstraint.secondAnchor)
//        XCTAssertEqual(viewB.bottomAnchor, bottomConstraint.secondAnchor)
//    }
//
//    func testAllCoreAnchoringMethods_anchorOrdering() {
//        func check<Anchor>(_ viewAAnchor: NSLayoutAnchor<Anchor>, _ viewBAnchor: NSLayoutAnchor<Anchor>) {
//            let constraint = viewA.constraintAnchoring(viewAAnchor, with: viewBAnchor)
//            let lessConstraint = viewA.lessThanOrEqualToConstraintAnchoring(viewAAnchor, with: viewBAnchor)
//            let greatConstraint = viewA.greaterThanOrEqualToConstraintAnchoring(viewAAnchor, with: viewBAnchor)
//
//            XCTAssertEqual(viewAAnchor, constraint.firstAnchor)
//            XCTAssertEqual(viewBAnchor, constraint.secondAnchor)
//
//            XCTAssertEqual(viewAAnchor, lessConstraint.firstAnchor)
//            XCTAssertEqual(viewBAnchor, lessConstraint.secondAnchor)
//
//            XCTAssertEqual(viewAAnchor, greatConstraint.firstAnchor)
//            XCTAssertEqual(viewBAnchor, greatConstraint.secondAnchor)
//        }
//
//        AnchorType.xAxisAnchors.forEach {
//            let viewAAnchor = $0.xAxisAnchor(of: viewA)  // Eg: viewA.leadingAnchor
//            let viewBAnchor = $0.xAxisAnchor(of: viewB)  // Eg: viewB.leadingAnchor
//            check(viewAAnchor, viewBAnchor)
//        }
//
//        AnchorType.yAxisAnchors.forEach {
//            let viewAAnchor = $0.yAxisAnchor(of: viewA)  // Eg: viewA.topAnchor
//            let viewBAnchor = $0.yAxisAnchor(of: viewB)  // Eg: viewB.bottomAnchor
//            check(viewAAnchor, viewBAnchor)
//        }
//    }
//
//    func testAllCoreAnchoringMethods_mixingAnchors_sameAnchors() {
//        func check<Anchor>(_ viewAAnchor: NSLayoutAnchor<Anchor>, _ viewBAnchor: NSLayoutAnchor<Anchor>) {
//            let constraint = viewA.constraintAnchoring(viewAAnchor, with: viewBAnchor)
//            let lessConstraint = viewA.lessThanOrEqualToConstraintAnchoring(viewAAnchor, with: viewBAnchor)
//            let greatConstraint = viewA.greaterThanOrEqualToConstraintAnchoring(viewAAnchor, with: viewBAnchor)
//
//            XCTAssertNotEqual(viewBAnchor, constraint.firstAnchor)
//            XCTAssertNotEqual(viewAAnchor, constraint.secondAnchor)
//            XCTAssertNotEqual(constraint.firstAnchor, constraint.secondAnchor)
//
//            XCTAssertNotEqual(viewBAnchor, lessConstraint.firstAnchor)
//            XCTAssertNotEqual(viewAAnchor, lessConstraint.secondAnchor)
//            XCTAssertNotEqual(lessConstraint.firstAnchor, lessConstraint.secondAnchor)
//
//            XCTAssertNotEqual(viewBAnchor, greatConstraint.firstAnchor)
//            XCTAssertNotEqual(viewAAnchor, greatConstraint.secondAnchor)
//            XCTAssertNotEqual(greatConstraint.firstAnchor, greatConstraint.secondAnchor)
//        }
//
//        AnchorType.xAxisAnchors.forEach {
//            let viewAAnchor = $0.xAxisAnchor(of: viewA)  // Eg: viewA.leadingAnchor
//            let viewBAnchor = $0.xAxisAnchor(of: viewB)  // Eg: viewB.leadingAnchor
//            check(viewAAnchor, viewBAnchor)
//        }
//
//        AnchorType.yAxisAnchors.forEach {
//            let viewAAnchor = $0.yAxisAnchor(of: viewA)  // Eg: viewA.topAnchor
//            let viewBAnchor = $0.yAxisAnchor(of: viewB)  // Eg: viewB.bottomAnchor
//            check(viewAAnchor, viewBAnchor)
//        }
//    }
//
//
//    func testConstraintAnchoring_relation() {
//        let constraint = viewA.constraintAnchoring(viewA.leadingAnchor, with: viewB.leadingAnchor)
//        XCTAssertEqual(constraint.relation, NSLayoutConstraint.Relation.equal)
//    }
//    
//    func testLessThanOrEqualToConstraintAnchoring_relation() {
//        let constraint = viewA.lessThanOrEqualToConstraintAnchoring(viewA.leadingAnchor, with: viewB.leadingAnchor)
//        XCTAssertEqual(constraint.relation, NSLayoutConstraint.Relation.lessThanOrEqual)
//    }
//
//    func testGreaterThanOrEqualToConstraintAnchoring_relation() {
//        let constraint = viewA.greaterThanOrEqualToConstraintAnchoring(viewA.leadingAnchor, with: viewB.leadingAnchor)
//        XCTAssertEqual(constraint.relation, NSLayoutConstraint.Relation.greaterThanOrEqual)
//    }
//
//}
