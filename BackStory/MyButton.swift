//
//  MyButton.swift
//  BackStory
//
//  Created by Nicholas Richu on 12/7/17.
//  Copyright © 2017 Richu-Vlahos. All rights reserved.
//

import UIKit
@IBDesignable class MyButton: UIButton
{
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateCornerRadius()
    }
    
    @IBInspectable var rounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }
    
    func updateCornerRadius() {
        layer.cornerRadius = rounded ? frame.size.height / 2 : 0
    }
}
