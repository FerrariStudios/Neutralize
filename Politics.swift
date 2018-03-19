//
//  Politics.swift
//  Neutralize
//
//  Created by User on 3/11/18.
//  Copyright © 2018 User. All rights reserved.
//

import UIKit

class Politics: UIViewController {

    @IBOutlet weak var blur: UIImageView!
    @IBOutlet weak var contacts: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var Picture: UIImageView!
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var arrow2: UIImageView!
    @IBOutlet weak var arrow1: UIImageView!
    @IBOutlet var officialButtons: [RoundButton]!
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    @IBAction func handleSelection(_ sender: UIButton) {
        officialButtons.forEach { (button) in
            UIView.animate(withDuration: 0.3, animations: {
                if (button.isHidden)
                {
                    self.arrow1.transform = CGAffineTransform(rotationAngle: 3.1)
                    self.arrow2.transform = CGAffineTransform(rotationAngle: 3.1)
                    self.blur.alpha = 0.8
                }
                if (!button.isHidden)
                {
                   
                    self.arrow1.transform = CGAffineTransform(rotationAngle: 0)
                    self.arrow2.transform = CGAffineTransform(rotationAngle: 0)
                    self.blur.alpha = 0

                }
                button.isHidden = !button.isHidden
                self.view.layoutIfNeeded()
            })
        }
    }
    
    enum Officials: String {
        
        case don = "Don Beyer"
        case tim = "Tim Kaine"
        case mark = "Mark Warner"
        case kay = "Kaye Kory"
        case rich = "Richard Saslaw"
    }
    
    @IBAction func cityTapped(_ sender: UIButton) {
        guard let title = sender.currentTitle, let official = Officials(rawValue: title) else {
            return
        }
        
        switch official {
        case .don:
            print("Don Beyer")
            handleSelection(officialButtons[0])
            Picture.image = #imageLiteral(resourceName: "Don Beyer")
            info.text = "Congressman Beyer is a fervent supporter of the Assault Weapons Ban, legislation he introduced in Congress with Rep. David Cicilline (D – RI) in light of the Parkland, Florida shooting. His legislation seeks to prohibit the sale, transfer, production, and importation of semi-automatic weapons with military-style features and expandable ammunition storage. While the legislation enjoys support from Democratic members of the House and Senate, it will likely see limited bipartisan support for it to become law"
            name.text = "U.S. Congressman: Don Beyer (D)"
contacts.text = "Contact his office: (703) 658-5403"
        case .tim:
            print("Tim Kaine")
            Picture.image = #imageLiteral(resourceName: "Tim Kaine")
            handleSelection(officialButtons[0])
            info.text = "A gun owner himself, Senator Kaine has consistently voiced his commitment to Americans’ right to bear arms, though he has made a concerted effort to pass commonsense legislation in the Senate. Legislation he has supported in the Senate has included efforts to expand mental health services, require background checks before all gun purchases, and limit combat-style weapons. He supports the Manchin-Toomey bill, a Senate bill that will require background checks on all commercial sales of guns. It will face a contentious vote on the Senate floor later in 2018."
            name.text = "U.S. Senator: Tim Kaine (D)"
contacts.text = "Contact his office: (540) 682-5693"
        case .mark:
            print("Mark Warner")
            Picture.image = #imageLiteral(resourceName: "Mark Warner")
            handleSelection(officialButtons[0])
            info.text = "Although a supporter of the Second Amendment, Senator Warner is a sponsor of the Fix NICS Act, legislation that bridges the gap between federal and state authorities on keeping records in the National Instant Criminal Background System. He, like many Republican and Democrat congressmen, supports the effort to ban bump stocks on semi-automatic weapons in Congress."
            name.text = "U.S. Senator: Mark Warner (D)"
            contacts.text = "Contact his office: (703) 442-0670"

        case .kay:
            print("Kaye Kory")
            Picture.image = #imageLiteral(resourceName: "Kaye Kory")
            handleSelection(officialButtons[0])
            info.text = "Like many of her fellow Democrats in the Virginia General Assembly, Delegate Kory supports commonsense gun control legislation that focuses on better communication between federal and state authorities with respect to the National Instant Criminal Background System. In the Virginia House of Delegates, she sponsored legislation that would limit Virginia’s open-carry policy at specific types of public events. Her bill was defeated in the State Senate."
            name.text = "State Delegate: Kaye Kory (D)"
contacts.text = "Contact her office: (703) 354-6024"
        case .rich:
            print("Rishard Saslaw")
            Picture.image = #imageLiteral(resourceName: "Dick Saslaw")
            handleSelection(officialButtons[0])
            info.text = "State Senator Saslaw has consistently supported legislation that limits the amount of firearms an individual can legally purchase each month. He opposes measures that seek to remove restrictions on guns and gun owners involving background checks and significant gun modifications. Like other Democrats in the General Assembly, Saslaw wants to prohibit loaded firearms in public places."
            name.text = "State Senate: Richard Saslaw (D)"
            contacts.text = "Contact his office: (703) 978-0200"
        }
        
    }
   

}
