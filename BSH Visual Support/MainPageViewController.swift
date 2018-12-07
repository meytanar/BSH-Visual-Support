//
//  MainPageViewController.swift
//  BSH Visual Support
//
//  Created by BSH_MRM on 5.12.2018.
//  Copyright © 2018 BSH_MRM. All rights reserved.
//

import UIKit
import SwiftyButton

class MainPageViewController: UIViewController {

    @IBOutlet weak var customButtonContainerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
 
        let button = CustomPressableButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        customButtonContainerView.addSubview(button)
        customButtonContainerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[button]|", metrics: nil, views: ["button": button]))
        customButtonContainerView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[button]|", metrics: nil, views: ["button": button]))
        button.colors = .init(
            button: UIColor(red: 52/255, green: 152/255, blue: 219/255, alpha: 1),
            shadow: UIColor(red: 41/255, green: 128/255, blue: 185/255, alpha: 1)
        )
        
        let indicator = UIActivityIndicatorView(style: .white)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        button.contentView.addSubview(indicator)
        /*button.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[indicator]-10-|", metrics: nil, views: ["indicator": indicator]))
        indicator.startAnimating()*/
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        button.contentView.addSubview(label)
        button.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-10-[label]-10-|", metrics: nil, views: ["label": label]))
        button.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-60-[label]-50-|", metrics: nil, views: ["indicator": indicator, "label": label]))
        /*button.contentView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-15-[indicator]-10-[label]-15-|", metrics: nil, views: ["indicator": indicator, "label": label]))*/
        label.text = "Log In"
        label.textColor = UIColor.white
        
        // Regression: Make sure that button with cornerRadius = 0 and shadowHeight = 0 doesn't crash
        // Was crashing in 0.3.1
        let zeroButton = PressableButton()
        zeroButton.shadowHeight = 0
        zeroButton.cornerRadius = 0
        view.addSubview(zeroButton)
        zeroButton.setTitle("Zero Button", for: .normal)
        
    }
   
}
