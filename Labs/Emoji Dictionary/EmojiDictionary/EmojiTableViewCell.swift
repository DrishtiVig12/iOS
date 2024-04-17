//
//  EmojiTableViewCell.swift
//  tableView
//
//  Created by student on 05/04/24.
//

import UIKit

class EmojiTableViewCell: UITableViewCell {


    @IBOutlet var emojiName: UILabel!
    @IBOutlet var emojiDescription: UILabel!
    
    

    @IBOutlet var emojiSymbol: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func update(emoji : Emoji){
        emojiSymbol.text = emoji.symbol
        emojiName.text = emoji.name
        emojiDescription.text = emoji.description
    }

}
