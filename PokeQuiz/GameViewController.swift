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
        let testBtn1:UIButton = btnGenerator(title: "btn1", bgColor: .blue,tag:1)
        let testBtn2:UIButton = btnGenerator(title: "btn2", bgColor: .brown,tag:2)
        let testBtn3:UIButton = btnGenerator(title: "btn3", bgColor: .red,tag:3)
        lastRowBtnStack.addArrangedSubview(testBtn1)
        lastRowBtnStack.addArrangedSubview(testBtn2)
        lastRowBtnStack.addArrangedSubview(testBtn3)
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
    
    func buttonAction(sender: UIButton!) {
        let btn: UIButton = sender
        if btn.tag == 1 {
            btn.backgroundColor = UIColor.black
        }
        if btn.tag == 2 {
            btn.backgroundColor = UIColor.red
        }
        if btn.tag == 3 {
            btn.backgroundColor = UIColor.brown
        }
    }
    
    func btnGenerator(title:String,bgColor:UIColor,tag:Int)->UIButton{
        let button:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        button.backgroundColor = bgColor
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: UIControlEvents.touchUpInside)
        button.tag = tag
        return button
    }
    
    // Adding 14 Letterbuttons
    func addLetterButton() {
        // TODO
        
    }
}
