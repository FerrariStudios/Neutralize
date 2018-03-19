//
//  Survey.swift
//  Neutralize
//
//  Created by User on 3/10/18.
//  Copyright © 2018 User. All rights reserved.
//

import UIKit

class Survey: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func click(_ sender: UIButton) {
        if (sender.backgroundColor == nil)
        {
        sender.backgroundColor = UIColor.black
        }
        else
        {
            sender.backgroundColor = nil
        }
    }
    
    @IBAction func clickP(_ sender: UIButton) {
        if (sender.backgroundColor == nil)
        {
            sender.backgroundColor = UIColor.black
        }
        else
        {
            sender.backgroundColor = nil
        }
    }
    
    @IBAction func clickR(_ sender: UIButton) {
        if (sender.backgroundColor == nil)
        {
            sender.backgroundColor = UIColor.black
        }
        else
        {
            sender.backgroundColor = nil
        }
    }
    @IBAction func clickF(_ sender: UIButton) {
        if (sender.backgroundColor == nil)
        {
            sender.backgroundColor = UIColor.black
        }
        else
        {
            sender.backgroundColor = nil
        }
    }
    @IBAction func clickB(_ sender: UIButton) {
        if (sender.backgroundColor == nil)
        {
            sender.backgroundColor = UIColor.black
        }
        else
        {
            sender.backgroundColor = nil
        }
    }
    @IBAction func clickG(_ sender: UIButton) {
        if (sender.backgroundColor == nil)
        {
            sender.backgroundColor = UIColor.black
        }
        else
        {
            sender.backgroundColor = nil
        }
    }
    @IBAction func clickH(_ sender: UIButton) {
        if (sender.backgroundColor == nil)
        {
            sender.backgroundColor = UIColor.black
        }
        else
        {
            sender.backgroundColor = nil
        }
    }
    
    @IBAction func sliderStuff(_ sender: UISlider) {
        sender.value = roundf(sender.value)
    }
    @IBAction func moreSliderStuff(_ sender: UISlider) {
        sender.value = roundf(sender.value)

    }
    @IBAction func newSliderStuff(_ sender: UISlider) {
        if (sender.value > 6.0)
        {
            sender.value = 7.0
        }

    }
    @IBAction func unwindSurvey(segue: UIStoryboardSegue){
        
    }

}
