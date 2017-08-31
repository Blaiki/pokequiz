//
//  AppValues.swift
//  PokeQuiz
//
//  Created by Евгений Бердашкевич on 15.08.17.
//  Copyright © 2017 Alexander Ganzer. All rights reserved.
//

import Foundation

struct AppProps {
    static let team = "team"
    static let id = "id"
    static let bank = "bank"

}

class AppValues: NSObject, NSCoding{
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("app")
    
    var team:String = "name"
    var id:Int = -1
    var bank:Int = 0
    
    init(team:String,id:Int,bank:Int) {
        self.team = team
        self.id = id
        self.bank = bank
        super.init()
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(team, forKey: AppProps.team)
        aCoder.encode(id, forKey: AppProps.id)
        aCoder.encode(bank, forKey: AppProps.bank)
    }
    required convenience init?(coder aDecoder: NSCoder) {
        guard let team = aDecoder.decodeObject(forKey: AppProps.team) as? String else {
            return nil
        }
        guard let id = aDecoder.decodeObject(forKey: AppProps.id) as? Int else {
            return nil
        }
        guard let bank = aDecoder.decodeObject(forKey: AppProps.bank) as? Int else {
            return nil
        }
        self.init(team: team,id:id,bank:bank)
    }
}

class AppLoader{
    init(){
    }
    func saveTeam(appData:AppValues?) {
        _ = NSKeyedArchiver.archiveRootObject(appData ?? AppValues(team:"default",id:-1,bank:0), toFile: AppValues.ArchiveURL.path)
    }
//    func saveData(data:AppValues,id:Int){
//        appData = data
//        appData!.id = id
//        _ = NSKeyedArchiver.archiveRootObject(appData ?? AppValues(team:"default",id:-1,bank:0), toFile: AppValues.ArchiveURL.path)
//    }
    func loadData () -> AppValues? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: AppValues.ArchiveURL.path) as? AppValues
    }
}
