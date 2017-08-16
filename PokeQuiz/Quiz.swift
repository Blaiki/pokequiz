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
}

class Quiz: NSObject, NSCoding{
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("quiz")
    
    var name:String = "name"
    var image: UIImage
    init(name:String,image:UIImage) {
        self.image = image
        self.name = name
        super.init()
    }
    func test(){
        return "JUST A TEST FUNC"
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(image, forKey: PropertyKey.image)
    }
    required convenience init?(coder aDecoder: NSCoder) {
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Meal object.", log: OSLog.default, type: .debug)
            return nil
        }
        let image = aDecoder.decodeObject(forKey: PropertyKey.image) as? UIImage
        self.init(name: name, image: image!)
    }
}
