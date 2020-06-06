//
//  ViewController.swift
//  BlackjackCounter
//
//  Created by React-Native on 06/10/2018.
//  Copyright © 2018 TeamSebAlex. All rights reserved.
//

import UIKit
public enum cardsTypes {
    case King
    case Queen
    case Knight
    case tens
    case nines
    case eights
    case sevens
    case sixes
    case fives
    case fours
    case threes
    case twos
    case aces
    
    func identifier() -> String {
        switch self {
        case .King, .Queen, .Knight, .tens, .nines, .eights, .sevens, .sixes, .fives, .fours, .threes, .twos, .aces:
            return "Cards"
        }
    }
    func estimatedHeight() -> CGFloat {
        switch self {
        case .King, .Queen, .Knight, .tens, .nines, .eights,.sevens, .sixes, .fives, .fours, .threes, .twos, .aces:
            return 60
        }
    }
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var countTitle: UILabel!
    @IBOutlet private weak var countNumber: UILabel!
    @IBOutlet private weak var deckCount: UILabel!
    @IBOutlet private weak var lowChance: UILabel!
    @IBOutlet private weak var neutralChance: UILabel!
    @IBOutlet private weak var highChance: UILabel!

    
    fileprivate var cells = [cardsTypes]()
    var TotalCountNumber: Int = 0
    var text: String = ""
    
    var kingCount: Int = 0
    var queenCount: Int = 0
    var knightCount: Int = 0
    var tenCount: Int = 0
    var nineCount: Int = 0
    var eightCount: Int = 0
    var sevenCount: Int = 0
    var sixCount: Int = 0
    var fiveCount: Int = 0
    var fourCount: Int = 0
    var threeCount: Int = 0
    var twoCount: Int = 0
    var aceCount: Int = 0
    
    var totalCards: Int = 0
    var highCardChance: Int = 0
    var neutralCardChance: Int = 0
    var lowCardChance: Int = 0
    var decksLeft: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = UIColor.clear
        
        kingCount = 4 * Int(text)!
        queenCount = 4 * Int(text)!
        knightCount = 4 * Int(text)!
        tenCount = 4 * Int(text)!
        nineCount = 4 * Int(text)!
        eightCount = 4 * Int(text)!
        sevenCount = 4 * Int(text)!
        sixCount = 4 * Int(text)!
        fiveCount = 4 * Int(text)!
        fourCount = 4 * Int(text)!
        threeCount = 4 * Int(text)!
        twoCount = 4 * Int(text)!
        aceCount = 4 * Int(text)!
        chanceCalculations()
        
        countNumber.text = String(TotalCountNumber)
        
        decksLeft = Int(text)!
        deckCount.text = String(decksLeft)
        
        
        tableView.tableFooterView = UIView()
        updateCells()
    }
    
    func totalcardsFunc() {
        totalCards = kingCount + queenCount + knightCount + tenCount + nineCount + eightCount + sevenCount + sixCount + fiveCount + fourCount + threeCount + twoCount + aceCount
    }
    func chanceCalculations() {
        totalcardsFunc()
        if totalCards > 0 {
        highCardChance = Int((Float(aceCount + kingCount + queenCount + knightCount + tenCount) / Float(totalCards)) * 100)
        highChance.text = String(highCardChance) + "%"
        
        neutralCardChance = Int((Float(nineCount + eightCount + sevenCount) / Float(totalCards)) * 100)
        neutralChance.text = String(neutralCardChance) + "%"
        
        lowCardChance = Int((Float(sixCount + fiveCount + fourCount + threeCount + twoCount) / Float(totalCards)) * 100)
        lowChance.text = String(lowCardChance) + "%"
        } else {
            highChance.text = String(0) + "%"
            neutralChance.text = String(0) + "%"
            lowChance.text = String(0) + "%"
        }
        
        let roundDeckNumber = Float(Float(totalCards) / 52.0).rounded(.up)
        decksLeft = Int(roundDeckNumber)
        deckCount.text = String(decksLeft)
        
        
        
    }
    
    @IBAction func resetButton() {
        dismiss(animated: false, completion: nil)
    }
    
    func updateCells(){
        cells.removeAll()
        
        cells.append(.aces)
        cells.append(.King)
        cells.append(.Queen)
        cells.append(.Knight)
        cells.append(.tens)
        cells.append(.nines)
        cells.append(.eights)
        cells.append(.sevens)
        cells.append(.sixes)
        cells.append(.fives)
        cells.append(.fours)
        cells.append(.threes)
        cells.append(.twos)
        
        
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = cells[indexPath.row]
        
        switch cellType {
        case .King:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.identifier()) as! infoCell
            cell.config(type: cellType, count: kingCount)
            return cell
        case .Queen:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.identifier()) as! infoCell
            cell.config(type: cellType, count: queenCount)
            return cell
        case .Knight:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.identifier()) as! infoCell
            cell.config(type: cellType, count: knightCount)
            return cell
        case .tens:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.identifier()) as! infoCell
            cell.config(type: cellType, count: tenCount)
            return cell
        case .nines:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.identifier()) as! infoCell
            cell.config(type: cellType, count: nineCount)
            return cell
        case .eights:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.identifier()) as! infoCell
            cell.config(type: cellType, count: eightCount)
            return cell
        case .sevens:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.identifier()) as! infoCell
            cell.config(type: cellType, count: sevenCount)
            return cell
        case .sixes:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.identifier()) as! infoCell
            cell.config(type: cellType, count: sixCount)
            return cell
        case .fives:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.identifier()) as! infoCell
            cell.config(type: cellType, count: fiveCount)
            return cell
        case .fours:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.identifier()) as! infoCell
            cell.config(type: cellType, count: fourCount)
            return cell
        case .threes:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.identifier()) as! infoCell
            cell.config(type: cellType, count: threeCount)
            return cell
        case .twos:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.identifier()) as! infoCell
            cell.config(type: cellType, count: twoCount)
            return cell
        case .aces:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellType.identifier()) as! infoCell
            cell.config(type: cellType, count: aceCount)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
   
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return cells[indexPath.row].estimatedHeight()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cellType = cells[indexPath.row]
        
        switch cellType {
            
        case .King:
            TotalCountNumber = TotalCountNumber - 1
            countNumber.text = String(TotalCountNumber)
            kingCount = kingCount - 1
            self.tableView.reloadData()
            chanceCalculations()
            
            
        case .Queen:
            TotalCountNumber = TotalCountNumber - 1
            countNumber.text = String(TotalCountNumber)
            queenCount = queenCount - 1
            self.tableView.reloadData()
            chanceCalculations()
            
        case .Knight:
            TotalCountNumber = TotalCountNumber - 1
            countNumber.text = String(TotalCountNumber)
            knightCount = knightCount - 1
            self.tableView.reloadData()
            chanceCalculations()
            
        case .tens:
            TotalCountNumber = TotalCountNumber - 1
            countNumber.text = String(TotalCountNumber)
            tenCount = tenCount - 1
            self.tableView.reloadData()
            chanceCalculations()
            
        case .nines:
            TotalCountNumber = TotalCountNumber + 0
            countNumber.text = String(TotalCountNumber)
            nineCount = nineCount - 1
            self.tableView.reloadData()
            chanceCalculations()
            
        case .eights:
            TotalCountNumber = TotalCountNumber + 0
            countNumber.text = String(TotalCountNumber)
            eightCount = eightCount - 1
            self.tableView.reloadData()
            chanceCalculations()
            
        case .sevens:
            TotalCountNumber = TotalCountNumber + 0
            countNumber.text = String(TotalCountNumber)
            sevenCount = sevenCount - 1
            self.tableView.reloadData()
            chanceCalculations()
            
        case .sixes:
            TotalCountNumber = TotalCountNumber + 1
            countNumber.text = String(TotalCountNumber)
            sixCount = sixCount - 1
            self.tableView.reloadData()
            chanceCalculations()
            
        case .fives:
            TotalCountNumber = TotalCountNumber + 1
            countNumber.text = String(TotalCountNumber)
            fiveCount = fiveCount - 1
            self.tableView.reloadData()
            chanceCalculations()
            
        case .fours:
            TotalCountNumber = TotalCountNumber + 1
            countNumber.text = String(TotalCountNumber)
            fourCount = fourCount - 1
            self.tableView.reloadData()
            chanceCalculations()
            
        case .threes:
            TotalCountNumber = TotalCountNumber + 1
            countNumber.text = String(TotalCountNumber)
            threeCount = threeCount - 1
            self.tableView.reloadData()
            chanceCalculations()
            
        case .twos:
            TotalCountNumber = TotalCountNumber + 1
            countNumber.text = String(TotalCountNumber)
            twoCount = twoCount - 1
            self.tableView.reloadData()
            chanceCalculations()
        
        case .aces:
            TotalCountNumber = TotalCountNumber - 1
            countNumber.text = String(TotalCountNumber)
            aceCount = aceCount - 1
            self.tableView.reloadData()
            chanceCalculations()
        }
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

