//
//  LayoutGuideType.swift
//  Accio
//
//  Created by Akaash Dev on 30/05/20.
//  Copyright © 2020 Akaash Dev. All rights reserved.
//

import UIKit

public enum LayoutGuideType {
    case none, layoutMargins, safeArea, readable
    
    public func layoutGuide(of view: UIView) -> UILayoutGuide? {
        switch self {
        case .layoutMargins: return view.layoutMarginsGuide
        case .safeArea:
            if #available(iOS 11.0, *) { return view.safeAreaLayoutGuide }
            else { return view.layoutMarginsGuide }
        case .readable: return view.readableContentGuide
        case .none: return nil
        }
    }
}
