//
//  ImagedTextLabel.swift
//  ImagedTextView
//
//  Created by Snappii on 1/5/20.
//  Copyright © 2020 Max Subbotin. All rights reserved.
//

import Foundation
import UIKit

class ImagedTextLabel: UIImageView {
    private var label = UILabel()
    public var font: UIFont {
        get {
            return label.font
        }
        set {
            label.font = newValue
        }
    }
    public var textAlignment: NSTextAlignment {
        get {
            return label.textAlignment
        }
        set {
            label.textAlignment = newValue
        }
    }
    public var text: String? {
        get {
            return label.text
        }
        set {
            label.text = newValue
        }
    }
    public var numberOfLines: Int {
        get {
            return label.numberOfLines
        }
        set {
            label.numberOfLines = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        applyUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        applyUI()
    }
    
    func applyUI() {
        self.contentMode = .scaleAspectFill
        
        self.addSubview(label)
        label.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        
        label.textAlignment = .center
        label.text = "TEXT"
        
        self.mask = label
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = CGRect(x: 0, y: 0, width: frame.width, height: frame.height)
        print("s")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        label.frame = CGRect(x: 0, y: 0, width: rect.width, height: rect.height)
    }
}
