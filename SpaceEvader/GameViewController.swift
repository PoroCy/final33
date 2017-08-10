//
//  GameViewController.swift
//  SpaceEvader
//
//  Created by Teddy Liang on 8/3/17.
//  Copyright © 2017 Teddy Liang. All rights reserved.
//

import UIKit
import SpriteKit

    class GameViewController: UIViewController {


    @IBAction func imdonebutton(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    
        if let view = self.view as! SKView? {
            
            let scene = GameScene (size: view.bounds.size)
            
            view.presentScene(scene)
            scene.scaleMode = .aspectFill
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
        
                // Set the scale mode to scale to fit the window
        
                // Present the scene
                
            
        
    }
    

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
