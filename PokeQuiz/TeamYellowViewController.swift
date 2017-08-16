//
//  TeamViewController.swift
//  PokeQuiz
//
//  Created by Евгений Бердашкевич on 15.08.17.
//  Copyright © 2017 Alexander Ganzer. All rights reserved.
//

import UIKit

class TeamYellowViewController: UIViewController {
    var teamSave:AppLoader?
    @IBOutlet weak var btnChoseYellow: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        btnChoseYellow.addTarget(self, action: #selector(buttonYellowAction), for: .touchUpInside)
    }
    func buttonYellowAction(sender: UIButton!) {
        teamSave = AppLoader(team:"Instinct")
        teamSave!.saveTeam()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

