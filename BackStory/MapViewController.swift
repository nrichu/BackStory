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
    @IBOutlet weak var mapLegend: UIImageView!
    @IBOutlet weak var mapPic: UIImageView!
    
    var idealText = ""
    var idealMap : UIImage?
    var idealLegend : UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       mapName.text = idealText
        mapPic.image = idealMap
        mapLegend.image = idealLegend
       
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
