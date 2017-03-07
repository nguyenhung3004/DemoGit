//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Hung Nguyen on 3/7/17.
//  Copyright © 2017 com. All rights reserved.
//

import UIKit

class RatingControl: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    func ratingButtonTapped(button: UIButton) {
        print("Button pressed")
    }
    
    private func setupButton(){
        // create button
        let button = UIButton()
        button.backgroundColor = UIColor.red
        
        //Add constraints
        button.translatesAutoresizingMaskIntoConstraints = false
        button.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        button.widthAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        //Setup the button action
        button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
        //Add the button to the stack
        addArrangedSubview(button)
    }
}
