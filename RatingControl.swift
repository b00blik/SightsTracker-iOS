//
//  RatingControl.swift
//  SightsTracker
//
//  Created by Admin on 26.12.15.
//  Copyright © 2015 ru.b00blik. All rights reserved.
//

import UIKit

class RatingControl: UIView {
    
    //MARK: Properties
    
    var rating = 0{
        didSet{
            setNeedsLayout()
        }
    }
    var ratingButtons = [UIButton]()
    var spacing = 5
    var stars = 5

    //MARK: Initialization
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let filledStarImage = UIImage(named: "filledStar")
        let emptyStarImage = UIImage(named: "emptyStar")
        
        for (var i = 0; i<stars; i++){
            let button = UIButton(frame: CGRect(x:0, y:0, width: 44, height: 44))
            
            button.setImage(emptyStarImage, forState: .Normal)
            button.setImage(filledStarImage, forState: .Selected)
            button.setImage(filledStarImage, forState: [.Highlighted, .Selected])
            
            button.adjustsImageWhenHighlighted = false
            
            button.addTarget(self, action: "ratingButtonTapped:", forControlEvents: .TouchDown)
            ratingButtons += [button]
            addSubview(button)
        }
        
    }
    
    override func intrinsicContentSize() -> CGSize {
        return CGSize(width: 240, height: 44)
    }
    
    override func layoutSubviews() {
        let buttonSize = Int(frame.size.height)
        var buttonFrame = CGRect(x: 0, y: 0, width: buttonSize, height: buttonSize)
        for(index, button) in ratingButtons.enumerate(){
            buttonFrame.origin.x = CGFloat(index*(buttonSize + spacing))
            button.frame = buttonFrame
        }
    }
    
    //MARK: Button Action
    func ratingButtonTapped(button: UIButton){
        rating = ratingButtons.indexOf(button)!+1
        updateButtonSelectionStates()
    }
    
    func updateButtonSelectionStates(){
        for (index, button) in ratingButtons.enumerate() {
            // If the index of a button is less than the rating, that button should be selected.
            button.selected = index < rating
        }
    }
    

}
