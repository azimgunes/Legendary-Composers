//
//  Composer.swift
//  Legendary Composers
//
//  Created by Azim Güneş on 29.02.2024.
//

import Foundation

struct Composer {
    let id: ComposerType
    let name: String
    let info: String
    let death: Death
    let birthday: Int
    var isPlaying : Bool = false
}
