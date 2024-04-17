import UIKit

struct Track: CustomStringConvertible,Comparable {
    static func < (lhs: Track, rhs: Track) -> Bool {
        lhs.trackNumber < rhs.trackNumber
    }
    
    var description: String {
        "Track number : \(trackNumber) and star rating is \(starRating)"
    }
    
    var trackNumber : Int
    var starRating : Int
}


var tracks  = [Track(trackNumber: 4, starRating: 6), Track(trackNumber: 2, starRating: 9), Track(trackNumber: 1, starRating: 10)]


var sortedTracks = tracks.sorted(by: {
    $0.trackNumber < $1.trackNumber
})

var newSortedTrack = tracks.sorted { $0.trackNumber < $1.trackNumber }
newSortedTrack = tracks.sorted(by: <)

print(sortedTracks)
print(newSortedTrack)

var firstNames = ["Amar", "Akbar", "Anthony"]

var fullNames = firstNames.map {"\($0) Smith"}

print(firstNames)
print(fullNames)


let numbers = [1, 4, 8, 16, 30, 19, 59]

let numbersLessthan20 = numbers.filter({(number)-> Bool in
    return number < 20
})

print(numbersLessthan20)

let reducedNumbers = numbers.reduce(0, {$0 + $1})

print(reducedNumbers)
