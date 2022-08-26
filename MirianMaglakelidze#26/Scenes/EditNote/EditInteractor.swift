//
//  EditInteractor.swift
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

protocol EditBusinessLogic {
    func editNote(request: Edit.SelectedNote.Request)
}

protocol EditDataStore {
    var noteForEdit: MyNote? { get set }
}

class EditInteractor: EditBusinessLogic, EditDataStore {
    var presenter: EditPresentationLogic?
    var worker: EditWorker?
    var noteForEdit: MyNote?
    
    // MARK: Do something
    
    func editNote(request: Edit.SelectedNote.Request) {
        var editError: Error?
        noteForEdit!.info = request.note.info
        noteForEdit!.title = request.note.title
        noteForEdit!.isFavourite = request.note.isFavourite
        noteForEdit!.creationDate = request.note.createDate
        do {
            try AppDelegatConstant.context.save()
        } catch {
            editError = error
        }
        let response = Edit.SelectedNote.Response(error: editError)
        self.presenter?.presentEditMessage(response: response)
    }
}
