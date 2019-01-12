//
//  ViewController.swift
//  EBook
//
//  Created by REO HARADA on 2019/01/12.
//  Copyright © 2019年 reo harada. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIPageViewControllerDelegate,UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        print(#function)
        let index = pageVCs.firstIndex(of: viewController)
        if index == 0 {
            return nil
        }
        return pageVCs[index!-1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        print(#function)
        let index = pageVCs.firstIndex(of: viewController)
        if index! >= pageVCs.count - 1 {
            return nil
        }
        return pageVCs[index!+1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        print(#function)
        print(pageVCs)
        print(pendingViewControllers)
        pageNumber = pageVCs.firstIndex(of: pendingViewControllers[0])!
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        print(#function)
        print(pageVCs)
        print(previousViewControllers)
        if completed == true {
            pageLabel.text = "\(pageNumber)"
        }
        print(completed)
    }
    

    @IBOutlet weak var pageView: UIView!
    @IBOutlet weak var pageLabel: UILabel!
    var pageVCs: [UIViewController] = []
    var pageNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let pageVC = storyboard?.instantiateViewController(withIdentifier: "pageVC") as! UIPageViewController
        let firstVC = storyboard?.instantiateViewController(withIdentifier: "RedVC") as! UIViewController
        let secondVC = storyboard?.instantiateViewController(withIdentifier: "BlueVC") as! UIViewController
        let thirdVC = storyboard?.instantiateViewController(withIdentifier: "GreenVC") as! UIViewController
        pageVCs.append(firstVC)
        pageVCs.append(secondVC)
        pageVCs.append(thirdVC)
        self.addChild(pageVC)
        pageVC.setViewControllers([firstVC], direction: .forward, animated: false, completion: nil)
        pageVC.delegate = self
        pageVC.dataSource = self
        pageVC.view.frame.size = pageView.frame.size
        pageView.addSubview(pageVC.view)
        pageLabel.text = "\(pageNumber)"
    }
    
    


}

