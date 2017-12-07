//
//  ViewController.swift
//  BackStory
//
//  Created by Nicholas Richu on 11/30/17.
//  Copyright © 2017 Richu-Vlahos. All rights reserved.
//

import UIKit

class LocationViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   @IBOutlet var locationMenu: UIPickerView!
    
    let locations = ["Duke 303", "Global Commons"]
    var location : String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        location = locations[0]
        self.locationMenu.delegate = self
        self.locationMenu.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return locations.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return locations[row]
    }
    // Catpure the picker view selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
       
        location = locations[row]
        
   
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     let nextView = segue.destination as! MapViewController
            nextView.idealText = location
        
    }
    
    



}

