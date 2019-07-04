//
//  UserData.swift
//  Vipassana
//
//  Created by Dasha Chastokolenko on 7/4/19.
//  Copyright © 2019 Dasha Chastokolenko. All rights reserved.
//

import Foundation
import RealmSwift

class UserData: Object {
    
    @objc dynamic var name: String = "" 
    
    let moodValues = List<Mood>()
    
}
