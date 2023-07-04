//
//  AudioPlayer.swift
//  Restart
//
//  Created by YOUJIM on 2023/07/04.
//

import Foundation
import AVFoundation

// 시계열을 기반으로 한 시청각 미디어를 다룰 수 있는 프레임워크
// iOS, MacOS, WatchOS, TVOS에서 사용 가능

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Could not play the sound file.")
        }
    }
}
