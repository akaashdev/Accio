//
//  ViewController.swift
//  Accio
//
//  Created by Akaash Dev on 05/31/2020.
//  Copyright (c) 2020 Akaash Dev. All rights reserved.
//

import UIKit
import Accio

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemYellow
        setupViews()
        setupConstraints()
    }

    private lazy var redView: UIView = create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .systemRed
    }
    
    private lazy var greenView: UIView = create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .systemGreen
    }
    
    private lazy var blueView: UIView = create {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .systemBlue
    }

    private func setupViews() {
        view.addSubview(redView)
        view.addSubview(greenView)
        view.addSubview(blueView)
    }
    
    private func setupConstraints() {
        redView.fill(following: .layoutMargins, insets: .all(10))
        
        greenView.setConstantSize(width: 250, height: 250)
        greenView.alignCenter()
        
        blueView.setConstantHeight(100)
        blueView.anchorBottom(padded: 70)
        blueView.fillWidth(padded: 30)
    }
    
}

