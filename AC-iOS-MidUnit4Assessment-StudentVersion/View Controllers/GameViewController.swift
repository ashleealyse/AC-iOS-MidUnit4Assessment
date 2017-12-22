//
//  GameViewController.swift
//  AC-iOS-MidUnit4Assessment-StudentVersion
//
//  Created by Ashlee Krammer on 12/22/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    //Outlets
    @IBOutlet var currentHandValueLabel: UILabel!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var drawButton: UIButton!
    @IBOutlet var stopButton: UIButton!
    
    
    //Actions:
    
    @IBAction func drawAction(_ sender: UIButton) {
        
        ID = newDeck.deck_id
        loadCards()
    }
    
    
    //Variables
    var newDeck: NewDeck!
    var currentDeck: Deck!
    var ID = ""
    var cellSpacing = UIScreen.main.bounds.size.width * 0.05
    
    //View Did Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Make Buttons Round
        //Stop Button
        stopButton.layer.borderColor = UIColor.white.cgColor
        stopButton.layer.borderWidth = 2.0
        stopButton.layer.cornerRadius = stopButton.frame.width / 2
        
        //Draw Button
        drawButton.layer.borderColor = UIColor.white.cgColor
        drawButton.layer.borderWidth = 2.0
        drawButton.layer.cornerRadius = drawButton.frame.width / 2
        
        //Delegates
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        collectionView.reloadData()
        loadDeck()
 
    }
    
    
    
    //loadDeck
    func loadDeck() {
        
        let urlStr = "https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=6"
        
        let completion = {(onlineDeck: NewDeck) in
            self.newDeck = onlineDeck
            
        }
        
        let errorHanlder: (AppError) -> Void = {(error: AppError) in
            switch error{
            case .noInternetConnection:
                print("No internet connection")
            case .couldNotParseJSON:
                print("Could Not Parse")
            case .badStatusCode:
                print("Bad Status Code")
            case .badURL:
                print("Bad URL")
            case .invalidJSONResponse:
                print("Invalid JSON Response")
            case .noDataReceived:
                print("No Data Received")
            case .notAnImage:
                print("No Image Found")
            default:
                print("Other error")
            }
        }
        
        NewDeckAPIClient.manager.getDeck(from: urlStr, completionHandler: completion, errorHandler: errorHanlder)
        
    }
    
    //loadCards
    func loadCards() {
        let urlStr = "https://deckofcardsapi.com/api/deck/\(ID)/draw/?count=1"
        let completion = {(onlineDeck: Deck) in
            self.currentDeck = onlineDeck
        }
        
        let errorHanlder: (AppError) -> Void = {(error: AppError) in
            switch error{
            case .noInternetConnection:
                print("No internet connection")
            case .couldNotParseJSON:
                print("Could Not Parse")
            case .badStatusCode:
                print("Bad Status Code")
            case .badURL:
                print("Bad URL")
            case .invalidJSONResponse:
                print("Invalid JSON Response")
            case .noDataReceived:
                print("No Data Received")
            case .notAnImage:
                print("No Image Found")
            default:
                print("Other error")
            }
        }
        
        DrawCardAPIClient.manager.getCard(from: urlStr, completionHandler: completion, errorHandler: errorHanlder)
    }
    
}

func loadImages(){
    
}



//Collection View Extension
extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    //Num of Sections
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    //Cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath)
        let aCard = currentDeck.cards[indexPath.row]
        if let cell = cell as? CardCollectionViewCell {
            print(cell.worthLabel.text = aCard.value)
            return cell
        }
        
        return UICollectionViewCell()
        
    }
    
    
}



















