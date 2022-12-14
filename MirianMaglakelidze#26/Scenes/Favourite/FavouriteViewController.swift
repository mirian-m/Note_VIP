//
//  FavouriteViewController.swift
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

protocol FavouriteDisplayLogic: class {
    func displayFavouriteNote(viewModel: Favourite.Something.ViewModel)
}

class FavouriteViewController: UITableViewController, FavouriteDisplayLogic {
    var interactor: FavouriteBusinessLogic?
    var router: (NSObjectProtocol & FavouriteRoutingLogic & FavouriteDataPassing)?
    private var favouriteNote: [MyNote] = []
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
        title = "Favourite Note"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(true)
        getFavouriteNote()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = FavouriteInteractor()
        let presenter = FavouritePresenter()
        let router = FavouriteRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    
    func getFavouriteNote() {
        let request = Favourite.Something.Request()
        interactor?.getFavourite(request: request)
    }
    
    func displayFavouriteNote(viewModel: Favourite.Something.ViewModel) {
        DispatchQueue.main.async { [weak self] in
            self?.favouriteNote = viewModel.notes
            self?.tableView.reloadData()
        }
    }
}

extension FavouriteViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: NoteTableViewCell.identifier, for: indexPath) as? NoteTableViewCell else { return UITableViewCell() }
        let currentNote = favouriteNote[indexPath.row]
        cell.configurCell(with: currentNote)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favouriteNote.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        TableViewConstant.heightForRow
    }
}
