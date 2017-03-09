//
//  RatingControl.swift
//  FoodTracker
//
//  Created by Hung Nguyen on 3/7/17.
//  Copyright © 2017 com. All rights reserved.
//

import UIKit

@IBDesignable class RatingControl: UIStackView {
    
    
    private var ratingButtons = [UIButton]()
    var rating = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }
    @GKInspectable var StarSize: CGSize = CGSize(width: 44.0, height: 44.0){
        didSet {
            setupButton()
        }
    }
    @GKInspectable var starCount: Int = 5 {
        didSet {
            setupButton()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    func ratingButtonTapped(button: UIButton) {
        guard let index = ratingButtons.index(of: button) else {
            fatalError("The button, \(button), is not in the ratingButtons array: \(ratingButtons)")
        }
        //Calculate the rating of selected button
        let selectedRating = index + 1
        if selectedRating == rating {
            rating = 0
        }
        else {
            rating = selectedRating
        }
    }
    private func updateButtonSelectionStates(){
        for (index,button) in ratingButtons.enumerated(){
            button.isSelected = index < rating
            // Set the hint string for the currently selected star
            let hintString: String?
            if rating == index + 1 {
                hintString = "Tap to reset the rating to zero."
            } else {
                hintString = nil
            }
            
            // Calculate the value string
            let valueString: String
            switch (rating) {
            case 0:
                valueString = "No rating set."
            case 1:
                valueString = "1 star set."
            default:
                valueString = "\(rating) stars set."
            }
            
            // Assign the hint string and value string
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
        }
    }
    private func setupButton(){
        
        for button in ratingButtons{
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        let bundle  = Bundle(for: type(of: self))
        let filledStar = UIImage(named: "filledStar", in: bundle, compatibleWith: self.traitCollection)
        let emptyStar = UIImage(named: "emptyStar", in: bundle, compatibleWith: self.traitCollection)
        let hightlightedStar = UIImage(named: "hightlightedStar", in: bundle, compatibleWith: self.traitCollection)
        
        for _ in 0..<starCount {
            
            // create button
            let button = UIButton()
            
            //Set the button images
            button.setImage(#imageLiteral(resourceName: "emptyStar"), for: .normal)
            button.setImage(#imageLiteral(resourceName: "filledStar"), for: .selected)
            button.setImage(#imageLiteral(resourceName: "hightlightedStar"), for: .highlighted)
            button.setImage(#imageLiteral(resourceName: "hightlightedStar"), for: [.highlighted, .selected])
        
            //Add constraints
            button.translatesAutoresizingMaskIntoConstraints = false
            button.heightAnchor.constraint(equalToConstant: StarSize.width).isActive = true
            button.widthAnchor.constraint(equalToConstant: StarSize.height).isActive = true
            
            //Set the accessibility label
            let index = 6
            button.accessibilityLabel = "Set\(index + 1) star rating"
        
            //Setup the button action
            button.addTarget(self, action: #selector(RatingControl.ratingButtonTapped(button:)), for: .touchUpInside)
            //Add the button to the stack
            addArrangedSubview(button)
        
            //Add the new button to the rating button array
            ratingButtons.append(button)
        }
        updateButtonSelectionStates()
        
        
    }
}
