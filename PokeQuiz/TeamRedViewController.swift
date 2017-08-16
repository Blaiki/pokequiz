//
//  TeamViewController.swift
//  PokeQuiz
//
//  Created by Евгений Бердашкевич on 15.08.17.
//  Copyright © 2017 Alexander Ganzer. All rights reserved.
//

import UIKit

class TeamRedViewController: UIViewController {
    var teamSave:AppLoader?
    @IBOutlet weak var btnChoseRed: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        btnChoseRed.addTarget(self,action: #selector(buttonRedAction), for: .touchUpInside)
    }
    func buttonRedAction(sender: UIButton!) {
        teamSave = AppLoader(team:"Valor")
        teamSave!.saveTeam()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


