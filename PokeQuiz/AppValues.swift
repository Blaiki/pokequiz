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

}

class AppValues: NSObject, NSCoding{
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("app")
    
    var team:String = "name"
    init(team:String) {
        self.team = team
        super.init()
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(team, forKey: AppProps.team)
    }
    required convenience init?(coder aDecoder: NSCoder) {
        guard let team = aDecoder.decodeObject(forKey: AppProps.team) as? String else {
            return nil
        }
        self.init(team: team)
    }
}

class AppLoader{
    var appData:AppValues?
    init(){
        appData = nil
    }
    init(team:String) {
        appData = AppValues(team:team)
    }
    func saveTeam() {
        _ = NSKeyedArchiver.archiveRootObject(appData ?? AppValues(team:"default"), toFile: AppValues.ArchiveURL.path)
    }
    func loadTeam () -> AppValues? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: AppValues.ArchiveURL.path) as? AppValues
    }
}
