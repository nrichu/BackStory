//
//  Museum.swift
//  BackStory
//
//  Created by Nicholas Richu on 12/7/17.
//  Copyright © 2017 Richu-Vlahos. All rights reserved.
//

import UIKit

class Museum {
    
    var museumName: String
    var museumMap: UIImage
    var mapLegend: UIImage
    
    init(_ museumName : String,_ museumMap: UIImage, _ mapLegend: UIImage ) {
        self.museumName = museumName
        self.museumMap = museumMap
        self.mapLegend = mapLegend
        
        
    }
    func getMap() -> UIImage {
        return museumMap
    }
    
    func getLegend() -> UIImage {
        return mapLegend
    }
    
    
    
    
    
}
