//
//  AddViewController.swift
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

protocol AddDisplayLogic: AnyObject {
    func displayMessage(viewModel: Add.Note.ViewModel)
}

class AddViewController: UIViewController, AddDisplayLogic {
    @IBOutlet weak var notetitle: UITextField!
    @IBOutlet weak var noteInfo: UITextField!
    
    var interactor: AddBusinessLogic?
    var router: (NSObjectProtocol & AddRoutingLogic & AddDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(title: "Save", style: .done, target: self, action: #selector(addNote))
        ]
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = AddInteractor()
        let presenter = AddPresenter()
        let router = AddRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    @objc func addNote() {
        if checkFields() {
            show(title: "Error", message: "Pleas Fill all Fields")
            return
        }
        let note = NoteForme(title: notetitle.text!, info: noteInfo.text!, createDate: Date(), isFavourite: false)
        let request = Add.Note.Request(note: note)
        interactor?.addNewNote(request: request)
    }
    
    
    func displayMessage(viewModel: Add.Note.ViewModel) {
        self.show(title: viewModel.title.rawValue, message: viewModel.message)
    }
    
    func checkFields() -> Bool {
        return noteInfo.text == "" || notetitle.text == ""
    }
    
    func show(title: String, message: String) {
        noteInfo.text = ""
        notetitle.text = ""
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel) { [weak self] _ in
            if title == AlerTitle.success.rawValue {
                self?.router?.routeToNote(segue: nil)
            }
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

}
