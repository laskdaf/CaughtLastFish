//
//  fishcurveViewController.swift
//  CaughtLastFish
//
//  Created by zhenghui xie on 7/12/16.
//  Copyright © 2016 edu. All rights reserved.
//

import UIKit


//implement animation with bezier curve
class noteViewController: UIViewController {

    @IBOutlet weak var colorbar4: UIImageView!
    
    @IBOutlet weak var colorbar1: UIImageView!
        
    @IBOutlet weak var colorbar2: UIImageView!
    @IBOutlet weak var colorbar3: UIImageView!
    
    var bar1Center = CGPoint.init()
    var bar2Center = CGPoint.init()
    var bar3Center = CGPoint.init()
    var bar4Center = CGPoint.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
            }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        bar1Center = colorbar1.center
        bar2Center = colorbar2.center
        bar3Center = colorbar3.center
        
        bar4Center = colorbar4.center
    }
    
    var canPress1 = true
    var canPress2 = true
    var canPress3 = true
    var canPress4 = true
    @IBAction func wholePressed(sender: AnyObject) {
        if (canPress4) {
            canPress4 = false
            UIView.animateWithDuration(0.0, delay: 0.0, options: UIViewAnimationOptions.CurveLinear, animations: {
                self.colorbar4.center = self.bar4Center
                }, completion:{
                    (value:Bool) in
                    UIView.animateWithDuration(3, delay: 0.3,  options: UIViewAnimationOptions.CurveLinear, animations: {
                        var newCenter = self.colorbar4.center
                        newCenter.x += self.colorbar4.frame.size.width
                        self.colorbar4.center = newCenter
                        
                        }, completion:{
                            (value:Bool) in
                            self.canPress4 = true
                    })
            })
            /*UIView.animateWithDuration(3, delay: 0.0,  options: UIViewAnimationOptions.CurveLinear, animations: {
            var newCenter = self.colorbar4.center
            newCenter.x += self.colorbar4.frame.size.width
            self.colorbar4.center = newCenter
            
                }, completion:{
                    (value:Bool) in
                    self.canPress4 = true
            })*/}

    }
    
    @IBAction func dottedPressed(sender: AnyObject) {
        if (canPress3) {
            canPress3 = false
            UIView.animateWithDuration(0.0, delay: 0.0, options: UIViewAnimationOptions.CurveLinear, animations: {
                self.colorbar3.center = self.bar3Center
                }, completion:{
                    (value:Bool) in
                    UIView.animateWithDuration(3, delay: 0.3,  options: UIViewAnimationOptions.CurveLinear, animations: {
                        var newCenter = self.colorbar3.center
                        newCenter.x += self.colorbar3.frame.size.width
                        self.colorbar3.center = newCenter
                        
                        }, completion:{
                            (value:Bool) in
                            self.canPress3 = true
                    })
            })}
    }
    
    
    @IBAction func halfPressed(sender: AnyObject) {
        if (canPress2) {
            canPress2 = false
            UIView.animateWithDuration(0.0, delay: 0.0, options: UIViewAnimationOptions.CurveLinear, animations: {
                self.colorbar2.center = self.bar2Center
                }, completion:{
                    (value:Bool) in
                    UIView.animateWithDuration(3, delay: 0.3,  options: UIViewAnimationOptions.CurveLinear, animations: {
                        var newCenter = self.colorbar2.center
                        newCenter.x += self.colorbar2.frame.size.width
                        self.colorbar2.center = newCenter
                        
                        }, completion:{
                            (value:Bool) in
                            self.canPress2 = true
                    })
            })}
    }
    
    @IBAction func quarterPressed(sender: AnyObject) {
        if (canPress1) {
            canPress1 = false
            UIView.animateWithDuration(0.0, delay: 0.0, options: UIViewAnimationOptions.CurveLinear, animations: {
                self.colorbar1.center = self.bar1Center
                }, completion:{
                    (value:Bool) in
                    UIView.animateWithDuration(3, delay: 0.3,  options: UIViewAnimationOptions.CurveLinear, animations: {
                        var newCenter = self.colorbar1.center
                        newCenter.x += self.colorbar1.frame.size.width
                        self.colorbar1.center = newCenter
                        
                        }, completion:{
                            (value:Bool) in
                            self.canPress1 = true
                    })
            })}
    }
    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
