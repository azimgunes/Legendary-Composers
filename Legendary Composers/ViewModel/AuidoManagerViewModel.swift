//
//  AuidoManagerViewModel.swift
//  Legendary Composers
//
//  Created by Azim Güneş on 4.03.2024.
//

import Foundation
import AVKit


class AuidoManagerViewModel {
    
    private var compositionAudioPlayer: AVAudioPlayer?
    
    func play (_ composer: Composer){
        if composer.isPlaying {
            compositionAudioPlayer?.stop()
        } else {
            guard let path = Bundle.main.path(forResource: "\(composer.id.compositionsFile).mp3", ofType: nil) else {
                return
            }
            let url = URL(fileURLWithPath: path)
            do {
                compositionAudioPlayer = try AVAudioPlayer(contentsOf: url)
                compositionAudioPlayer?.numberOfLoops = -1
                compositionAudioPlayer?.play()
            }catch{
                print(error)
            }
        }
        
    }
}
