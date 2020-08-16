//
//  OtherTests.swift
//  Accio_Tests
//
//  Created by aksc on 16/08/20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import XCTest
@testable import Accio

class ViewCreationTests: XCTestCase {
    func testCreateView() {
        let view: UIView = create { $0.backgroundColor = .red }
        XCTAssertEqual(view.backgroundColor, .red)
    }
    
    func testCreateParameterizedView() {
        let rect = CGRect(x: 10, y: 20, width: 30, height: 40)
        let view = create(UIView(frame: rect)) { $0.backgroundColor = .red }
        XCTAssertEqual(view.backgroundColor, .red)
        XCTAssertEqual(view.frame, rect)
    }
}

class AnchorTypeTests: XCTestCase {
    let allCases: [AnchorType] = [.top, .bottom, .leading, .trailing, .left, .right, .centerX, .centerY]
    
    func testAxis() {
        allCases.forEach { anchor in
            switch anchor {
            case .leading, .trailing, .left, .right, .centerX:
                XCTAssertTrue(anchor.isXAxis)
                XCTAssertFalse(anchor.isYAxis)
                
            case .top, .bottom, .centerY:
                XCTAssertTrue(anchor.isYAxis)
                XCTAssertFalse(anchor.isXAxis)
            }
        }
    }
    
    func testNegativeOffset() {
        allCases.forEach { anchor in
            switch anchor {
            case .trailing, .bottom, .right: XCTAssertTrue(anchor.usesNegativeOffset)
            default: XCTAssertFalse(anchor.usesNegativeOffset)
            }
        }
    }
}
