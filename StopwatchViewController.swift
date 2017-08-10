//
//  StopwatchViewController.swift
//  SpaceEvader
//
//  Created by Teddy Liang on 8/9/17.
//  Copyright © 2017 iD Student. All rights reserved.
//

import UIKit

class StopwatchViewController: UIViewController {

    
    
    @IBOutlet weak var label: UILabel!
    
    var time = 0
    
    //timer
    var timer = Timer()
    
    
    
    
    
    @IBAction func start(_ sender: UIButton)
    {
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(StopwatchViewController.action), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func pause(_ sender: UIButton)
    {
        
    }
    
    @IBAction func reset(_ sender: UIButton)
    {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

   
}
