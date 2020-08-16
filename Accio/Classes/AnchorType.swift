//
//  AnchorType.swift
//  Accio
//
//  Created by Akaash Dev on 30/05/20.
//  Copyright © 2020 Akaash Dev. All rights reserved.
//

import UIKit

public enum AnchorType {
    enum Axis {
        case x, y
    }
    
    case leading, trailing, top, bottom, left, right, centerX, centerY
    
    static let xAxisAnchors: Set<AnchorType> = [.leading, .trailing, .left, .right, centerX]
    static let yAxisAnchors: Set<AnchorType> = [.top, .bottom, centerY]
    static let negativeOffsetAnchors: Set<AnchorType> = [.trailing, .right, .bottom]
    
    var axis: Axis {
        if AnchorType.xAxisAnchors.contains(self) { return .x }
        if AnchorType.yAxisAnchors.contains(self) { return .y }
        fatalError("Unknown AnchorType found.")
    }
    
    public var isXAxis: Bool { return axis == .x }
    
    public var isYAxis: Bool { return axis == .y }
    
    public var usesNegativeOffset: Bool { return AnchorType.negativeOffsetAnchors.contains(self) }
    
    func xAxisAnchor(of view: UIView, following guideType: LayoutGuideType? = nil) -> NSLayoutXAxisAnchor {
        let layoutGuide = guideType?.layoutGuide(of: view)
        switch self {
        case .leading: return layoutGuide?.leadingAnchor ?? view.leadingAnchor
        case .trailing: return layoutGuide?.trailingAnchor ?? view.trailingAnchor
        case .left: return layoutGuide?.leftAnchor ?? view.leftAnchor
        case .right: return layoutGuide?.rightAnchor ?? view.rightAnchor
        case .centerX: return layoutGuide?.centerXAnchor ?? view.centerXAnchor
        default: fatalError("\(self) is not a X-Axis Anchor")
        }
    }
    
    func yAxisAnchor(of view: UIView, following guideType: LayoutGuideType? = nil) -> NSLayoutYAxisAnchor {
        let layoutGuide = guideType?.layoutGuide(of: view)
        switch self {
        case .top: return layoutGuide?.topAnchor ?? view.topAnchor
        case .bottom: return layoutGuide?.bottomAnchor ?? view.bottomAnchor
        case .centerY: return layoutGuide?.centerYAnchor ?? view.centerYAnchor
        default: fatalError("\(self) is not a Y-Axis Anchor")
        }
    }
}
