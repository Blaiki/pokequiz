//
//  ChooseViewController.swift
//  PokeQuiz
//
//  Created by Alexander Ganzer on 14.08.17.
//  Copyright © 2017 Alexander Ganzer. All rights reserved.
//

import UIKit

class ChooseViewController: UIPageViewController {

    weak var defaultDelegate: DefaultPageViewControllerDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        
        delegate = self as! UIPageViewControllerDelegate

        
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        
        defaultDelegate?.defaultPageViewController(defaultPageViewController: self, didUpdatePageCount: orderedViewControllers.count)
        
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

    
    
    
    
    private(set) lazy var orderedViewControllers: [UIViewController] = {
        return [self.teamViewController(team: "Mystic"),
                self.teamViewController(team: "Instinct"),
                self.teamViewController(team: "Valor")]
    }()
    
    private func teamViewController(team: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil) .
            instantiateViewController(withIdentifier: "ViewController\(team)")
    }

}

extension ChooseViewController: UIPageViewControllerDelegate {
    
    func pageViewController(pageViewController: UIPageViewController,
                            didFinishAnimating finished: Bool,
                            previousViewControllers: [UIViewController],
                            transitionCompleted completed: Bool) {
        if let firstViewController = viewControllers?.first,
            let index = orderedViewControllers.index(of: firstViewController) {
            defaultDelegate?.defaultPageViewController(defaultPageViewController: self, didUpdatePageIndex: index)
        }
    }
    
}

protocol DefaultPageViewControllerDelegate: class {
    
    func defaultPageViewController(defaultPageViewController: ChooseViewController,
                                    didUpdatePageCount count: Int)
    
    func defaultPageViewController(defaultPageViewController: ChooseViewController,
                                    didUpdatePageIndex index: Int)
    
}

extension ChooseViewController: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        
        guard previousIndex >= 0 else {
            return nil
        }
        
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        
        return orderedViewControllers[previousIndex]
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let viewControllerIndex = orderedViewControllers.index(of: viewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        let orderedViewControllersCount = orderedViewControllers.count
        
        guard orderedViewControllersCount != nextIndex else {
            return nil
        }
        
        guard orderedViewControllersCount > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    func viewControllerAtIndex(index: Int) -> UIViewController? {
        // TODO: implement
        return nil
    }

}
