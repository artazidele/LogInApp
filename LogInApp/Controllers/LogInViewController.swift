//
//  ViewController.swift
//  LogInApp
//
//  Created by arta.zidele on 19/02/2021.
//

import UIKit

class LogInViewController: UIViewController {

    @IBOutlet weak var userNameTextField: DesignableTextField!
    
    @IBOutlet weak var passwordTextField: DesignableTextField!
    
    private let username = "a"
    private let id = "aa"
    private let identifier = "WelcomeViewController"
    
    
    
    let notificationCenter = NotificationCenter.default
    
    let userDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        notificationCenter.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        notificationCenter.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillShowNotification, object: nil)
    }
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        super .viewDidAppear(animated)
        if userDefaults.string(forKey: "username") != nil {
            goToWelcomeVC()
        }
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= 150
            let titleView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            let titleImageView = UIImageView(image: UIImage(named: "premie"))
            titleImageView.frame = CGRect(x: 0, y: 0, width: titleView.frame.width, height: titleView.frame.height)
            titleView.addSubview(titleImageView)
            navigationItem.titleView = titleView
        }
    }
    @objc func keyboardWillHide(notification: Notification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y += 150
            navigationItem.titleView?.isHidden = true
        }
    }

    func handleLogin() {
        guard userNameTextField.text == username, passwordTextField.text == id else {
            warningPopUp(withTitle: "Invalid Login", withMessage: "Please enter correct username and password!")
            return
        }
        
        userDefaults.set(username, forKey: "username")
        userDefaults.set(id, forKey: "id")
        goToWelcomeVC()
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    func goToWelcomeVC(){
        guard let initVC = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(identifier: identifier) as? WelcomeViewController else {return}
        view.endEditing(true)
        present(initVC, animated: true)
        
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        handleLogin()
    }
    
    @IBAction func forgotUsernameTapped(_ sender: Any) {
        warningPopUp(withTitle: "Oooops!", withMessage: "Your username is \(username)")
    }
    @IBAction func forgotPasswordTapped(_ sender: Any) {
        warningPopUp(withTitle: "Oooops!", withMessage: "Your password is \(id)")
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    
    
}

extension LogInViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTextField {
            passwordTextField.becomeFirstResponder()
        } else {
            handleLogin()
        }
        return true
    }
    
}

