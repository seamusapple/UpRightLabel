//
//  UpRightLabel.swift
//  UpRightLabel
//
//  Created by 潘东 on 2016/10/25.
//  Copyright © 2016年 潘东. All rights reserved.
//

import UIKit

class UpRightLabel: UILabel {
    var textAttributes: [String: AnyObject]!
    
    convenience init(fontName: String, labelText: String, fontSize: CGFloat, lineHeight: CGFloat) {
        
        self.init()
        
        let font = UIFont(name: fontName, size: fontSize) as UIFont!
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = lineHeight
        
        textAttributes = [NSFontAttributeName: font!, NSParagraphStyleAttributeName: paragraphStyle]
        
        let labelSize = sizeHeightWithText(labelText: labelText, fontSize: fontSize, textAttributes: textAttributes)
        
        self.frame = CGRect(x: 0, y: 0, width: labelSize.width, height: labelSize.height)
        self.attributedText = NSAttributedString(string: labelText, attributes: textAttributes)
        self.lineBreakMode = .byCharWrapping
        self.numberOfLines = 0
    }
    
    func sizeHeightWithText(labelText: String,
                            fontSize: CGFloat,
                            textAttributes: [String: AnyObject]) -> CGRect {
        return labelText.boundingRect(with: CGSize(width: fontSize, height: 480), options: .usesLineFragmentOrigin, attributes: textAttributes, context: nil)
    }
}
