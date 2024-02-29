//
//  Composers.swift
//  Legendary Composers
//
//  Created by Azim Güneş on 28.02.2024.
//

import UIKit

enum ComposerType {
    case beethoven
    case mozart
    case vivaldi
    case chopin
    case schubert
}


extension ComposerType {
    var badge : UIImage {
        switch self {
            
            
        case .beethoven:
            return UIImage(named: "beethoven")!
        case .mozart:
            return UIImage(named: "mozart")!
        case .vivaldi:
            return UIImage(named: "vivaldi")!
        case .chopin:
            return UIImage(named: "chopin")!
        case .schubert:
            return UIImage(named: "schubert")!
        }
    }
    var background : UIColor {
        switch self {
            
        case .beethoven:
            return  UIColor.red
        case .mozart:
            return UIColor.blue
        case .vivaldi:
            return UIColor.yellow
        case .chopin:
            return UIColor.purple
        case .schubert:
            return UIColor.orange
        }
    }
    
    var compositionsFile : String {
        switch self {
            
        case .beethoven:
            return "Moonlight-B"
        case .mozart:
            return "Requiem-M"
        case .vivaldi:
            return "Fourseasons-V"
        case .chopin:
            return "Nocturne-C"
        case .schubert:
            return "Serenade-S"
        }
    }
}



