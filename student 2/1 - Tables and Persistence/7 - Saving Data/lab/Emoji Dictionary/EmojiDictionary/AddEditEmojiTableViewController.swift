//
//  AddEditEmojiTableViewController.swift
//  tableView
//
//  Created by student on 05/04/24.
//

import UIKit
import Foundation

class AddEditEmojiTableViewController: UITableViewController {

    @IBOutlet var symbolTextField: UITextField!
    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var descriptionTextField: UITextField!
    @IBOutlet var usageTextField: UITextField!
    
    @IBOutlet var doneButton: UIBarButtonItem!
    var emoji :Emoji?
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButton.isEnabled = false
        if let emoji = emoji {
            symbolTextField.text = emoji.symbol
            nameTextField.text = emoji.name
            descriptionTextField.text = emoji.description
            usageTextField.text = emoji.usage
        }
    }
    
    @IBAction func symbolCheck(_ sender: UITextField) {
        let symbolText = symbolTextField.text ?? ""
        guard symbolText.count == 1, isEmoji(character: symbolText), symbolText != emoji?.symbol else{
            doneButton.isEnabled = false
            return
        }
        doneButton.isEnabled = true
    }
    
    init?(coder : NSCoder, emoji: Emoji?) {
        self.emoji = emoji
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func isEmoji(character: String) -> Bool {
        return character.unicodeScalars.allSatisfy { scalar in
            return scalar.properties.isEmoji
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let emojiSymbol = symbolTextField.text ?? ""// Nil Coalecingf
        let emojiName = nameTextField.text  ?? ""
        let emojiDescription = descriptionTextField.text  ?? ""
        let emojiUsage = usageTextField.text  ?? ""
        emoji = Emoji(symbol: emojiSymbol, name: emojiName, description: emojiDescription, usage: emojiUsage)
    }
}
