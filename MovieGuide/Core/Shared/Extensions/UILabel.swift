//
//  UILabel.swift
//  Smiles
//
//  Created by Usman Tarar on 01/10/2020.
//  Copyright © 2020 UsmanTarar. All rights reserved.
//

import UIKit

extension UILabel {
   
    @IBInspectable
    var letterSpace: CGFloat {
        set {
            let attributedString: NSMutableAttributedString!
            if let currentAttrString = attributedText {
                attributedString = NSMutableAttributedString(attributedString: currentAttrString)
            }
            else {
                attributedString = NSMutableAttributedString(string: text ?? "")
                text = nil
            }
            
            attributedString.addAttribute(NSAttributedString.Key.kern,
                                          value: newValue,
                                          range: NSRange(location: 0, length: attributedString.length))
            
            attributedText = attributedString
        }
        
        get {
            if let currentLetterSpace = attributedText?.attribute(NSAttributedString.Key.kern, at: 0, effectiveRange: .none) as? CGFloat {
                return currentLetterSpace
            }
            else {
                return 0
            }
        }
    }
    
    @IBInspectable
       var lineSpace: CGFloat {
           set{

               //get our existing style or make a new one
               let paragraphStyle: NSMutableParagraphStyle
               if let existingStyle = attributedText?.attribute(NSAttributedString.Key.paragraphStyle, at: 0, effectiveRange: .none) as? NSParagraphStyle, let mutableCopy = existingStyle.mutableCopy() as? NSMutableParagraphStyle  {
                   paragraphStyle = mutableCopy
               } else {
                   paragraphStyle = NSMutableParagraphStyle()
                   paragraphStyle.lineSpacing = 1.0
                   paragraphStyle.alignment = self.textAlignment
               }
               paragraphStyle.lineHeightMultiple = newValue

               //set our text from existing text
               let attrString = NSMutableAttributedString()
               if let text = self.text {
                   attrString.append( NSMutableAttributedString(string: text))
                attrString.addAttribute(NSAttributedString.Key.font, value: self.font as Any, range: NSMakeRange(0, attrString.length))
               }
               else if let attributedText = self.attributedText {
                   attrString.append( attributedText)
               }

               //add our attributes and set the new text
               attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attrString.length))
               self.attributedText = attrString
           }

           get {
               if let paragraphStyle = attributedText?.attribute(NSAttributedString.Key.paragraphStyle, at: 0, effectiveRange: .none) as? NSParagraphStyle {
                   return paragraphStyle.lineHeightMultiple
               }
               return 0
        }
    }
}
