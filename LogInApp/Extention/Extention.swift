//
//  Extention.swift
//  LogInApp
//
//  Created by arta.zidele on 19/02/2021.
//

import UIKit

extension UIViewController {
    func warningPopUp(withTitle title: String?, withMessage message: String?) {
        DispatchQueue.main.async {
            let popUp = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let okButton = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            popUp.addAction(okButton)
            self.present(popUp, animated: true)
        }
    }
}
