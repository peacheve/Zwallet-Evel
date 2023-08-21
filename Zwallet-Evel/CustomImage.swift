//
//  CustomImage.swift
//  Zwallet-Evel
//
//  Created by DDL10 on 19/08/23.
//

import UIKit

class CustomImage: UIImageView {
    
    @IBInspectable
    var cornerRadius: CGFloat = 0 {
        didSet {
            update()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        update()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        update()
    }
    func update() {
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
    }
}
