//
//  WelcomeViewController.swift
//  LogInApp
//
//  Created by arta.zidele on 19/02/2021.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let username = userDefaults.string(forKey: "username"), let id = userDefaults.string(forKey: "id") {
            welcomeLabel.text = "Welcome, \(username), with id: \(id)"
        }
    }
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        let defaults = UserDefaults.standard
        let dictionary = defaults.dictionaryRepresentation()
        dictionary.keys.forEach {key in
            defaults.removeObject(forKey: key)
        }
        dismiss(animated: true, completion: nil)
    }
    
}
