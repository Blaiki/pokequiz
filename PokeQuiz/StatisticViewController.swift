//
//  StatisticViewController.swift
//  PokeQuiz
//
//  Created by Alexander Ganzer on 01.09.17.
//  Copyright © 2017 Alexander Ganzer. All rights reserved.
//

import UIKit

class StatisticViewController: UIViewController {

    @IBOutlet weak var lblBank: UILabel!
    @IBOutlet weak var lblCorrect: UILabel!
    @IBOutlet weak var lblWrong: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupData()
        // Do any additional setup after loading the view.
    }
    
    private func setupData(){
        lblBank.text=String(GameViewController.bank)
        let stat:statData = Stat.getStatistic(gen: 1)
        if(stat.gen != 0){
            lblCorrect.text = "Correct answers: \(stat.right)"
            lblWrong.text = "Wrong answers: \(stat.wrong)"
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
