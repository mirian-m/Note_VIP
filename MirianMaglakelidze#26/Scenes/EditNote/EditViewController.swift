//
//  EditViewController.swift
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

protocol EditDisplayLogic: class {
    func displayEditMessage(viewModel: Edit.SelectedNote.ViewModel)
}

class EditViewController: UIViewController, EditDisplayLogic {
    @IBOutlet weak var favouriteBtn: UIButton! {
        didSet {
            favouriteBtn.layer.cornerRadius = 6
        }
    }
    @IBOutlet weak var noteTitleField: UITextField!
    @IBOutlet weak var noteInfoField: UITextField!
    var interactor: EditBusinessLogic?
    var router: (NSObjectProtocol & EditRoutingLogic & EditDataPassing)?
    lazy var isFavourite = (router?.dataStore?.noteForEdit!.isFavourite)!
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = EditInteractor()
        let presenter = EditPresenter()
        let router = EditRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = false
        navigationItem.rightBarButtonItems = [
            UIBarButtonItem(title: "Edit", style: .done, target: self, action: #selector(editNote))
        ]
        setButton()
        displayNoteDataForEdit()
    }
    
    func setButton() {
        let buttonTitle = isFavourite ? "Remove From Favourite" : "Add To Favourite"
        self.favouriteBtn.setTitle(buttonTitle, for: .normal)
        self.favouriteBtn.backgroundColor = isFavourite ? UIColor.green : UIColor.red
        self.favouriteBtn.tintColor = .white
    }
    
    @IBAction func addOrRemoveFromFavourite(_ sender: Any) {
        isFavourite.toggle()
        setButton()
    }
    
    @objc func editNote() {
        if checkFields() {
            show(title: "Error", message: "Pleas Fill all Fields")
            return
        }
        let note = NoteForme(title: noteTitleField.text!, info: noteInfoField.text!, createDate: Date(), isFavourite: isFavourite)
        let request = Edit.SelectedNote.Request(note: note)
        interactor?.editNote(request: request)
    }
    
    func checkFields() -> Bool {
        return noteTitleField.text == "" || noteInfoField.text == ""
    }
    
    func show(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .cancel) { [weak self] _ in
            if title == AlerTitle.success.rawValue {
                self?.router?.routeToNote(segue: nil)
            }
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: Do something
    
    func displayNoteDataForEdit() {
        guard let noteForEdit = router?.dataStore?.noteForEdit else { return }
        self.noteTitleField.text = noteForEdit.title
        self.noteInfoField.text = noteForEdit.info
    }
    
    func displayEditMessage(viewModel: Edit.SelectedNote.ViewModel) {
        show(title: viewModel.title.rawValue, message: viewModel.message)
    }
}
