//
//  TeamViewController.swift
//  PokeQuiz
//
//  Created by Евгений Бердашкевич on 15.08.17.
//  Copyright © 2017 Alexander Ganzer. All rights reserved.
//

import UIKit

class TeamRedViewController: UIViewController {
    @IBOutlet weak var btnChoseRed: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        btnChoseRed.addTarget(self,action: #selector(buttonRedAction), for: .touchUpInside)
    }
    func buttonRedAction(sender: UIButton!) {
        let appData = AppValues(team:"Valor",id:-1,bank:0)
        AppLoader.saveTeam(appData: appData)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}


