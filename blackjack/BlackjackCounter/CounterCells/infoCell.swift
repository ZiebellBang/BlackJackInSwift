//
//  infoCell.swift
//  BlackjackCounter
//
//  Created by React-Native on 06/10/2018.
//  Copyright © 2018 TeamSebAlex. All rights reserved.
//

import UIKit

class infoCell: UITableViewCell {
    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var cardName: UILabel!
    @IBOutlet weak var cardsLeftCounter: UILabel!
    
    func config(type: cardsTypes, count: Int) {
        contentView.backgroundColor = UIColor.clear
        switch type {
        case .King:
            cardName.text = "Kings:"
            cardsLeftCounter.text = String(count)
            cardImage.image = UIImage(named: "cardNRK")
        case .Queen:
            cardName.text = "Queens:"
            cardsLeftCounter.text = String(count)
            cardImage.image = UIImage(named: "cardNRQ")
        case .Knight:
            cardName.text = "Jacks:"
            cardsLeftCounter.text = String(count)
            cardImage.image = UIImage(named: "cardNRJ")
        case .tens:
            cardName.text = "10's:"
            cardsLeftCounter.text = String(count)
            cardImage.image = UIImage(named: "cardNR10")
        case .nines:
            cardName.text = "9's:"
            cardsLeftCounter.text = String(count)
            cardImage.image = UIImage(named: "cardNR9")
        case .eights:
            cardName.text = "8's:"
            cardsLeftCounter.text = String(count)
            cardImage.image = UIImage(named: "cardNR8")
        case .sevens:
            cardName.text = "7's:"
            cardsLeftCounter.text = String(count)
            cardImage.image = UIImage(named: "cardNR7")
        case .sixes:
            cardName.text = "6's:"
            cardsLeftCounter.text = String(count)
            cardImage.image = UIImage(named: "cardNR6")
        case .fives:
            cardName.text = "5's:"
            cardsLeftCounter.text = String(count)
            cardImage.image = UIImage(named: "cardNR5")
        case .fours:
            cardName.text = "4's:"
            cardsLeftCounter.text = String(count)
            cardImage.image = UIImage(named: "cardNR4")
        case .threes:
            cardName.text = "3's:"
            cardsLeftCounter.text = String(count)
            cardImage.image = UIImage(named: "cardNR3")
        case .twos:
            cardName.text = "2's:"
            cardsLeftCounter.text = String(count)
            cardImage.image = UIImage(named: "cardNR2")
        case .aces:
            cardName.text = "Aces:"
            cardsLeftCounter.text = String(count)
            cardImage.image = UIImage(named: "cardNRA")
        }
    }
    
}
