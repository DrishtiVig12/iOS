//
//  ViewController.swift
//  App Event Count
//
//  Created by student on 01/04/24.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBOutlet var didFinishingLabel: UILabel!
    @IBOutlet var configurationLabel: UILabel!
    @IBOutlet var willConnectLabel: UILabel!
    @IBOutlet var sceneActiveLabel: UILabel!
    @IBOutlet var sceneResignActiveLabel: UILabel!
    @IBOutlet var sceneForegroundLabel: UILabel!
    @IBOutlet var sceneBackgroundLabel: UILabel!
    

    var willConnectCount = 0
    var sceneActiveCount = 0
    var sceneResignActiveCount = 0
    var sceneForegroundCount = 0
    var sceneBackgroundCount = 0
    
    var appDelegate = (UIApplication.shared.delegate as! AppDelegate)
    
    func updateView(){
        didFinishingLabel.text = "The App has launched \(appDelegate.launchCount) times."
        configurationLabel.text = "The App has been configured \(appDelegate.configurationForConnectingCount) times."
        willConnectLabel.text = "The App has been Connected \(willConnectCount) times"
        sceneActiveLabel.text = "The Scene has been activated \(sceneActiveCount) times"
        sceneResignActiveLabel.text = "The Scene has been resign activated \(sceneResignActiveCount) times"
        sceneForegroundLabel.text = "The Scene has been in Foreground \(sceneForegroundCount) times"
        sceneBackgroundLabel.text = "The Scene has been in Background \(sceneBackgroundCount) times"
    }
}

