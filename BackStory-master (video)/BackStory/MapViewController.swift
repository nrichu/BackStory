//
//  MapViewController.swift
//  BackStory
//
//  Created by Nicholas Richu on 12/2/17.
//  Copyright © 2017 Richu-Vlahos. All rights reserved.
//

import UIKit

class MapViewController: UIViewController {
  
    //let lvc = LocationViewController()
    
    @IBOutlet weak var mapName: UILabel!
    
    var idealText = ""
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       mapName.text = idealText
        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
