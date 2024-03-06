//
//  Composer.swift
//  Legendary Composers
//
//  Created by Azim Güneş on 29.02.2024.
//

import Foundation

class Composer {
    let id: ComposerType
    let name: String
    let info: String
    let death: Death
    let birthday: Int
    var isPlaying : Bool = false

    
    internal init(id: ComposerType, name: String, info: String, death: Death, birthday: Int, isPlaying: Bool = false) {
        self.id = id
        self.name = name
        self.info = info
        self.death = death
        self.birthday = birthday
        self.isPlaying = isPlaying
 
    }
    
}
