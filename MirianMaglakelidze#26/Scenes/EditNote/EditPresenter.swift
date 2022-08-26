//
//  EditPresenter.swift
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

protocol EditPresentationLogic {
    func presentEditMessage(response: Edit.SelectedNote.Response)
}

class EditPresenter: EditPresentationLogic {
    weak var viewController: EditDisplayLogic?
    
    // MARK: Do something
    func presentEditMessage(response: Edit.SelectedNote.Response) {
        var title: AlerTitle?
        var message = ""
        if response.error == nil {
            title = AlerTitle.success
            message = "New Note Add Successfully"
        } else {
            title = AlerTitle.error
            message = response.error!.localizedDescription
        }
        let viewModel = Edit.SelectedNote.ViewModel(title: title!, message: message)
        viewController?.displayEditMessage(viewModel: viewModel)
    }
}
