//
//  Mood.swift
//  Vipassana
//
//  Created by Dasha Chastokolenko on 7/4/19.
//  Copyright © 2019 Dasha Chastokolenko. All rights reserved.
//

import Foundation
import RealmSwift

class Mood: Object {
    
    @objc dynamic var moodValue : Int = 0
    @objc dynamic var dateRated = Date()
    
    //var userName = LinkingObjects(fromType: UserData.self, property: "name")
}
