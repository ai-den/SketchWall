//
//  File.swift
//  SketchWall
//
//  Created by Aiden on 20/11/2021.
//

import Foundation
import UIKit

class ColorButtonFactory {
    
    func createColorButton(bgColor: UIColor,
                           text: String?,
                           borderColor: UIColor,
                           width: Int,
                           forTarget target: Any?,
                           forAction action: Selector,
                           forEvent controlEvent: UIControl.Event) -> UIButton {
        
        let button = UIButton(type: .system)
        if text != nil {
            button.titleLabel?.text = text!
        }
        button.backgroundColor = bgColor
        button.layer.borderColor = borderColor.cgColor
        button.layer.borderWidth = CGFloat(integerLiteral: width)
        button.addTarget(target, action: action, for: controlEvent)
        return button
    }
    
    // TODO: This function is not in used but kept for future usage
    func createNormalButton(text: String, font: UIFont, forTarget target: Any?, forAction action: Selector, forEvent controlEvent: UIControl.Event) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(text, for: .normal)
        button.titleLabel?.font = font
        button.addTarget(self, action: action, for: controlEvent)
        return button
    }
}
