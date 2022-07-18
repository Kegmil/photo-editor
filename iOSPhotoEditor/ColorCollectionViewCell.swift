//
//  ColorCollectionViewCell.swift
//  Photo Editor
//
//  Created by Mohamed Hamed on 5/1/17.
//  Copyright © 2017 Mohamed Hamed. All rights reserved.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var colorView: UIView!
    
    let ratio = 1.7
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        colorView.layer.cornerRadius = colorView.frame.width / 2
        colorView.clipsToBounds = true
        colorView.layer.borderWidth = 1.0
        colorView.layer.borderColor = UIColor.white.cgColor
    }
    
    override var isSelected: Bool {
        didSet {
            let previouTransform =  colorView.transform
           
            if isSelected {
                if(previouTransform.a > 1.0 && previouTransform.d > 1.0) {
                    return
                }
                UIView.animate(withDuration: 0.2,
                               animations: {
                    self.colorView.transform = self.colorView.transform.scaledBy(x: self.ratio, y: self.ratio)
                })
            } else {
                UIView.animate(withDuration: 0.2) {
                    self.colorView.transform  = self.colorView.transform.scaledBy(x: 1/self.ratio, y: 1/self.ratio)
                }
            }
        }
    }
}
