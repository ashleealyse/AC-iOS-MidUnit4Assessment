//
//  DrawCardAPIClient.swift
//  AC-iOS-MidUnit4Assessment-StudentVersion
//
//  Created by Ashlee Krammer on 12/22/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

struct DrawCardAPIClient{
    private init() {}
    static let manager = DrawCardAPIClient()
    func getCard(from urlStr: String, completionHandler: @escaping (Deck) -> Void, errorHandler: @escaping (AppError) -> Void){


        guard let url = URL(string: urlStr) else{
            errorHandler(.badURL)
            return
        }

        let completion: (Data) -> Void = {(data: Data) in

            do{
                let myDecoder = JSONDecoder()

                let  newCard = try myDecoder.decode(Deck.self, from: data)
                completionHandler(newCard)

            } catch{
                print(Error.self)
                errorHandler(.couldNotParseJSON)

            }
        }

NetworkHelper.manager.performDataTask(with: URLRequest(url: url), completionHandler: completion, errorHandler: errorHandler)
    }
}

