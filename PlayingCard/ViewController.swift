//
//  ViewController.swift
//  PlayingCard
//
//  Created by Yusheng Xu on 5/14/18.
//  Copyright © 2018 Yusheng Xu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var deck = PlayingCardDeck()
    override func viewDidLoad() {
        super.viewDidLoad()
        for _ in 1...10 {
            if let card = deck.draw() {
               print("\(card)")
            }
        }
        
    }
    

}

