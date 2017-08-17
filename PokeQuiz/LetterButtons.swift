//
//  LetterButtons.swift
//  PokeQuiz
//
//  Created by Alexander Ganzer on 17.08.17.
//  Copyright © 2017 Alexander Ganzer. All rights reserved.
//

import UIKit

class LetterButtons: UIStackView {
    
    var letterButtonsStackView = UIStackView()
    
    var buttonLabel = UILabel()
    
    // TODO set the correct team color
    var teamColor = UIColor.red
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Set axis to horizontal
        axis = .horizontal
        
        // Initialize the letter label and add constraints
        buttonLabel.textAlignment = .center
        buttonLabel.textColor = UIColor.white
        buttonLabel.backgroundColor = teamColor
        
        let letterButtonsHeight = NSLayoutConstraint(item: buttonLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20)
        buttonLabel.addConstraint(letterButtonsHeight)
        
        let letterButtonsWidth = NSLayoutConstraint(item: buttonLabel, attribute: .width, relatedBy: .equal
            , toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 20)
        buttonLabel.addConstraint(letterButtonsWidth)
        
        // Initialize the letter stackview and add constraints
        letterButtonsStackView.addArrangedSubview(buttonLabel)
        letterButtonsStackView.alignment = .center
        addArrangedSubview(letterButtonsStackView)
        
        let stackViewWidthConstraint = NSLayoutConstraint(item: letterButtonsStackView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
        letterButtonsStackView.addConstraint(stackViewWidthConstraint)
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Set letterLabel text
    func setLetterLabelText(letterText: String) {
        buttonLabel.text = letterText
    }
}
