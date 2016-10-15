//
//  ViewController.swift
//  Animations
//
//  Created by Terry Donaghe on 10/14/16.
//  Copyright © 2016 Donaghe. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var imgAnimate: UIImageView!
  var imageCounter = 0
  var timer = Timer()
  var isRunning = false
  
  @IBAction func btnSlideIn(_ sender: AnyObject) {
    imgAnimate.center = CGPoint(x: imgAnimate.center.x - 500, y: imgAnimate.center.y)
    UIView.animate(withDuration: 2, animations: {
      self.imgAnimate.center = CGPoint(x: self.imgAnimate.center.x + 500, y: self.imgAnimate.center.y)
    })
  }
  
  @IBAction func btnGrow(_ sender: AnyObject) {
    imgAnimate.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
    
    UIView.animate(withDuration: 1, animations: {
      self.imgAnimate.frame = CGRect(x: 0, y: 0, width: 200, height: 200)
    })
  }
  
  @IBAction func fadeIn(_ sender: AnyObject) {
    imgAnimate.alpha = 0
    UIView.animate(withDuration: 1, animations: {
      self.imgAnimate.alpha = 1
    })
  }
  
  @IBAction func btnNext(_ sender: AnyObject) {
    if !isRunning {
      isRunning = true
      timer = Timer.scheduledTimer(timeInterval: 0.05, target: self, selector: #selector(ViewController.processTimer), userInfo: nil, repeats: true)
    } else {
      isRunning = false
      timer.invalidate()
    }
  }
  
  internal func processTimer() {
    if imageCounter <= 39 {
      imageCounter += 1
    } else {
      imageCounter = 0
    }
    imgAnimate.image = UIImage(named: "frame_\(imageCounter)_delay-0.1s.gif")
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


}

