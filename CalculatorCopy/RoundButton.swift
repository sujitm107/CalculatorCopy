//
//  RoundButton.swift
//  CalculatorCopy
//
//  Created by Sujit Molleti on 7/4/20.
//  Copyright © 2020 Sujit Molleti. All rights reserved.
//

import UIKit

class RoundButton: UIButton {
    
    
    override func draw(_ rect: CGRect) {
        
        self.layer.cornerRadius = 38
        self.layer.masksToBounds = true
        //super.draw(rect)
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
