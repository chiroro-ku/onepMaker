//
//  Button.swift
//  onepMaker
//
//  Created by 小林千浩 on 2023/06/09.
//

import UIKit

class Button: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.layer.cornerRadius = 10;
        self.titleLabel?.adjustsFontSizeToFitWidth = true
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.layer.cornerRadius = 10;
        self.titleLabel?.adjustsFontSizeToFitWidth = true
    }
}
