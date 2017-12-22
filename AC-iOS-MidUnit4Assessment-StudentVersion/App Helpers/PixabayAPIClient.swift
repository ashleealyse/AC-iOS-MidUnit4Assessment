//
//  PixabayAPIClient.swift
//  AC-iOS-MidUnit4Assessment-StudentVersion
//
//  Created by Ashlee Krammer on 12/22/17.
//  Copyright © 2017 C4Q . All rights reserved.
//

import Foundation
//
//struct PixabayAPIClient {
//    private init() {}
//    static let manager = PixabayAPIClient()
//    func getFirstImage(named str: String, completionHandler: @escaping (Pixabay) -> Void, errorHandler: @escaping (Error) -> Void) {
//        let urlStr = "https://pixabay.com/api/?key=7279094-3ddaaa4a7753197b307108035&q=" + str
//        let request = URLRequest(url: URL(string: urlStr)!)
//        let parsePixabay: (Data) -> Void = {(data: Data) in
//            do {
//                let allResults = try JSONDecoder().decode(PixabayResults, from: data)
//                let firstPixabay = allResults.hits.first ?? Pixabay.noDataPixabay
//                completionHandler(firstPixabay)
//            }
//            catch {
//                errorHandler(error)
//            }
//        }
//        NetworkHelper.manager.performDataTask(with: request, completionHandler: parsePixabay, errorHandler: errorHandler)
//    }
//}

