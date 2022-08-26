//
//  FavouritePresenter.swift
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

protocol FavouritePresentationLogic {
  func presentFavouriteNote(response: Favourite.Something.Response)
}

class FavouritePresenter: FavouritePresentationLogic
{
  weak var viewController: FavouriteDisplayLogic?
  
  // MARK: Do something
  
  func presentFavouriteNote(response: Favourite.Something.Response) {
    let viewModel = Favourite.Something.ViewModel(notes: response.notes)
    viewController?.displayFavouriteNote(viewModel: viewModel)
  }
}
