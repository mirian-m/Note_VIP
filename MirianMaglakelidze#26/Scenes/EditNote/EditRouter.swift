//
//  EditRouter.swift
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

@objc protocol EditRoutingLogic {
    func routeToNote(segue: UIStoryboardSegue?)
}

protocol EditDataPassing {
    var dataStore: EditDataStore? { get }
}

class EditRouter: NSObject, EditRoutingLogic, EditDataPassing {
    
    weak var viewController: EditViewController?
    var dataStore: EditDataStore?
    
    // MARK: Routing
    
    func routeToNote(segue: UIStoryboardSegue?) {
        navigateToNote(source: viewController!, destination: UIViewController())
    }
    
    // MARK: Navigation
    
    func navigateToNote(source: EditViewController, destination: UIViewController) {
        source.navigationController?.popToRootViewController(animated: true)
    }
    
    // MARK: Passing data
    
    //func passDataToSomewhere(source: EditDataStore, destination: inout SomewhereDataStore)
    //{
    //  destination.name = source.name
    //}
}