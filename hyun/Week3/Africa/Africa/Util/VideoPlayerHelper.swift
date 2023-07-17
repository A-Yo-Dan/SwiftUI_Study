//
//  VideoPlayerHelper.swift
//  Africa
//
//  Created by 정현우 on 2023/07/16.
//

import Foundation
import AVKit

var videoPlayer: AVPlayer?

func playVideo(fileName: String, fileFormat: String) -> AVPlayer {
	if let url = Bundle.main.url(forResource: fileName, withExtension: fileFormat) {
		videoPlayer = AVPlayer(url: url)
		videoPlayer?.play()
	}
	
	return videoPlayer!
}
