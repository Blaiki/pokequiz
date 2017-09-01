//
//  Stat.swift
//  PokeQuiz
//
//  Created by Евгений Бердашкевич on 01.09.17.
//  Copyright © 2017 Alexander Ganzer. All rights reserved.
//

import SQLite

struct statData{
    var gen:Int
    var team:String
    var right:Int
    var wrong:Int
}

class Stat {
    
    static func initialize(team:String){
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        let dbName = "pokeQuiz.sqlite"
        let tableName = "statistic"
        do {
            let db = try Connection("\(path)/\(dbName)")
            let name = Expression<String>("team")
            let generation = Expression<Int64>("generation")
            let table = Table(tableName)
            for gen in 1...7{
                try db.run(table.insert(or: .replace, name <- team, generation <- Int64(gen)))
            }
        }catch{
            print(error)
        }
    }
    static func addRight(gen:Int){
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        let dbName = "pokeQuiz.sqlite"
        let tableName = "statistic"
        do {
            let db = try Connection("\(path)/\(dbName)")
            let generation = Expression<Int64>("generation")
            let right =  Expression<Int64>("right")
            let table = Table(tableName)
            let query = table.filter(generation == Int64(gen))
            try db.run(query.update(right += 1))

        }catch{
            print(error)
        }
    }
    static func addWrong(gen:Int){
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        let dbName = "pokeQuiz.sqlite"
        let tableName = "statistic"
        do {
            let db = try Connection("\(path)/\(dbName)")
            let generation = Expression<Int64>("generation")
            let wrong =  Expression<Int64>("wrong")
            let table = Table(tableName)
            let query = table.filter(generation == Int64(gen))
            try db.run(query.update(wrong += 1))
            
        }catch{
            print(error)
        }
    }
    static func getStatistic(gen:Int)->statData{
        let path = NSSearchPathForDirectoriesInDomains(
            .documentDirectory, .userDomainMask, true
            ).first!
        let dbName = "pokeQuiz.sqlite"
        let tableName = "statistic"
        var data:statData = statData(gen: 0, team: "", right: 0, wrong: 0)
        do {
            let db = try Connection("\(path)/\(dbName)")
            let generation = Expression<Int64>("generation")
            let wrong =  Expression<Int64>("wrong")
            let right =  Expression<Int64>("right")
            let team =  Expression<String>("team")
            let table = Table(tableName)
            let query = table.filter(generation == Int64(gen))
            if let item = try db.pluck(query){
                data.gen = gen
                data.team = item[team]
                data.right = Int(item[right])
                data.wrong = Int(item[wrong])
            }
        }catch{
            print(error)
        }
        return data
    }
}
