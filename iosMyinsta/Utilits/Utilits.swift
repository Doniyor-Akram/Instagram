//
//  Utilits.swift
//  iosMyinsta
//
//  Created by Doniyor on 06/08/22.
//

import Foundation
import SwiftUI

class Utilits {
    static var colorOne = Color(red: 252/255, green: 175/255, blue: 69/255)
    static var colorTwo = Color(red: 245/255, green: 96/255, blue: 64/255)
    
    static var image1: String = "https://lh6.googleusercontent.com/-9lzOk_OWZH0/URquoo4xYoI/AAAAAAAAAbs/AwgzHtNVCwU/s1024/Frantic.jpg"
    static var image2: String = "https://lh4.googleusercontent.com/-JhFi4fb_Pqw/URquuX-QXbI/AAAAAAAAAbs/IXpYUxuweYM/s1024/Horseshoe%252520Bend.jpg"
}

extension UIScreen {
    static let width = UIScreen.main.bounds.size.width
    static let height = UIScreen.main.bounds.size.height
    static let size = UIScreen.main.bounds.size
}
