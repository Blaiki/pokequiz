//
//  Quiz.swift
//  PokeQuiz
//
//  Created by Евгений Бердашкевич on 15.08.17.
//  Copyright © 2017 Alexander Ganzer. All rights reserved.
//

import UIKit
import os.log

struct PropertyKey {
    static let name = "name"
    static let image = "image"
    static let attempt = "attempt"
}

class QuizItem: NSObject, NSCoding{
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("quiz")
    
    var name: String
    var image: UIImage
    var attempt: Int = 0
    init(name:String,image:UIImage,attempt: Int) {
        self.image = image
        self.name = name
        self.attempt = attempt
        super.init()
    }
    func test()->String{
        return "JUST A TEST FUNC"
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(image, forKey: PropertyKey.image)
        aCoder.encode(attempt, forKey: PropertyKey.attempt)
    }
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            return nil
        }
        guard let image = aDecoder.decodeObject(forKey: PropertyKey.image) as? UIImage else {
            return nil
        }
        guard let attempt = aDecoder.decodeObject(forKey: PropertyKey.attempt) as? Int else {
            return nil
        }
        self.init(name: name, image: image,attempt:attempt)
    }
}
