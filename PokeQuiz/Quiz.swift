//
//  Quiz.swift
//  PokeQuiz
//
//  Created by Евгений Бердашкевич on 15.08.17.
//  Copyright © 2017 Alexander Ganzer. All rights reserved.
//

import UIKit
import SQLite



class QuizItem{
    
    var key:String
    var image:UIImage
    var attempt:Int = 1
    var id:Int?
    var gen:Int = 1
    
    init(key:String,image:UIImage) {
        self.key = key
        self.image = image
        getDbRow()
    }
    init(id:Int){
       self.id = id
       self.key = ""
       self.image = UIImage()
       getDbRowById()
    }

    
    private func strUpLenghts(str:String)->String{
        var tmpStr = str
        if(tmpStr.characters.count<14){
            tmpStr+=generateRandom()
            tmpStr = strUpLenghts(str: tmpStr)
        }
        return tmpStr
    }
    private func getDbRowById(){
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        do {
            let db = try Connection("\(path)/pokeQuiz.sqlite")
            let id = Expression<Int64>("id")
            let name = Expression<String>("name")
            let image = Expression<SQLite.Blob>("image")
            let data = Table("pokeData")
            let query = data.filter(id == Int64(self.id!))
            if let item = try db.pluck(query) {
                self.key = item[name]
                self.image = UIImage(data:  Data.fromDatatypeValue(item[image]))!
            }
        }catch{
            print(error)
        }
    }
    
    private func getDbRow(){
        self.id = getNextId()
        if(id != -1){
            let path = NSSearchPathForDirectoriesInDomains(
                .documentDirectory, .userDomainMask, true
                ).first!
            do {
                let db = try Connection("\(path)/pokeQuiz.sqlite")
                let id = Expression<Int64>("id")
                let name = Expression<String>("name")
                let image = Expression<SQLite.Blob>("image")
                let data = Table("pokeData")
                let query = data.filter(id == Int64(self.id!))
                if let item = try db.pluck(query) {
                    self.key = item[name]
                    self.image = UIImage(data:  Data.fromDatatypeValue(item[image]))!
                }
            }catch{
                print(error)
            }

        }
}
    
    public func updateCurAsViewed(){
        if let itemId = self.id {
            let path = NSSearchPathForDirectoriesInDomains(
                .documentDirectory, .userDomainMask, true
                ).first!
            do {
                let db = try Connection("\(path)/pokeQuiz.sqlite")
                let id = Expression<Int64>("id")
                let visited = Expression<Bool>("visited")
                let data = Table("pokeData")
                let query = data.filter(id == Int64(itemId))
                try db.run(query.update(visited <- true))
            }catch{
                print(error)
            }
        }
    }
    public func getNextId()->Int{
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        do {
            let db = try Connection("\(path)/pokeQuiz.sqlite")
            let id = Expression<Int64>("id")
            let visited = Expression<Bool>("visited")
            let data = Table("pokeData")
            let query = data.select(id).filter(!visited)
            let all = Array(try db.prepare(query))
            if (all.count > 0){
                return Int(all[Int(arc4random_uniform(UInt32(all.count)))][id])
            }else{
                return -1
            }
        }catch{
            print(error)
        }
        return -1
    }
    
    public func generateArray()->[Character]{
        return Array(strUpLenghts(str: key).characters)
    }
    
    private func generateRandom()->String{
        let charcode:Int = Int(arc4random_uniform(26) + 97)
        let us:UnicodeScalar = UnicodeScalar.init(charcode)!
        let char:Character = Character.init(us)
        return String(char)
    }
    
    public func imageShadow() -> UIImage? {
        let startImage = CIImage(image:image)
        if let filter = CIFilter(name: "CIFalseColor") {
            filter.setValue(startImage, forKey: kCIInputImageKey)
            filter.setValue(CIColor.black(), forKey: "inputColor0")
            filter.setValue(CIColor.black(), forKey: "inputColor1")
            let newImage = UIImage(ciImage: filter.outputImage!)
            return newImage
        }
        return nil
    }
}
extension Array {
    mutating func shuffle () {
        for i in (0..<self.count).reversed() {
            let ix1 = i
            let ix2 = Int(arc4random_uniform(UInt32(i+1)))
            (self[ix1], self[ix2]) = (self[ix2], self[ix1])
        }
    }
}
