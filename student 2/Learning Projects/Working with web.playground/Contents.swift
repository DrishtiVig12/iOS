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

enum PhotoInfoError : Error, LocalizedError {
    case itemNotFound
    case parsingError
}

func fetchData() async throws -> PhotoInfo {
    
    var queryItems = [
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

Task{
    do{
        let photoInfo : PhotoInfo = try await fetchData()
        print("Data fetched sucessfully")
        print(photoInfo)
    }catch{
        print("Data cannot be fetched : \(error)")
    }
}
