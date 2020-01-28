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
        for game in winners {
            if board[game[0]] != 0 &&
                board[game[0]] == board[game[1]] &&
                board[game[1]] == board[game[2]]{
                    playing = false
                if board[game[0]] == 1 {
                    //cross wins
                } else {
                    //circle wins
                }
            }
        }
    }
    


}

