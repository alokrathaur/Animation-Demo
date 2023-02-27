//
//  ViewController.swift
//  testAnim1
//
//  Created by Alok Rathaur on 24/02/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewBG: UIView!
    
    @IBOutlet weak var heightConstant: NSLayoutConstraint!
    let laserImageView = UIImageView(frame: CGRect(x: 0, y: 0.0, width: 300.0, height: 300.0))

    override func viewDidLoad() {
    super.viewDidLoad()

    laserImageView.backgroundColor = UIColor.blue
    self.view.addSubview(laserImageView)
    }


    override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)

    //bottom()
        //laserImageView.animShow()
//        self.heightConstant.constant = 0
//        self.viewBG.setHeight(41);
//        self.viewBG.setHeight(0, animateTime: 0.0);
       
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
//        self.viewBG.frame.size.height = 0
//        ani2()
        
        // increase height and decrease height of UIVIEW
        
//        self.viewBG.setHeight(41, animateTime: 3.0);
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
////            self.viewBG.setHeight(0);
//            self.viewBG.setHeight(0, animateTime: 3.0);
//        }
        
        // move from up and down
//        self.viewBG.animShow();
//        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
//            self.viewBG.animHide();
//        }
        
//        UIView.animate(withDuration: 3.0, delay: 1.0, options: .curveLinear, animations: {
//               let height:CGFloat = 41;
//            self.viewBG.frame = CGRect(x: 0, y: self.viewBG.frame.minY, width: self.viewBG.frame.width, height: self.viewBG.frame.height)
//           }) { finished in
//               // animation done
//               UIView.animate(withDuration: 3.0, delay: 0.0, options: .curveLinear, animations: {
//                   self.viewBG.frame = CGRect(x: 0, y: self.viewBG.frame.minY, width: self.viewBG.frame.width, height: self.viewBG.frame.height + 41)
//               })
//           }
//        self.animateViewHeight(isIncreasing: true);
        animateIncreaseHeight() // Perfect working
//
    }
    
    func animateIncreaseHeight() {
        let decreasedHeight: CGFloat = 41
        
        UIView.animate(withDuration: 1.5, animations: {
            self.heightConstant.constant = decreasedHeight
            self.view.layoutIfNeeded()
        },completion: {_ in
            self.animateDecreaseHeight()
        })
    }
    
    func animateDecreaseHeight() {
        let decreasedHeight: CGFloat = 0
        
        UIView.animate(withDuration: 1.5, animations: {
            self.heightConstant.constant = decreasedHeight
            self.view.layoutIfNeeded()
        })
    }
    
   
    func animateViewHeight() {
        // Define the new height for the view after increasing it
        let increasedHeight: CGFloat = 41
        
        UIView.animate(withDuration: 1.5, animations: {
            // Increase the view's height
            self.viewBG.frame.size.height = increasedHeight
            self.viewBG.layoutIfNeeded()
        }, completion: { finished in
            // After the increase animation is complete, start the decrease animation
            self.decreaseViewHeight()
        })
    }

    func decreaseViewHeight() {
        // Define the final height for the view after decreasing it
        let decreasedHeight: CGFloat = 0
        
        UIView.animate(withDuration: 1.5, animations: {
            // Decrease the view's height
            self.viewBG.frame.size.height = decreasedHeight
            self.viewBG.layoutIfNeeded()
        })
    }
    
    func ani2(){
        // Get the current frame of the view
//        self.heightConstant.constant = 0
        var frame = self.viewBG.frame

        // Decrease the height of the view by 50 points
        frame.size.height += 50

        // Animate the view to the new height
        UIView.animate(withDuration: 3.0) {
            self.viewBG.frame = frame
        }

        // Increase the height of the view by 50 points (after a delay of 1 second)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            // Get the current frame of the view
            self.heightConstant.constant = 0
            var frame = self.viewBG.frame
            
            // Increase the height of the view by 50 points
            frame.size.height -= 50
            
            // Animate the view to the new height
            UIView.animate(withDuration: 3.0) {
                self.viewBG.frame = frame
            }
        }
    }
    
    
    
    func ani(){
        UIView.animate(withDuration: 3.0, delay: 2.0, options: .curveEaseInOut, animations: {
            // Increase the height of the view by 50 points
            
            self.viewBG.frame.size.height -= 41
            //self.heightConstant.constant += 41
        }) { (finished) in
            // Completion handler, executed after the animation is finished
            UIView.animate(withDuration: 3.0, delay: 1.0, options: .curveEaseInOut, animations: {
                // Decrease the height of the view by 50 points (back to original height)
//                self.heightConstant.constant -= 41
                self.viewBG.frame.size.height += 41
            })
        }
    }

    func bottom()  {

    UIView.animate(withDuration: 3.0, delay: 0.2, options: [.curveEaseInOut], animations: {
        self.laserImageView.frame = CGRect(x: 0, y: 500.0, width: 300.0, height: 300.0)
    }) { (finished) in
        if finished {
            // Repeat animation from bottom to top
            self.Up()
        }
    }
    }

    func Up()  {

    UIView.animate(withDuration: 3.0, delay: 0.2, options: [.curveEaseInOut], animations: {
        self.laserImageView.frame = CGRect(x: 0, y: self.laserImageView.bounds.origin.y, width: 300.0, height: 300.0)
    }) { (finished) in
        if finished {
            // Repeat animation to bottom to top
            self.bottom()
        }
    }

    }

}



extension UIView {
    func setHeight(_ h:CGFloat, animateTime:TimeInterval?=nil) {

        if let c = self.constraints.first(where: { $0.firstAttribute == .height && $0.relation == .equal }) {
            c.constant = CGFloat(h)

            if let animateTime = animateTime {
                UIView.animate(withDuration: animateTime, animations:{
                    self.superview?.layoutIfNeeded()
                })
            }
            else {
                self.superview?.layoutIfNeeded()
            }
        }
    }
}

extension UIView{
    func animShow(){
        UIView.animate(withDuration: 2, delay: 0, options: [.curveEaseIn],
                       animations: {
                        self.center.y -= self.bounds.height
                        self.layoutIfNeeded()
        }, completion: nil)
        self.isHidden = false
    }
    func animHide(){
        UIView.animate(withDuration: 2, delay: 0, options: [.curveLinear],
                       animations: {
                        self.center.y += self.bounds.height
                        self.layoutIfNeeded()

        },  completion: {(_ completed: Bool) -> Void in
        self.isHidden = true
            })
    }
}
