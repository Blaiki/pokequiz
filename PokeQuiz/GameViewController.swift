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
        var str = "Hello,playgrou"
        var letterBox = Array(str.characters)
        genFirstRow(array: letterBox, color: .red)
        genSecondRow(array: letterBox, color: .red)
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
    func genFirstRow(array:[Character],color:UIColor){
        for value in 0 ... 6{
            firstRowBtnStack.addArrangedSubview(btnGenerator(title: String(array[value]), bgColor: color, tag: value))
        }
    }
    func genSecondRow(array:[Character],color:UIColor){
            for value in 7 ... 13{
            lastRowBtnStack.addArrangedSubview(btnGenerator(title: String(array[value]), bgColor: color, tag: value))
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
