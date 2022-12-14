//
//  NoteWorker.swift
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
import CoreData

class NoteWorker
{
    func getNoteFromCorData(complition: @escaping (Result<[Any]?, Error>) -> Void) {
        do {
            let notes = try AppDelegatConstant.context.fetch(MyNote.fetchRequest())
            complition(.success(notes))
        } catch {
            complition(.failure(error))
        }
    }
}
