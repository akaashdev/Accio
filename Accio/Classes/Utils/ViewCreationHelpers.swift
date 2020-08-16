//
//  ViewCreationHelpers.swift
//  Accio
//
//  Created by Akaash Dev on 31/05/20.
//  Copyright © 2020 Akaash Dev. All rights reserved.
//

import UIKit

public typealias ViewSetup<V: UIView> = (V)->()

public func create<V: UIView>(_ setup: ViewSetup<V>? = nil) -> V {
    let view = V()
    setup?(view)
    return view
}

public func create<V: UIView>(_ view: V, setup: ViewSetup<V>? = nil) -> V {
    setup?(view)
    return view
}
