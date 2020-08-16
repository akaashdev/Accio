//
//  EdgeInsetsExtension.swift
//  Accio
//
//  Created by Akaash Dev on 31/05/20.
//  Copyright © 2020 Akaash Dev. All rights reserved.
//

import UIKit

public extension UIEdgeInsets {
    static func all(_ inset: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    static func vertical(_ inset: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: inset, left: 0, bottom: inset, right: 0)
    }
    
    static func horizontal(_ inset: CGFloat) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: inset, bottom: 0, right: inset)
    }
    
    static func only(top: CGFloat = 0, left: CGFloat = 0, bottom: CGFloat = 0, right: CGFloat = 0) -> UIEdgeInsets {
        return UIEdgeInsets(top: top, left: left, bottom: bottom, right: right)
    }
}
