//
//  View.swift
//  Tamago_1
//
//  Created by JunsangYu on 24/05/2018.
//  Copyright © 2018 test-web-server. All rights reserved.
//

import Foundation
import UIKit

class View {
    func lbl(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, text: String?) -> UILabel {
        let view = UILabel()
        view.frame = CGRect(x: x, y: y, width: width, height: height)
        view.text = text
        view.font = UIFont.systemFont(ofSize: 50.0)
        view.textColor = UIColor.black
        view.textAlignment = NSTextAlignment.center
        return view
    }
    
    func img(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, img: UIImage) -> UIImageView {
        let view = UIImageView()
        view.frame = CGRect(x: x, y: y, width: width, height: height)
        view.image = img
        return view
    }
    func btn(x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, text: String) -> UIButton {
        let view = UIButton(type: .system)
        view.frame = CGRect(x: x, y: y, width: width, height: height)
        view.setTitle(text, for: .normal)
        return view
    }
}
