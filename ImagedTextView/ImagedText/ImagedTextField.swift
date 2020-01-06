//
//  ImagedTextField.swift
//  ImagedTextView
//
//  Created by Snappii on 1/6/20.
//  Copyright © 2020 Max Subbotin. All rights reserved.
//

import Foundation
import UIKit

class ImagedTextField: UITextField {
    //private var backgroundImageView = UIImageView()
    //private var textLabel = UILabel()
    private var textLabel = ImagedTextLabel(frame: .zero)
    public var image: UIImage? {
        get {
            return textLabel.image
        }
        set {
            textLabel.image = newValue
        }
    }
    override var font: UIFont? {
        get {
            return super.font
        }
        set {
            super.font = newValue
            textLabel.font = newValue ?? UIFont.systemFont(ofSize: 24)
        }
    }
    override var textColor: UIColor? {
        get {
            return super.textColor
        }
        set {
            super.textColor = .clear
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        super.textColor = .clear
        self.clipsToBounds = true
        
        applyUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        applyUI()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    func applyUI() {
        self.addSubview(textLabel)
        textLabel.textAlignment = .left

        textLabel.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        
        NotificationCenter.default.addObserver(self, selector: #selector(onTextChanged(_:)), name: UITextField.textDidChangeNotification, object: self)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        textLabel.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        textLabel.frame = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
    }
    
    @objc private func onTextChanged(_ notification: Notification) {
        if notification.object != nil &&
            notification.object is ImagedTextField &&
            (notification.object! as! ImagedTextField == self) {
            let txt = (notification.object as! ImagedTextField).text
            textLabel.text = txt
        }
    }
}
