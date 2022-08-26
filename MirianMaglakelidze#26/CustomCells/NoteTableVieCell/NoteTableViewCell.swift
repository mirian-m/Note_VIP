//
//  NoteTableViewCell.swift
//  MirianMaglakelidze#26
//
//  Created by Admin on 8/26/22.
//

import UIKit

class NoteTableViewCell: UITableViewCell {
    
    static let identifier = "NoteTableViewCell"
    
    @IBOutlet weak var view: UIView! {
        didSet {
            view.backgroundColor = .lightGray
            view.layer.cornerRadius = 10
            
        }
    }
    @IBOutlet weak var noteTitleLb: UILabel!
    @IBOutlet weak var noteInfoLb: UILabel!
    @IBOutlet weak var creationDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
        
    }

    func configurCell(with note: MyNote) {
        self.noteTitleLb.text = note.title
        self.noteInfoLb.text = note.info
        self.creationDate.text = "\(note.creationDate!)"
    }
}
