//
//  ViewController.swift
//  PlayingCard
//
//  Created by Yusheng Xu on 5/14/18.
//  Copyright © 2018 Yusheng Xu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func flipCard(_ sender: UITapGestureRecognizer) {
        switch sender.state {
        case .ended:
            PlayingCardView.isFaceUp = !PlayingCardView.isFaceUp
        default: break
        }
    }
    @IBOutlet weak var PlayingCardView: PlayingCardView! {
        didSet {
            let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextCard))
            swipe.direction = [.left,.right]
            PlayingCardView.addGestureRecognizer(swipe)
            let pinch = UIPinchGestureRecognizer(target: PlayingCardView, action: #selector(PlayingCardView.adjustFaceCardScale(byHandlingGestureRecognizedBy:)))
            PlayingCardView.addGestureRecognizer(pinch)
        }
    }
    
    @objc func nextCard() {
        if let card = deck.draw() {
            PlayingCardView.rank = card.rank.order
            PlayingCardView.suit = card.suit.rawValue
        }
    }
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

