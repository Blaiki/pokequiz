//
//  ViewController.swift
//  PokeQuiz
//
//  Created by Alexander Ganzer on 14.08.17.
//  Copyright © 2017 Alexander Ganzer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    static var teamName:String = "team"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let bgView:UIImageView = self.view.subviews.filter{$0 is UIImageView}.first as! UIImageView
        bgView.image = teamSwitcher(title: ViewController.teamName)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func teamSwitcher(title:String)->UIImage{
        var backImg: UIImage
        switch title{
        case "Mystic":
            backImg = #imageLiteral(resourceName: "mystic")
        case "Valor":
            backImg = #imageLiteral(resourceName: "valor")
        case "Instinct":
            backImg = #imageLiteral(resourceName: "instinct")
        default:
            backImg = #imageLiteral(resourceName: "menu")
        }
        return backImg
    }

}
