//
//  AddRouter.swift
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

@objc protocol AddRoutingLogic {
    func routeToNote(segue: UIStoryboardSegue?)
}

protocol AddDataPassing
{
    var dataStore: AddDataStore? { get }
}

class AddRouter: NSObject, AddRoutingLogic, AddDataPassing {
    
    func routeToNote(segue: UIStoryboardSegue?) {
        navigateToNote(source: viewController!, destination: UIViewController())
    }
    
    weak var viewController: AddViewController?
    var dataStore: AddDataStore?
    
    
    // MARK: Navigation
    
    func navigateToNote(source: AddViewController, destination: UIViewController) {
        source.navigationController?.popToRootViewController(animated: true)
    }
    
}