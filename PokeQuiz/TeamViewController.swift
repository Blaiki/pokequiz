//
//  TeamViewController.swift
//  PokeQuiz
//
//  Created by Евгений Бердашкевич on 15.08.17.
//  Copyright © 2017 Alexander Ganzer. All rights reserved.
//

import UIKit

class TeamViewController: UIViewController {
    var appData:AppValues = AppValues(team:"teamPlasma")
    
    @IBOutlet weak var btnChose: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        btnChose.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    }
    func buttonAction(sender: UIButton!) {
        saveTeam()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func saveTeam() {
        _ = NSKeyedArchiver.archiveRootObject(appData, toFile: AppValues.ArchiveURL.path)
    }
}
