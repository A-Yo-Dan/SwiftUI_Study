//
//  PlaySound.swift
//  Learn by Doing
//
//  Created by 정현우 on 2023/08/03.
//

import Foundation
import AVFoundation

var audioPlayer: AVAudioPlayer?

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
