//
//  XibView.swift
//  Aristotle
//
//  Created by Javan Chen on 2017/7/11.
//  Copyright © 2017年 Fuhu Inc. All rights reserved.
//

import UIKit

@IBDesignable
class XibView: UIView {
    var baseView:UIView!
    
    // Initial by Programmatically
    override init(frame: CGRect) {
        super.init(frame: frame)
        baseView = loadViewFromNib()
        addSubview(baseView)
        addConstraints()
    }
    
    // Initial by Storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        baseView = loadViewFromNib()
        addSubview(baseView)
        addConstraints()
    }
    
    // Load View form Xib
    func loadViewFromNib() -> UIView {
        let className = type(of: self)
        let bundle = Bundle(for: className)
        let name = NSStringFromClass(className).components(separatedBy: ".").last
        let nib = UINib(nibName: name!, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        return view
    }
    
    // Setup 'baseView' constraints
    func addConstraints() {
        baseView.translatesAutoresizingMaskIntoConstraints = false
        baseView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        baseView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        baseView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        baseView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
