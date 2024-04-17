//
//  PhotoInfoController.swift
//  SpacePhoto
//
//  Created by student on 16/04/24.
//

import UIKit
import Foundation

class PhotoInfoController {
    
    enum PhotoInfoError : Error, LocalizedError {
        case itemNotFound
        case parsingError
    }

    func fetchData() async throws -> PhotoInfo {
        
        let queryItems = [
            "api_key" : "we1LG1DVmwDGOctBOipfulXYnIGba4etCf5otf2H",
            "date" : "2024-03-14"
        ]
        var urlCompononents = URLComponents(string: "https://api.nasa.gov/planetary/apod")!
        urlCompononents.queryItems = queryItems.map{URLQueryItem(name: $0.key, value: $0.value)}

        let (data, response) = try await URLSession.shared.data(from: urlCompononents.url!)
        
        let jsonDecoder = JSONDecoder()
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw PhotoInfoError.itemNotFound
        }
        
        guard let photoInfoJSON = try? jsonDecoder.decode(PhotoInfo.self, from: data) else {
            throw PhotoInfoError.parsingError
        }
        return photoInfoJSON
        
    }
    
    func fetchImage(from photoInfo : PhotoInfo) async throws -> UIImage {
        
    }
}
