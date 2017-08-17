//
//  GameViewController.swift
//  PokeQuiz
//
//  Created by Alexander Ganzer on 14.08.17.
//  Copyright © 2017 Alexander Ganzer. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet weak var imgPoke: UIImageView!
    
    @IBOutlet weak var labelStack: UIStackView!
    @IBOutlet weak var firstRowBtnStack: UIStackView!
    @IBOutlet weak var lastRowBtnStack: UIStackView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let testBtn1:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        testBtn1.backgroundColor = UIColor.blue
        testBtn1.setTitle("test1", for: .normal)
        let testBtn2:UIButton = UIButton(frame: CGRect(x: 100, y: 0, width: 100, height: 40))
        testBtn2.backgroundColor = UIColor.red
        testBtn2.setTitle("test2", for: .normal)
        lastRowBtnStack.addArrangedSubview(testBtn1)
        lastRowBtnStack.addArrangedSubview(testBtn2)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    // Adding Sqaures below the Pokemon picture
    func addResultSquares() {
        // TODO
        
    }
    
    // Adding 14 Letterbuttons
    func addLetterButton() {
        // TODO
        
    }
}
