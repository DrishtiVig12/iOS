//
//  EmojiTableViewController.swift
//  tableView
//
//  Created by student on 03/04/24.
//

import UIKit

class EmojiTableViewController: UITableViewController {

    @IBOutlet weak var editBtn: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1;
    }

    @IBAction func handleEdit(_ sender: Any) {
        let isEdit = tableView.isEditing
        tableView.setEditing(!isEdit, animated: true)
        if(isEdit){
            editBtn.title = "Edit"
        }
        else{
            editBtn.title = "Done"
        }
        
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
    
        return emojis.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: "emojicell",
            for: indexPath
        ) as! EmojiTableViewCell
        
        let emoji = emojis[indexPath.row]
        cell.update(emoji: emoji)
        
//        var content = cell.defaultContentConfiguration()
//        content.text = "\(emoji.symbol) - \(emoji.name)"
//        content.secondaryText = emoji.description
//        cell.contentConfiguration = content
//        cell.showsReorderControl = true
        return cell
         //Configure the cell...

    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let emoji = emojis[indexPath.row]
        print(emoji.usage)
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let emoji = emojis[indexPath.row]
//        tableView.deselectRow(at: indexPath, animated: true)
        print(emoji.symbol)
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
//        if(indexPath.row % 2 == 0){
//            return false
//        }
        return true
    }
    
    override func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        .delete
    }

    
    @IBAction func unwindToEmoji(unwindSegue : UIStoryboardSegue){
        guard unwindSegue.identifier == "doneUnwind", let source = unwindSegue.source as? AddEditEmojiTableViewController, let emoji = source.emoji else{
            return
        }
//        print(tableView)
        if let index = tableView.indexPathForSelectedRow {
            emojis[index.row] = emoji
            tableView.reloadRows(at: [index], with: .automatic)
        }else{
            emojis.append(emoji)
            let newIndexPath = IndexPath(row: emojis.count - 1, section: 0)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
        tableView.reloadData()
    }
    
    
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            emojis.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    

    @IBSegueAction func addEditEmoji(_ coder: NSCoder, sender: Any?) -> AddEditEmojiTableViewController? {
        if let cell = sender as? EmojiTableViewCell, let indexPath = tableView.indexPath(for: cell) {
            let emojiToEdit = emojis[indexPath.row]
            return AddEditEmojiTableViewController(coder: coder, emoji: emojiToEdit)
        } else{
            return AddEditEmojiTableViewController(coder: coder, emoji: nil)
        }
    }
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
   
        let emoji = emojis.remove(at: fromIndexPath.row)
        
        emojis.insert(emoji, at: to.row)
        
    }
    


}
