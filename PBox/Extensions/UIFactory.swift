//
//  UIFactory.swift
//  PBox
//
//  Created by Carlos Uribe on 07/04/18.
//  Copyright © 2018 Axcan. All rights reserved.
//

import UIKit

class UIFactory{
    static let shared:UIFactory = UIFactory()
    private init(){
    }

    func getButton(withText text:String,
                   bordered:Bool = false,
                   borderColor:UIColor = .clear,
                   backgroundColor:UIColor = .clear,
                   cornerRadius:CGFloat,
                   titleColor:UIColor = .white,
                   textSize:CGFloat) -> UIButton {
        let button:UIButton = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.clipsToBounds = true
        button.setTitleColor(titleColor, for: UIControlState())
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: textSize)
        button.backgroundColor = backgroundColor
        button.layer.cornerRadius = cornerRadius
        if text != "" {
            button.setTitle(text, for: UIControlState())
        }
        if bordered {
            button.layer.borderColor = borderColor.cgColor
            button.layer.borderWidth = 1
        }

        return button
    }

    func getHorizontalStackView(backgroundColor:UIColor) -> UIStackView{
        let stackView:UIStackView = UIStackView()
        stackView.isUserInteractionEnabled = true
        stackView.backgroundColor = backgroundColor
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.alignment = .center

        return stackView
    }
}
