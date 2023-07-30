//
//  PlaySound.swift
//  Learn-by-Doing
//
//  Created by 서은수 on 2023/07/30.
//

import AVFoundation

// MARK: - Audio Player

var audioPlayer: AVAudioPlayer?

// 어디서든 재사용 가능~
func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Could not find and play the sound file.")
        }
    }
}
