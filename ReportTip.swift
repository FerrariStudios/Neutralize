//
//  ReportTip.swift
//  Neutralize
//
//  Created by User on 3/11/18.
//  Copyright © 2018 User. All rights reserved.
//

import UIKit

class ReportTip: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var cancela: UIButton!
    @IBOutlet weak var home: RoundButton!
    @IBOutlet weak var thanks: UILabel!
    @IBOutlet weak var fbiLogo: UIImageView!
    @IBOutlet weak var goON: RoundButton!
    @IBOutlet weak var submit: RoundButton!
    @IBOutlet weak var instruct: UILabel!
    @IBOutlet weak var locField: UITextField!
    @IBOutlet weak var infoBox: UITextView!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var PhoneField: UITextField!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var agree: UIButton!
    @IBOutlet weak var blurr: UIVisualEffectView!
    @IBOutlet weak var warning: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
agree.titleLabel?.numberOfLines = 10
        warning.alpha = 1
        agree.alpha = 1
        blurr.alpha = 1
        locField.alpha = 1
        emailField.alpha = 1
        PhoneField.alpha = 1
        nameField.alpha = 1
        instruct.alpha = 0
        infoBox.alpha = 0
        submit.alpha = 0
        goON.alpha = 1
        home.alpha = 0
        thanks.alpha = 0
    }
    
    @IBAction func nextTo(_ sender: UIButton) {
       
            UIView.animate(withDuration: 0.8, animations: {
                self.locField.alpha = 0
                 self.emailField.alpha = 0
                 self.PhoneField.alpha = 0
                 self.nameField.alpha = 0
                self.instruct.alpha = 1
                self.infoBox.alpha = 1
           self.submit.alpha = 1
                self.goON.alpha = 0
        
        })
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        locField.resignFirstResponder()
        emailField.resignFirstResponder()
        PhoneField.resignFirstResponder()
        nameField.resignFirstResponder()
        infoBox.resignFirstResponder()

    }
    @IBAction func submission(_ sender: UIButton) {
        UIView.animate(withDuration: 0.8) {
            self.instruct.alpha = 0
            self.infoBox.alpha = 0
            self.thanks.alpha = 1
            self.submit.alpha = 0
            self.home.alpha = 1
            
        }
        
        
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        locField.resignFirstResponder()
        emailField.resignFirstResponder()
        PhoneField.resignFirstResponder()
        nameField.resignFirstResponder()
        infoBox.resignFirstResponder()

        return true
    }
    @IBAction func openPage(_ sender: Any) {
        UIView.animate(withDuration: 0.8) {
            self.warning.alpha = 0
            self.agree.alpha = 0
self.blurr.alpha = 0
            self.cancela.alpha = 0
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func callHotline(_ sender: UIButton) {
        let alert = UIAlertController(title: "Call FBI Hotline", message: "Would you like to call 1-800-225-5324?", preferredStyle: UIAlertControllerStyle.alert)
        
        
        alert.addAction(UIAlertAction(title: "Call", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
    
    

}
