//
//  FavouriteInteractor.swift
//  MirianMaglakelidze#26
//
//  Created by Admin on 8/26/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol FavouriteBusinessLogic
{
    func getFavourite(request: Favourite.Something.Request)
}

protocol FavouriteDataStore {
    //var name: String { get set }
}

class FavouriteInteractor: FavouriteBusinessLogic, FavouriteDataStore {
    var presenter: FavouritePresentationLogic?
    var worker: FavouriteWorker?
    //var name: String = ""
    
    // MARK: Do something
    
    func getFavourite(request: Favourite.Something.Request) {
        var favouriteNotes: [MyNote] = []
        worker = FavouriteWorker()
        worker?.getNoteUsingPredicate(complition: { result in
            switch result {
            case .success(let notes):
                favouriteNotes = notes
            case .failure(let error):
                print(error)
            }
        })
        
        let response = Favourite.Something.Response(notes: favouriteNotes)
        presenter?.presentFavouriteNote(response: response)
    }
}
