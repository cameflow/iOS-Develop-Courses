//
//  ViewController.swift
//  Tic Tac Toe
//
//  Created by Alejandro Terrazas on 18/12/15.
//  Copyright (c) 2015 Alejandro Terrazas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  // 1 = circulo, 2 = cruz
  var activePlayer = 1
  
  var gameActive = true
  
  var gameState = [0,0,0,0,0,0,0,0,0]
  
  var winningCombinations = [[0,1,2],[3,4,5],[6,7,8],[1,4,7],[0,3,6],[2,5,8],[0,4,8],[2,4,6]]
  
  @IBOutlet weak var button: UIButton!
  
  @IBOutlet weak var gameOverLabel: UILabel!
  
  @IBOutlet weak var playAgainButton: UIButton!
  
 
  @IBAction func playAgainButtonPressed(sender: AnyObject) {
    activePlayer = 1
    gameActive = true
    gameState = [0,0,0,0,0,0,0,0,0]
    var button : UIButton
    
    for (var i = 0; i < 9; i++)
    {
      button = view.viewWithTag(i) as! UIButton
      button.setImage(nil, forState: .Normal)
    }
    
    gameOverLabel.hidden = true
    playAgainButton.hidden = true
    
    gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400, gameOverLabel.center.y)
    playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y)
  }
  
  @IBAction func buttonPressed(sender: AnyObject) {
    var image = UIImage()
    
    if (gameState[sender.tag] == 0 && gameActive == true)
    {
      gameState[sender.tag] = activePlayer
    
      if (activePlayer == 1)
      {
        image = UIImage(named: "nought.png")!
        activePlayer = 2;
      }
      else
      {
        image = UIImage(named: "cross.png")!
        activePlayer = 1;
      }
      sender.setImage(image, forState: .Normal)
      
      for combinations in winningCombinations
      {
        var text = ""
        if (gameState[combinations[0]] != 0 && gameState[combinations[0]] == gameState[combinations[1]] && gameState[combinations[1]] == gameState[combinations[2]])
        {
          if (gameState[combinations[0]] == 1)
          {
            gameOverLabel.text = "Ganó Circulos"
          }
          else
          {
            gameOverLabel.text = "Gano Cruz"
          }
          gameOverLabel.hidden = false
          playAgainButton.hidden = false
          
          UIView.animateWithDuration(0.5, animations: { () -> Void in
            
            self.gameOverLabel.center = CGPointMake(self.gameOverLabel.center.x + 400, self.gameOverLabel.center.y)
            self.playAgainButton.center = CGPointMake(self.playAgainButton.center.x + 400, self.playAgainButton.center.y)
          })
          gameActive = false
        }
      }
      
    }
  }
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib
    
    gameOverLabel.hidden = true
    playAgainButton.hidden = true
    
    gameOverLabel.center = CGPointMake(gameOverLabel.center.x - 400, gameOverLabel.center.y)
    playAgainButton.center = CGPointMake(playAgainButton.center.x - 400, playAgainButton.center.y)
    
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  override func viewDidLayoutSubviews() {
   
  }

}

