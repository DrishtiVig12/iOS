//
//  ViewController.swift
//  SpacePhoto
//
//  Created by student on 16/04/24.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var copyrightLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    
    func showUI() async throws {
        
       
        
    }
    
    override func viewDidLoad() {
        let photoInfoController = PhotoInfoController()
        
        super.viewDidLoad()
        Task {
            do {
                let photoInfo = try await photoInfoController.fetchData()
        
                self.title = photoInfo.title
                self.imageView.image = UIImage()
                self.descriptionLabel.text = photoInfo.description
                self.copyrightLabel.text = photoInfo.copyrights
            }catch{
                
                self.title = "cannot fetch Data"
                self.imageView.image = UIImage(systemName: "photo.on.rectangle.angled")
                self.descriptionLabel.text = "cannot fetch Data"
                self.copyrightLabel.text = "cannot fetch Data"
            }
        }
    }


}

