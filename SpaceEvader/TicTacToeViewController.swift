//
//  TicTacToeViewController.swift
//  SpaceEvader
//
//  Created by Teddy Liang on 8/8/17.
//  Copyright © 2017 Teddy Liang. All rights reserved.
//

import UIKit

class TicTacToeViewController: UIViewController {
    
    
    var activePlayer = 1 // Cross
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    
    let winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8,], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var gameIsActive = true
    
    @IBOutlet weak var label: UILabel!
    
    @IBAction func action(_ sender: AnyObject)
    {
        if (gameState[sender.tag-1] == 0 && gameIsActive == true)
        {
            gameState[sender.tag-1] = activePlayer
            
            if (activePlayer == 1)
            {
                sender.setImage(UIImage(named: "hilary.jpg"), for : UIControlState())
                activePlayer = 2
            }
            else
            {
                sender.setImage(UIImage(named: "donald trump.jpg"), for : UIControlState())
                activePlayer = 1
            }
        }
        
        for combination in winningCombinations
        {
            if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
            {
                gameIsActive = false
                
                if gameState[combination[0]] == 1
                {
                    //cross has won
                    print ("CROSS")
                    label.text = "Hilary has won"
                }
                else
                {
                    //Nought has won
                    print("NOUGHT")
                    label.text = "Trump has won"
                }
                
                playagainbutton.isHidden = false
                label.isHidden = false
            }
        }
        
        gameIsActive = false
        
        for i in gameState
        {
            if i == 0
            {
                gameIsActive = true
                break
            }
        }
        
        if gameIsActive == false
        {
            label.text = "IT WAS A DRAW"
            label.isHidden = false
            playagainbutton.isHidden = false
        }
        
    }
    
    
    @IBOutlet weak var playagainbutton: UIButton!
    
    @IBAction func playagainbutton(_ sender: Any)
    {
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        gameIsActive = true
        activePlayer = 1
        
        playagainbutton.isHidden = true
        label.isHidden = true
        
        for i in 1...9
        {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControlState())
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

}
