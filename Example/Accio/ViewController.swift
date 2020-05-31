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

    private func setupViews() {
        view.addSubview(redView)
        view.addSubview(greenView)
    }
    
    private func setupConstraints() {
        redView.fill(following: .layoutMargins)
        
        greenView.setConstantSize(width: 250, height: 250)
        greenView.alignCenter()
    }
    
}

