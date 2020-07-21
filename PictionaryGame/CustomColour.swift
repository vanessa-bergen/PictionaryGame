//
//  CustomColour.swift
//  PictionaryGame
//
//  Created by Vanessa Bergen on 2020-07-21.
//  Copyright © 2020 Vanessa Bergen. All rights reserved.
//

import Foundation
import UIKit

class CustomColour {
    var colour: UIColor
    var opacity: CGFloat
    var brush: CGFloat
    
    init(colour: UIColor, opacity: CGFloat, brush: CGFloat) {
        self.colour = colour
        self.opacity = opacity
        self.brush = brush
    }
}
