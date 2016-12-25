//
//  ViewController.swift
//  IWeather
//
//  Created by Nguyen Van Tuan on 12/23/16.
//  Copyright © 2016 MyProjects. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lbl_degree: UILabel!
    @IBOutlet weak var lbl_city: UILabel!
    @IBOutlet weak var lbl_message: UILabel!
    @IBOutlet weak var btn_CF: UIButton!
    
    var city = ["Lost Angeless", "New York", "Washington"]
    var message = ["I have a simple philosophy : Fill what’s empty. Empty what full. Scratch where it itch" , "There are two ways to get enough" , "Nothing in life is to be feared, it’s to be understood. Now is the time to understand more, so that we may fear less – Marie Curie"]
    var cF = "C"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func acc_CF(sender: UIButton) {
        if cF == "C" {
            cF = "F"
            getTemp(Double(lbl_degree.text!)! * 1.8 + 32)
        }else{
            cF = "C"
            getTemp((Double(lbl_degree.text!)! - 32) / 1.8)
        }
        btn_CF.setTitle(cF, forState: .Normal)
    }
    
    @IBAction func btn_refresh(sender: AnyObject) {
        let cityIndex = Int(arc4random_uniform(UInt32(city.count)))
        lbl_city.text = city[cityIndex]
        
        let messIndex = Int(arc4random_uniform(UInt32(message.count)))
        lbl_message.text = message[messIndex]
        if cF == "F" {
            getTemp(temp() * 1.8 + 32)
        }else{
            getTemp(temp())
        }
    }
    
    func getTemp(tp: Double) -> Void {
        let randomNumber = String(format: "%2.1f", tp)
        lbl_degree.text = randomNumber
    }
    
    func temp() -> Double {
        return Double(arc4random_uniform(18) + 14) + Double(arc4random()) / Double(INT32_MAX)
    }
    



}

