//
//  LetterButton.swift
//  PokeQuiz
//
//  Created by Alexander Ganzer on 17.08.17.
//  Copyright © 2017 Alexander Ganzer. All rights reserved.
//

import UIKit

class AnswerLabel: UIStackView {

    var letterLabelStackView = UIStackView()
    
    var letterLabel = UILabel()
    var teamColor = UIColor.red
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    // Set axis to horizontal
    axis = .horizontal
        
    // Initialize the letter label and add constraints
    letterLabel.textAlignment = .center
    letterLabel.textColor = UIColor.white
    letterLabel.backgroundColor = teamColor
    
        let letterLabelHeight = NSLayoutConstraint(item: letterLabel, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 10)
        letterLabel.addConstraint(letterLabelHeight)
        
        let letterLabelWidth = NSLayoutConstraint(item: letterLabel, attribute: .width, relatedBy: .equal
            , toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 10)
        letterLabel.addConstraint(letterLabelWidth)
        
        // Initialize the letter stackview and add constraints
        letterLabelStackView.addArrangedSubview(letterLabel)
        letterLabelStackView.alignment = .center
        addArrangedSubview(letterLabelStackView)
        
        let stackViewWidthConstraint = NSLayoutConstraint(item: letterLabelStackView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 300)
        letterLabelStackView.addConstraint(stackViewWidthConstraint)
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Set letterLabel text
    func setLetterLabelText(letterText: String) {
        letterLabel.text = letterText
    }
}
