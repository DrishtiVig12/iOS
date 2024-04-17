import UIKit
import Foundation

struct Student : Codable {
    let name : String
    let rollNum : String
    let admDate : Date
}

let firstStudent = Student(name: "Ashu", rollNum: "542", admDate: Date())
let secondStudent = Student(name: "dooDoo", rollNum: "476", admDate: Date())

let students = [firstStudent,secondStudent]

let propertyListEncoder = PropertyListEncoder()
let propertyListDecoder = PropertyListDecoder()

//if let encodedData = try? propertyListEncoder.encode(firstStudent){
//    print(encodedData)
//   
//    
//    if let decodedData = try? propertyListDecoder.decode(Student.self, from: encodedData){
//        print(decodedData)
//    }
//}

//let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first

let archiveURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("student_list").appendingPathExtension("plist")


let encodedData = try? propertyListEncoder.encode(students)
try? encodedData?.write(to: archiveURL!, options: .noFileProtection)

if let retrivedData = try? Data(contentsOf: archiveURL!),
   let decodedData = try? propertyListDecoder.decode(Array<Student>.self, from: retrivedData){
    print(decodedData)
}


