//
//  DefaultViewController.swift
//  PokeQuiz
//
//  Created by Alexander Ganzer on 14.08.17.
//  Copyright © 2017 Alexander Ganzer. All rights reserved.
//

import UIKit

class DefaultViewController: UIViewController {
    @IBOutlet weak var pageContoll: UIPageControl!
    @IBOutlet weak var containerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DefaultViewController: DefaultPageViewControllerDelegate {
    
    func defaultPageViewController(defaultPageViewController: ChooseViewController,
                                    didUpdatePageCount count: Int) {
        pageContoll.numberOfPages = count
    }
    
    func defaultPageViewController(defaultPageViewController: ChooseViewController,
                                    didUpdatePageIndex index: Int) {
        pageContoll.currentPage = index
    }
    
}

