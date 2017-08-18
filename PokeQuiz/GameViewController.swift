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
    
    var btnArr = [BtnTagged]()
    var quiz:QuizItem? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //spot to load new image
        quiz = QuizItem(key: "hello", image: imgPoke.image!)
        
        var letterBox:[Character] = quiz!.generateArray()
        letterBox.shuffle()
        imgPoke.image = quiz!.imageShadow()!
        genFirstRow(array: letterBox, color: .red)
        genSecondRow(array: letterBox, color: .red)
        genLabel(length: quiz!.key.characters.count,color: .red)
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
        if btn.tag < 20 {
            btn.isEnabled = false
            btn.alpha = 0.0
            var index:Int = getCurFreeLabel()
            if(index == -1){
                clearLabels()
                index = 0
            }
            btnArr[index].thisBtn.setTitle(btn.title(for: .normal), for: .normal)
            btnArr[index].prevBtn = btn
            if(checkCorrect()){
                imgPoke.image = quiz!.image
            }
        }
        if btn.tag >= 20 {
            if(btn.title(for: .normal) != " "){
                clearLabel(btn: btn)
            }
        }
    }
    
    func checkCorrect()->Bool{
        var tmpStr:String = ""
        for index in 0 ... btnArr.count-1{
            if let _:UIButton = btnArr[index].prevBtn{
                tmpStr += btnArr[index].thisBtn.title(for: .normal)!
            }
        }
        if(tmpStr == quiz!.key){
            return true
        }
        return false
    }
    
    func genLabel(length:Int,color: UIColor){
        for value in 0 ... length-1{
            let btn:UIButton = btnGenerator(title:" ", bgColor: color, tag: value+20)
            btnArr.append(BtnTagged(thisBtn: btn,prevBtn:nil))
            labelStack.addArrangedSubview(btn)
        }
    }
    
    func getCurFreeLabel()->Int{
        for index in 0 ... btnArr.count-1{
            guard let _:UIButton = btnArr[index].prevBtn else {
                return index
            }
        }
        return -1
    }
    
    func clearLabels(){
        for index in 0 ... btnArr.count-1{
            if let _:UIButton = btnArr[index].prevBtn{
                btnArr[index].prevBtn!.isEnabled = true
                btnArr[index].prevBtn!.alpha = 1.0
                btnArr[index].prevBtn = nil
                btnArr[index].thisBtn.setTitle(" ", for: .normal)
            }
        }
        quiz!.attempt += 1
    }
    
    func clearLabel(btn:UIButton){
        for index in 0 ... btnArr.count-1{
            if(btnArr[index].thisBtn.isEqual(btn)){
                if let _:UIButton = btnArr[index].prevBtn{
                    btnArr[index].prevBtn!.isEnabled = true
                    btnArr[index].prevBtn!.alpha = 1.0
                    btnArr[index].prevBtn = nil
                    btnArr[index].thisBtn.setTitle(" ", for: .normal)
                }
            }
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

struct BtnTagged{
    var thisBtn:UIButton
    var prevBtn:UIButton?
}
