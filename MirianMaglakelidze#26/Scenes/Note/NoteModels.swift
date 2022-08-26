//
//  NoteModels.swift
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

enum Note
{
    // MARK: Use cases
    enum RemoveNote {
        struct Request {
            var note: MyNote
        }
        struct Response {
            var error: Error?
        }
        struct ViewModel {
            var error: String?
        }
        
    }
    enum CoreData {
        struct Request {}
        struct Response {
            var result: Result<[Any]?, Error>
        }
        struct ViewModel {
            var myNote: [MyNote]?
            var error: String?
        }
    }
}
