//
//  GroundedViews.swift
//  Artable
//
//  Created by Gerson Costa on 18/05/2019.
//  Copyright © 2019 Gerson Costa. All rights reserved.
//

import Foundation
import UIKit

class RoundedButton: UIButton {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 5
    }
}

class RoundedShadowView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 5
        layer.shadowColor = AppColors.blue?.cgColor
        layer.shadowOpacity = 0.4
        layer.shadowOffset =  CGSize.zero
        layer.shadowRadius = 3
    }
}

class RoundedImageView: UIImageView {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.cornerRadius = 5
    }
}
