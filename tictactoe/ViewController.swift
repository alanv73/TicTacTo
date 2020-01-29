//
//  ViewController.swift
//  tictactoe
//
//  Created by Alan Van Art on 1/27/20.
//  Copyright © 2020 Alan Van Art. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var player = 1 // cross
    var board = [0,0,0,0,0,0,0,0,0]
    let winners = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var playing = true

    @IBOutlet weak var btnPlayAgain: UIButton!
    @IBOutlet weak var lblGameResult: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func boardClicked(_ sender: AnyObject) {
        if (board[sender.tag - 1] == 0 && playing) {
            board[sender.tag - 1] = player
            if (player == 1) {
                sender.setImage(UIImage(named: "cross.png"), for: UIControl.State())
                player = 2
            } else {
                sender.setImage(UIImage(named: "circle.png"), for: UIControl.State())
                player = 1
            }
        }
        
        for win in winners {
            if board[win[0]] != 0 &&
                board[win[0]] == board[win[1]] &&
                board[win[1]] == board[win[2]]{
                    playing = false
                if board[win[0]] == 1 {
                    //cross wins
                    lblGameResult.text = "Player X wins!"
                } else {
                    //circle wins
                    lblGameResult.text = "Player O wins!"
                }
                gameEnd()
            }
        }
        
        playing = false
        
        for i in board {
            if i == 0 {
                playing = true
                break
            }
        }
        
        if playing == false {
            lblGameResult.text = "Draw Game!"
            gameEnd()
        }
    }
    
    @IBAction func playAgainClicked(_ sender: Any) {
        board = [0,0,0,0,0,0,0,0,0]
        playing = true
        player = 1
        
        btnPlayAgain.isHidden = true
        lblGameResult.isHidden = true
        for i in 1...9 {
            let button = view.viewWithTag(i) as! UIButton
            button.setImage(nil, for: UIControl.State())
        }
    }
    
    func gameEnd() {
        lblGameResult.center.x = self.view.center.x - 500
        lblGameResult.center.y = self.view.center.y - (self.lblGameResult.frame.height / 2)
        lblGameResult.isHidden = false
        
        btnPlayAgain.center.x = self.view.center.x - 500
        btnPlayAgain.center.y = self.view.center.y + (self.btnPlayAgain.frame.height / 2)
        btnPlayAgain.isHidden = false

        UIView.animate(
                withDuration: 1.5,
                delay: 0.3,
                usingSpringWithDamping: 0.5,
                initialSpringVelocity: 0.2,
                options: UIView.AnimationOptions.curveEaseInOut,
                    animations: (
                        {
                            self.lblGameResult.center = CGPoint(
                                x: self.view.center.x,
                                y: self.view.center.y - (self.lblGameResult.frame.height / 2)
                            )
                        }
                    )
            )
        
        UIView.animate(
            withDuration: 1.5,
            delay: 0.3,
            usingSpringWithDamping: 0.5,
            initialSpringVelocity: 0.2,
            options: UIView.AnimationOptions.curveEaseInOut,
                animations: (
                    {
                        self.btnPlayAgain.center = CGPoint(
                            x: self.view.center.x,
                            y: self.view.center.y + (self.btnPlayAgain.frame.height / 2)
                        )
                    }
                )
        )
        
        
    }
    

}

