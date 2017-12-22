////
////  PersistantStoreManager.swift
////  AC-iOS-MidUnit4Assessment-StudentVersion
////
////  Created by Ashlee Krammer on 12/22/17.
////  Copyright © 2017 C4Q . All rights reserved.
////
//
//import Foundation
//import UIKit
//
//class PersistentStoreManager {
//
//    static let kPathname = "History.plist"
//    private init(){}
//    static let manager = PersistentStoreManager()
//
//    private var history = [History]() {
//        didSet{
//            saveToDisk()                   // here we call the helper function save to disk.
//        }                                  // we do this whenever we update our favorites
//    }
//
//
//
//
////   returns documents directory path for app sandbox
////    aka the place where we want to store our stuff
//
//
//    func documentsDirectory() -> URL {
//        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
//        return paths[0]
//    }
//
//
//
//
//// another helper function that further creates the path for where you are storing the info
//
//    func dataFilePath(withPathName path: String) -> URL {
//        return PersistentStoreManager.manager.documentsDirectory().appendingPathComponent(path)
//    }
//
//
//
//
//
//// this takes our array of favorites and encodes it into data to be stored away
//// it has a nice print system to tell you where it has saved the data
//// meaning that if it works, you should see this on your terminal
//
//
//    func saveToDisk() {
//        let encoder = PropertyListEncoder()
//        do {
//            let data = try encoder.encode(history)
//            // Does the writing to disk
//            try data.write(to: dataFilePath(withPathName: PersistentStoreManager.kPathname), options: .atomic)
//        } catch {
//            print("encoding error: \(error.localizedDescription)")
//        }
//        print("\n==================================================")
//        print(documentsDirectory())
//        print("===================================================\n")
//    }
//
//
//
//
//
////     load from documents directory
////     there is a function later on that returns your array called getFavorites()
////     it calls this load function to have the array populated by decoding the data saved
////     if you want the favorites to be loaded when your app begins (so if you go to a favorites viewController for example and want that array to be loaded with data) without needing a function to return the array. you can call this function with PersistentStoreManager.manger.load
//
//
//
//    func load() {
//        let path = dataFilePath(withPathName: PersistentStoreManager.kPathname)
//        let decoder = PropertyListDecoder()
//        do {
//            let data = try Data.init(contentsOf: path)
//            favorites = try decoder.decode([History].self, from: data)
//        } catch {
//            print("decoding error: \(error.localizedDescription)")
//        }
//    }
//
//
//
//
//
//    // does 2 tasks:
//    // 1. stores image in documents folder
//    // 2. appends favorite item to array
//// this is the function you call to add a favorite
//// as it is written, it can take in an image and an object to save
//
//
//
//    func addToHistory(object: OBJECT, andImage image: UIImage) -> Bool  {
//
//// checking for uniqueness
//// YOU DO THIS BY MATCHING SOME PROPERTY THE OBEJECT MODEL AND THE FAVORITE MODEL BOTH HAVE
//// LETS ASSUME HERE THAT THEY HAVE TITLES
//// $0 = all the favorites
//
//        let indexExist = history.index{ $0.title == object.title }
//        if indexExist != nil { print("HISTORY EXIST"); return false }
//
//
//        // 1) save image from favorite photo by using a helper function
//
//        let success = storeImageToDisk(image: image, andObject: object)
//        if !success { return false }
//
//        // 2) save favorite object
////    initialze an instantce of a favorite by giving it values from the object you are saving as a favorite. assuming they both have titles like before then it looks like
//
//        let newHISTORY = History.init(title: object.title)
//        histroy.append(newHISTORY)
//        return true
//    }
//
//
//
//
//    // store image
//    func storeImageToDisk(image: UIImage, andObject object: object) -> Bool {
//        // packing data from image
//        guard let imageData = UIImagePNGRepresentation(image) else { return false }
//
//        // writing and saving to documents folder
//
//        // 1) save image using a url that makes use of some property of your object to identify the picture
//// in this case im going to use my objects title
//
//        let imageURL = PersistentStoreManager.manager.dataFilePath(withPathName: "\(object.title)")
//        do {
//            try imageData.write(to: imageURL)
//        } catch {
//            print("image saving error: \(error.localizedDescription)")
//        }
//        return true
//    }
//
//
//
//
//
//// check to see if your object is already in favorites without having to try and add it
//// it returns a bool
//// it is using the title property to check but you can modify this to your needs
//
//    func isObjectInHistory(book: BookInfo) -> Bool {
//        // checking for uniqueness
//        let indexExist = favorites.index{ $0.title == object.title }
//        if indexExist != nil {
//            return true
//        } else {
//            return false
//        }
//    }
//
//
//// bonus if you need to check a favorite object rather than the object you started with
//// again using the title. you can change
//
//
//    func isFavoriteInFavorites(favorite: Favorite) -> Bool {
//        // checking for uniqueness
//        let indexExist = favorites.index{ $0.title == favorite.title }
//        if indexExist != nil {
//            return true
//        } else {
//            return false
//        }
//    }
//
//
//      //just a function to get a specific favorite given some indentified. the example uses title
//
//    func getFavoriteWithTitle(title: String) -> Favorite? {
//        let index = getFavorites().index{$0.title == title}
//        guard let indexFound = index else { return nil }
//        return favorites[indexFound]
//    }
//
//
//
//
//  func to load and return your favorites array.
//
//    func getFavorites() -> [Favorite] {
//        load()
//        return favorites
//    }
//
//
////  remove a favorite taking in an index and a favorite
//
//
//    func removeFavorite(fromIndex index: Int, andfavorite favorite: Favorite) -> Bool {
//        favorites.remove(at: index)
//        // remove image
//        let imageURL = PersistentStoreManager.manager.dataFilePath(withPathName: "\(favorite.title)")
//        do {
//            try FileManager.default.removeItem(at: imageURL)
//            print("\n==============================================================================")
//            print("\(imageURL) removed")
//            print("==============================================================================\n")
//            return true
//        } catch {
//            print("error removing: \(error.localizedDescription)")
//            return false
//        }
//    }
//
//}

