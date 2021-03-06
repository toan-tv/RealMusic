//
//  BWCircularSliderView.swift
//  TB_CustomControlsSwift
//
//  Created by Yari D'areglia on 14/11/14.
//  Copyright (c) 2014 Yari D'areglia. All rights reserved.
//

import UIKit

@objc protocol BWCircularSliderViewDelegate {
    optional func changeSliderValue(value: Int)
}

@IBDesignable class BWCircularSliderView: UIView {
    var slider:BWCircularSlider!
    var delegate: BWCircularSliderViewDelegate!
    @IBInspectable var startColor:UIColor = UIColor.redColor()
    @IBInspectable var endColor:UIColor = UIColor.blueColor()
    
    #if TARGET_INTERFACE_BUILDER
    override func willMoveToSuperview(newSuperview: UIView?) {
        
        let slider:BWCircularSlider = BWCircularSlider(startColor:self.startColor, endColor:self.endColor, frame: self.bounds)
        self.addSubview(slider)
    
    }
    
    #else
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Build the slider
        slider = BWCircularSlider(startColor:self.startColor, endColor:self.endColor, frame: self.bounds)
        
        // Attach an Action and a Target to the slider
        slider.addTarget(self, action: #selector(BWCircularSliderView.valueChanged(_:)), forControlEvents: UIControlEvents.ValueChanged)
        
        // Add the slider as subview of this view
        self.addSubview(slider)

    }
    #endif
    
    func valueChanged(slider:BWCircularSlider){
        // Do something with the value...
        if let delegate = self.delegate {
            delegate.changeSliderValue!(slider.angle)
        }

    }
}
