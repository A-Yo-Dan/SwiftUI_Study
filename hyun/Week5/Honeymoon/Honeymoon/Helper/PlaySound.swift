//
//  PlaySound.swift
//  Honeymoon
//
//  Created by 정현우 on 2023/07/30.
//

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound: String, type: String) {
	if let path = Bundle.main.path(forResource: sound, ofType: type) {
		do {
			audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
			audioPlayer?.play()
		} catch {
			print("ERROR: Could not find and play the sound file!")
		}
	}
}

