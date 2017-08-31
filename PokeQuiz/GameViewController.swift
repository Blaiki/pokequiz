//
//  GameViewController.swift
//  PokeQuiz
//
//  Created by Alexander Ganzer on 14.08.17.
//  Copyright © 2017 Alexander Ganzer. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    static var loadedId:Int = -1
    static var bank:Int = 0
    // Outlets
    @IBOutlet weak var bankLabel: UILabel!
    @IBOutlet var baseView: UIView!
    @IBOutlet weak var lbQuestion: UILabel!
    @IBOutlet weak var imgPoke: UIImageView!
    
    @IBOutlet weak var labelStack: UIStackView!
    @IBOutlet weak var firstRowBtnStack: UIStackView!
    @IBOutlet weak var lastRowBtnStack: UIStackView!
    
    var btnArr = [BtnTagged]()
    var quiz:QuizItem? = nil
    var firstOpen = true

    
    override func viewDidLoad() {
        super.viewDidLoad()
            generateLayout()
        }
    
    private func generateLayout(){
        if(firstOpen && GameViewController.loadedId != -1){
            quiz = QuizItem(id:GameViewController.loadedId)
            firstOpen = false
        }else{
            quiz = QuizItem(key: "hello", image: imgPoke.image!)
            GameViewController.loadedId = (quiz!.id)!
            saveData()
        }
        bankLabel.text = String(GameViewController.bank)
        var letterBox:[Character] = quiz!.generateArray()
        letterBox.shuffle()
        imgPoke.image = quiz!.imageShadow()!
        genFirstRow(array: letterBox, color: .red)
        genSecondRow(array: letterBox, color: .red)
        genLabel(length: quiz!.key.characters.count,color: .red)
    }
    
    private func clearLayout(){
        for sub in firstRowBtnStack.arrangedSubviews{
            //firstRowBtnStack.removeArrangedSubview(sub)
            sub.removeFromSuperview()
        }
        for sub in lastRowBtnStack.arrangedSubviews{
            //lastRowBtnStack.removeArrangedSubview(sub)
            sub.removeFromSuperview()
        }
        for sub in labelStack.arrangedSubviews{
            //labelStack.removeArrangedSubview(sub)
            sub.removeFromSuperview()
        }
        btnArr = [BtnTagged]()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    
    @objc private func buttonAction(sender: UIButton!) {
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
                addBank(attempts: quiz!.attempt)
                saveData()
                quiz!.updateCurAsViewed()
                clearLayout()
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0, execute: {
                    self.generateLayout()
                })
            }
        }
        if btn.tag >= 20 {
            if(btn.title(for: .normal) != " "){
                clearLabel(btn: btn)
            }
        }
    }
    private func addBank(attempts:Int){
        switch attempts {
        case 1:
            GameViewController.bank += 100
        case 2:
            GameViewController.bank += 50
        case 3:
            GameViewController.bank += 30
        default:
            GameViewController.bank += 0
        }
        bankLabel.text = String(GameViewController.bank)
    }
    private func checkCorrect()->Bool{
        var tmpStr:String = ""
        quiz!.attempt += 1
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
    
    private func genLabel(length:Int,color: UIColor){
        for value in 0 ... length-1{
            let btn:UIButton = btnGenerator(title:" ", bgColor: color, tag: value+20)
            btnArr.append(BtnTagged(thisBtn: btn,prevBtn:nil))
            labelStack.addArrangedSubview(btn)
        }
    }
    
    private func getCurFreeLabel()->Int{
        for index in 0 ... btnArr.count-1{
            guard let _:UIButton = btnArr[index].prevBtn else {
                return index
            }
        }
        return -1
    }
    
    private func clearLabels(){
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
    
    private func clearLabel(btn:UIButton){
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
    
    private func genFirstRow(array:[Character],color:UIColor){
        for value in 0 ... 6{
            firstRowBtnStack.addArrangedSubview(btnGenerator(title: String(array[value]), bgColor: color, tag: value))
        }
    }
    private func genSecondRow(array:[Character],color:UIColor){
            for value in 7 ... 13{
            lastRowBtnStack.addArrangedSubview(btnGenerator(title: String(array[value]), bgColor: color, tag: value))
            }

    }
    private func btnGenerator(title:String,bgColor:UIColor,tag:Int)->UIButton{
        let button:UIButton = UIButton(frame: CGRect(x: 0, y: 0, width: 100, height: 40))
        button.backgroundColor = bgColor
        button.setTitle(title, for: .normal)
        button.addTarget(self, action: #selector(buttonAction), for: UIControlEvents.touchUpInside)
        button.tag = tag
        return button
    }
    
    private func saveData(){
        let values = AppValues(team: ViewController.teamName, id: GameViewController.loadedId, bank: GameViewController.bank)
        AppLoader.saveTeam(appData: values)
    }
    
}

struct BtnTagged{
    var thisBtn:UIButton
    var prevBtn:UIButton?
}
