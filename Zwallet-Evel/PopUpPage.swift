//
//  PopUpPage.swift
//  Zwallet-Evel
//
//  Created by DDL10 on 12/08/23.
//

import UIKit

class CustomPopUpPage: UIView {
    
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
