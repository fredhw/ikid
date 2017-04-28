//
//  PunViewController.swift
//  iKid
//
//  Created by iGuest on 4/26/17.
//  Copyright © 2017 fredhw. All rights reserved.
//

import UIKit

class PunViewController: UIViewController {
    private var first: PunFirstViewController!
    private var second: PunSecondViewController!
    
    private func firstBuilder() {
        if first == nil {
            first = storyboard?.instantiateViewController(withIdentifier: "PunFirst")as! PunFirstViewController
        }
    }
    private func secondBuilder() {
        if second == nil {
            second = storyboard?.instantiateViewController(withIdentifier: "PunSecond") as! PunSecondViewController
        }
    }
    
    
    @IBAction func continueButton(_ sender: UIButton) {
        firstBuilder(); secondBuilder();
        
        UIView.beginAnimations("View Flip", context: nil)
        UIView.setAnimationDuration(1.0)
        UIView.setAnimationCurve(.easeInOut)
        
        if first != nil && first.view.superview != nil {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            second.view.frame = view.frame
            switchViewController(from: first, to: second)
        } else {
            UIView.setAnimationTransition(.flipFromRight, for: view, cache: true)
            second.view.frame = view.frame
            switchViewController(from: second, to: first)
        }
        UIView.commitAnimations()
    }
    
    private func switchViewController(from: UIViewController?, to: UIViewController?) {
        if from != nil {
            from!.willMove(toParentViewController: nil)
            from!.view.removeFromSuperview()
            from!.removeFromParentViewController()
        }
        
        if to != nil {
            self.addChildViewController(to!)
            self.view.insertSubview(to!.view, at: 0)
            to!.didMove(toParentViewController: self)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstBuilder()
        switchViewController(from: nil, to: first)
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
