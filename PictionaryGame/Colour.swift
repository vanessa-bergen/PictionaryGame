//
//  Colour.swift
//  PictionaryGame
//
//  Created by Vanessa Bergen on 2020-07-21.
//  Copyright © 2020 Vanessa Bergen. All rights reserved.
//

import Foundation
import UIKit

enum Colour {
    
    case black
    case red
    case orange
    case yellow
    case green
    case blue
    case purple
    case pink
    case eraser
    
    init?(tag: Int) {
        switch tag {
        case 1:
            self = .black
        case 2:
            self = .red
        case 3:
            self = .orange
        case 4:
            self = .yellow
        case 5:
            self = .green
        case 6:
            self = .blue
        case 7:
            self = .purple
        case 8:
            self = .pink
        case 9:
            self = .eraser
        default:
            return nil
            
        }
    }
    
    //return the chosen colour
    var colour: UIColor {
        switch self {
        case .black:
            return UIColor.black
            
        case .red:
            return UIColor.red
            
        case .orange:
            return UIColor.orange
            
        case .yellow:
            return UIColor.yellow
            
        case .green:
            return UIColor.green
            
        case .blue:
            return UIColor.blue
            
        case .purple:
            return UIColor.purple
            
        case .pink:
            return UIColor(red: 255/255, green: 192/255, blue: 203/255, alpha: 1.0)
            
            
        case .eraser:
            return UIColor.white
        }
        
    }
}

