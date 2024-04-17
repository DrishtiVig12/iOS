//
//  PhotoInfo.swift
//  SpacePhoto
//
//  Created by student on 16/04/24.
//

import UIKit
import Foundation

struct PhotoInfo : Codable {
    var title : String
    var description : String
    var url : String
    var copyrights : String?
    
    enum CodingKeys: String, CodingKey{
        case title
        case description = "explanation"
        case url
        case copyrights
    }
}
