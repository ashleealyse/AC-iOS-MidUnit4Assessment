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
    //When the stop button is clicked (make action), it will reset the cards and add that game to your history and tell the user if they won or not
    @IBOutlet var stopButton: UIButton!
    
    
    //Actions:
    
    @IBAction func drawAction(_ sender: UIButton) {
        counter += 1
        print("button pressed \(counter) times")
        ID = newDeck.deck_id
        loadCards()
       
//I tried to creat and array where I would append a Card that way I could say it and allow my view to populate based on the count of that array and then from there I could keep score with those saved cards
//        cardArr.append(currentCard)
    }
    
    
    //Variables
    var counter = 0
    var newDeck: NewDeck! {
        didSet {
            collectionView.reloadData()
        }
    }
    
    var currentDeck: Deck? {
        didSet {
            collectionView.reloadData()
        }
    }
    var ID = ""
    var cellSpacing = UIScreen.main.bounds.size.width * 0.05
    var score = 0
//    var cardArr = [Card]()
//    var currentCard: Card!
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
        self.drawButton.isEnabled = false
        //Delegates
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        loadDeck()
        
        
    }
    
    
    
    //loadDeck
    func loadDeck() {
       
        
        let urlStr = "https://deckofcardsapi.com/api/deck/new/shuffle/?deck_count=6"
        
        let completion = {(onlineDeck: NewDeck) in
            self.newDeck = onlineDeck
            self.drawButton.isEnabled = true
            self.collectionView.reloadData()
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
        
//          currentCard = Card.init(image: (currentDeck?.cards![0].image)!, value: (currentDeck?.cards![0].value)!, suit: (currentDeck?.cards![0].suit)!)
        
        let urlStr = "https://deckofcardsapi.com/api/deck/\(ID)/draw/?count=1"
        let completion = {(onlineDeck: Deck) in
            self.currentDeck = onlineDeck
            print(self.currentDeck!)
        }
        
        let errorHandler: (AppError) -> Void = {(error: AppError) in
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
        
        DrawCardAPIClient.manager.getCard(from: urlStr, completionHandler: completion, errorHandler: errorHandler)
    }
    
//    func loadImages(){
//        let imageUrlStr = currentDeck?.cards![0].image
//
//        let completion: (UIImage) -> Void = {(onlineImage: UIImage) in
//
//
//        }
//        let imageError: (Error) -> Void = {(error: Error) in
//
//            print(error)
//        }
//        activityIndicator.startAnimating()
//        ImageAPIClient.manager.getImage(from: imageUrlStr, completionHandler: completion, errorHandler: imageError)
        


}





//Collection View Extension
extension GameViewController: UICollectionViewDelegate, UICollectionViewDataSource  {


    //Num of Sections
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if let num = self.currentDeck?.cards?.count {
            return num
        }
        
        return 0
    }

    //Cells
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if counter > 2 {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CardCell", for: indexPath)
//        if counter > 2 {
        let aCard = currentDeck?.cards?[indexPath.row]
        if let cell = cell as? CardCollectionViewCell {
            print(cell.worthLabel.text = aCard?.value)

            return cell
            }
//        }

        return UICollectionViewCell()

    }


}



















