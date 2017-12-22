//
//  NewDeckAPIClient.swift
//  AC-iOS-MidUnit4Assessment-StudentVersion
//
//  Created by Ashlee Krammer on 12/22/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation

struct NewDeckAPIClient{
    private init() {}
    static let manager = NewDeckAPIClient()
    func getDeck(from urlStr: String, completionHandler: @escaping (NewDeck) -> Void, errorHandler: @escaping (AppError) -> Void){


        guard let url = URL(string: urlStr) else{
            errorHandler(.badURL)
            return
        }

        let completion: (Data) -> Void = {(data: Data) in

            do{
                let myDecoder = JSONDecoder()

                let  newDeck = try myDecoder.decode(NewDeck.self, from: data)
                completionHandler(newDeck)

            } catch{
                print(Error.self)
                errorHandler(.couldNotParseJSON)

            }
        }

        NetworkHelper.manager.performDataTask(with: URLRequest(url: url), completionHandler: completion, errorHandler: errorHandler)
    }
}

