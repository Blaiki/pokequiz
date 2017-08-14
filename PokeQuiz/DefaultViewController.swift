//
//  DefaultViewController.swift
//  PokeQuiz
//
//  Created by Alexander Ganzer on 14.08.17.
//  Copyright © 2017 Alexander Ganzer. All rights reserved.
//

import UIKit

class DefaultViewController: UIViewController {
    //@IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var containerView: UIView!
    
    var chooseViewController: ChooseViewController? {
        didSet {
            chooseViewController?.defaultDelegate = self
        }
    }

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
    @IBAction func pageControl(_ sender: Any) {
        chooseViewController?.scrollToViewController(index: pageControl.currentPage)
    }

}

extension DefaultViewController: ChooseViewControllerDelegate {
    
    func chooseViewController(chooseViewController: ChooseViewController,
                                    didUpdatePageCount count: Int) {
        self.chooseViewController = chooseViewController
        pageControl.numberOfPages = count
    }
    
    func chooseViewController(chooseViewController: ChooseViewController,
                                    didUpdatePageIndex index: Int) {
        pageControl.currentPage = index
    }
    
}

