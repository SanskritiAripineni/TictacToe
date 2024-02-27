//
//  ViewController.swift
//  TicTacToe
//
//  Created by Sanskriti on 10/17/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet var buttons: [UIButton]!
    
    
    @IBOutlet weak var label: UILabel!
    
    //put a backgorund color to this for playagain
    @IBOutlet weak var PlayAgainButtoni: UIButton!
    
    
    var Player = 1 //cross
    var Gamer = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    let winCombo = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7],[2,5,8],[0,4,8],[2,4,6]]
    var activeGamer = true
    @IBAction func Buttonss(_ sender: UIButton)
    {
        
        
        //drag all the button to here
        // if it not equal to zero then the tag has a valve and wheather the Gamer is active
        print(sender.tag)
        
        if(Gamer[sender.tag] == 0 && activeGamer == true)
            
        {
        
            Gamer[sender.tag] = Player
            if(Player == 1)
            {
                //send the x image
              //  sender.setImage(UIImage(named: "x.png"), for: .normal)
                sender.setTitle("X", for: .normal)
                Player = 2
            }
                else
                {
           //         sender.setImage(UIImage(named: "o.png"), for: .normal)
                    sender.setTitle("O", for: .normal)
                    Player = 1
                
                 }
        }
        for combination in winCombo
        {
            if Gamer[combination[0]] != 0 && Gamer[combination[0]] == Gamer[combination[1]] && Gamer[combination[1]] == Gamer[combination[2]]
            {
                activeGamer = false
                
                if Gamer[combination[0]] == 1
                {
                    label.text = "Cross has won!!"
                }
                else{
                    label.text = " Nought has won!!"
                }
                PlayAgainButtoni.isHidden = false
                label.isHidden = false
            }
        }
        
        activeGamer = false
        for i in Gamer
        {
            if i == 0
            {
                activeGamer = true
                break
            }
        }
        if activeGamer == false{
            label.text = "it was a draw!!"
            label.isHidden = false
            PlayAgainButtoni.isHidden = false
        }
    }
    
    @IBAction func PlayAgain(_ sender: UIButton){
        label.text = "TicTacToe"
        PlayAgainButtoni.setTitle("Play Again", for: .normal)

        Gamer = [0,0,0,0,0,0,0,0,0]
        activeGamer = true
        Player = 1
        
        PlayAgainButtoni.isHidden = true
        label.isHidden = true
        for button in buttons
        {
            button.setTitle("", for: .normal)
        }
    }
   

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label.text = "TicTacToe"
        PlayAgainButtoni.setTitle("Play Again", for: .normal)
       // buttons[0].setImage(UIImage(named: "x.png"), for: UIControl.State.normal)
        for  button in buttons {
            button.setTitle("", for: .normal)
        }

}

}
