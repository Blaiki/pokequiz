//
//  TeamViewController.swift
//  PokeQuiz
//
//  Created by Евгений Бердашкевич on 15.08.17.
//  Copyright © 2017 Alexander Ganzer. All rights reserved.
//

import UIKit

class TeamViewController: UIViewController {
    @IBOutlet weak var btnChoseBlue: UIButton!
    @IBOutlet weak var btnChoseRed: UIButton!
    @IBOutlet weak var btnChoseYellow: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        btnChoseBlue.addTarget(self, action: #selector(buttonBlueAction), for: .touchUpInside)
    }
    func buttonBlueAction(sender: UIButton!) {
        let appData = AppValues(team:"Mystic",id:-1,bank:0)
        let teamSave:AppLoader = AppLoader()
        teamSave.saveTeam(appData: appData)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


