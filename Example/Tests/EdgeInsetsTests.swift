//
//  EdgeInsetsTests.swift
//  ViewUtilsAppTests
//
//  Created by Akaash Dev on 31/05/20.
//  Copyright © 2020 Akaash Dev. All rights reserved.
//

import XCTest
import Accio

class EdgeInsetsTests: XCTestCase {
    let testValues: [CGFloat] = [24, 32, 48, 54]
    
    func testInsetsAll() {
        testValues.forEach { val in
            let insets = UIEdgeInsets.all(val)
            XCTAssertEqual(insets.top, val)
            XCTAssertEqual(insets.left, val)
            XCTAssertEqual(insets.bottom, val)
            XCTAssertEqual(insets.right, val)
        }
    }
    
    func testInsetsHorizontal() {
        testValues.forEach { val in
            let insets = UIEdgeInsets.horizontal(val)
            XCTAssertEqual(insets.top, 0)
            XCTAssertEqual(insets.left, val)
            XCTAssertEqual(insets.bottom, 0)
            XCTAssertEqual(insets.right, val)
        }
    }
    
    func testInsetsVertical() {
        testValues.forEach { val in
            let insets = UIEdgeInsets.vertical(val)
            XCTAssertEqual(insets.top, val)
            XCTAssertEqual(insets.left, 0)
            XCTAssertEqual(insets.bottom, val)
            XCTAssertEqual(insets.right, 0)
        }
    }
    
    func testInsetsOnly_oneEdge() {
        let val: CGFloat = 12
        var insets: UIEdgeInsets = .only(top: val)
        XCTAssertEqual(insets.top, val)
        XCTAssertEqual(insets.left, 0)
        XCTAssertEqual(insets.bottom, 0)
        XCTAssertEqual(insets.right, 0)
        
        insets = .only(left: val)
        XCTAssertEqual(insets.top, 0)
        XCTAssertEqual(insets.left, val)
        XCTAssertEqual(insets.bottom, 0)
        XCTAssertEqual(insets.right, 0)
        
        insets = .only(bottom: val)
        XCTAssertEqual(insets.top, 0)
        XCTAssertEqual(insets.left, 0)
        XCTAssertEqual(insets.bottom, val)
        XCTAssertEqual(insets.right, 0)
        
        insets = .only(right: val)
        XCTAssertEqual(insets.top, 0)
        XCTAssertEqual(insets.left, 0)
        XCTAssertEqual(insets.bottom, 0)
        XCTAssertEqual(insets.right, val)
    }
    
    func testInsetsOnly_twoEdges() {
        let vals: [CGFloat] = [12, 15]
        var insets: UIEdgeInsets = .only(top: vals[0], left: vals[1])
        XCTAssertEqual(insets.top, vals[0])
        XCTAssertEqual(insets.left, vals[1])
        XCTAssertEqual(insets.bottom, 0)
        XCTAssertEqual(insets.right, 0)
        
        insets = .only(top: vals[0], bottom: vals[1])
        XCTAssertEqual(insets.top, vals[0])
        XCTAssertEqual(insets.left, 0)
        XCTAssertEqual(insets.bottom, vals[1])
        XCTAssertEqual(insets.right, 0)
        
        insets = .only(top: vals[0], right: vals[1])
        XCTAssertEqual(insets.top, vals[0])
        XCTAssertEqual(insets.left, 0)
        XCTAssertEqual(insets.bottom, 0)
        XCTAssertEqual(insets.right, vals[1])
        
        insets = .only(left: vals[0], bottom: vals[1])
        XCTAssertEqual(insets.top, 0)
        XCTAssertEqual(insets.left, vals[0])
        XCTAssertEqual(insets.bottom, vals[1])
        XCTAssertEqual(insets.right, 0)
        
        insets = .only(left: vals[0], right: vals[1])
        XCTAssertEqual(insets.top, 0)
        XCTAssertEqual(insets.left, vals[0])
        XCTAssertEqual(insets.bottom, 0)
        XCTAssertEqual(insets.right, vals[1])
        
        insets = .only(bottom: vals[0], right: vals[1])
        XCTAssertEqual(insets.top, 0)
        XCTAssertEqual(insets.left, 0)
        XCTAssertEqual(insets.bottom, vals[0])
        XCTAssertEqual(insets.right, vals[1])
    }
    
    func testInsetsOnly_threeEdges() {
        let vals: [CGFloat] = [12, 32, 54]
        var insets: UIEdgeInsets = .only(top: vals[0], left: vals[1], bottom: vals[2])
        XCTAssertEqual(insets.top, vals[0])
        XCTAssertEqual(insets.left, vals[1])
        XCTAssertEqual(insets.bottom, vals[2])
        XCTAssertEqual(insets.right, 0)
        
        insets = .only(top: vals[0], bottom: vals[1], right: vals[2])
        XCTAssertEqual(insets.top, vals[0])
        XCTAssertEqual(insets.left, 0)
        XCTAssertEqual(insets.bottom, vals[1])
        XCTAssertEqual(insets.right, vals[2])
        
        insets = .only(top: vals[0], left: vals[1], right: vals[2])
        XCTAssertEqual(insets.top, vals[0])
        XCTAssertEqual(insets.left, vals[1])
        XCTAssertEqual(insets.bottom, 0)
        XCTAssertEqual(insets.right, vals[2])
        
        insets = .only(left: vals[0], bottom: vals[1], right: vals[2])
        XCTAssertEqual(insets.top, 0)
        XCTAssertEqual(insets.left, vals[0])
        XCTAssertEqual(insets.bottom, vals[1])
        XCTAssertEqual(insets.right, vals[2])
    }
}
