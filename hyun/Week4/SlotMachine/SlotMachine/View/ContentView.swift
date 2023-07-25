//
//  ContentView.swift
//  SlotMachine
//
//  Created by 정현우 on 2023/07/25.
//

import SwiftUI

struct ContentView: View {
	// MARK: - Property
	let symbols = ["gfx-bell", "gfx-cherry", "gfx-coin", "gfx-grape", "gfx-seven", "gfx-strawberry"]
	let haptics = UINotificationFeedbackGenerator()
	
	@State private var highscore: Int = UserDefaults.standard.integer(forKey: "HighScore")
	@State private var coins: Int = 100
	@State private var betAmount: Int = 10
	@State private var reels: [Int] = [0, 1, 2]
	@State private var showingInfoView: Bool = false
	@State private var isActiveBet10: Bool = true
	@State private var isActiveBet20: Bool = false
	@State private var showingModal: Bool = false
	@State private var animatingSymbol: Bool = false
	@State private var animatingModal: Bool = false
	
	
	// MARK: - Function
	func spinReels() {
		reels = reels.map { _ in Int.random(in: 0...symbols.count - 1)}
		playSound(sound: "spin", type: "mp3")
		haptics.notificationOccurred(.success)
	}
	
	func checkWinning() {
		if reels[0] == reels[1] && reels[1] == reels[2] && reels[0] == reels[2] {
			playerWins()
			if coins > highscore {
				newHighscore()
			} else {
				playSound(sound: "win", type: "mp3")
			}
		} else {
			playerLoses()
		}
	}
	
	func playerWins() {
		coins += betAmount * 10
	}
	
	func newHighscore() {
		highscore = coins
		UserDefaults.standard.set(highscore, forKey: "HighScore")
		playSound(sound: "high-score", type: "mp3")
	}
	
	func playerLoses() {
		coins -= betAmount
	}
	
	func activateBet20() {
		betAmount = 20
		isActiveBet20 = true
		isActiveBet10 = false
		playSound(sound: "casino-chips", type: "mp3")
		haptics.notificationOccurred(.success)
	}
	
	func activateBet10() {
		betAmount = 10
		isActiveBet10 = true
		isActiveBet20 = false
		playSound(sound: "casino-chips", type: "mp3")
		haptics.notificationOccurred(.success)
	}
	
	func isGameOver() {
		if coins <= 0 {
			showingModal = true
			playSound(sound: "game-over", type: "mp3")
		}
	}
	
	func resetGame() {
		UserDefaults.standard.set(0, forKey: "HighScore")
		highscore = 0
		coins = 100
		activateBet10()
		playSound(sound: "chimeup", type: "mp3")
	}
	
	// MARK: - Body
	var body: some View {
		ZStack {
			// MARK: - Background
			LinearGradient(gradient:
							Gradient(colors: [Color("ColorPink"), Color("ColorPurple")]),
						   startPoint: .top,
						   endPoint: .bottom
			)
			.edgesIgnoringSafeArea(.all)
			
			// MARK: - Interface
			VStack(alignment: .center, spacing: 5) {
				// MARK: - Header
				LogoView()
				
				Spacer()
				// MARK: - Score
				HStack {
					HStack {
						Text("Your\nCoins".uppercased())
							.scoreLabelStyle()
							.multilineTextAlignment(.trailing)
						
						Text("\(coins)")
							.scoreNumberStyle()
							.scoreNumberModifier()
					}
					.scoreContainerModifier()
					
					Spacer()
					
					HStack {
						Text("\(highscore)")
							.scoreNumberStyle()
							.scoreNumberModifier()
						
						Text("High\nScore".uppercased())
							.scoreLabelStyle()
							.multilineTextAlignment(.leading)
					}
					.scoreContainerModifier()
				}
				
				// MARK: - Slot Machine
				VStack(alignment: .center, spacing: 0) {
					// MARK: - Reel #1
					ZStack {
						ReelView()
						Image(symbols[reels[0]])
							.resizable()
							.imageModifier()
							.opacity(animatingSymbol ? 1 : 0)
							.offset(y: animatingSymbol ? 0 : -50)
							.animation(.easeOut(duration: Double.random(in: 0.5...0.7)), value: animatingSymbol)
							.onAppear {
								self.animatingSymbol.toggle()
								playSound(sound: "riseup", type: "mp3")
							}
					}
					
					HStack(alignment: .center, spacing: 0) {
						// MARK: - Reel #2
						ZStack {
							ReelView()
							Image(symbols[reels[1]])
								.resizable()
								.imageModifier()
								.opacity(animatingSymbol ? 1 : 0)
								.offset(y: animatingSymbol ? 0 : -50)
								.animation(.easeOut(duration: Double.random(in: 0.7...0.9)), value: animatingSymbol)
								.onAppear {
									self.animatingSymbol.toggle()
								}
						}
						Spacer()
						// MARK: - Reel #3
						ZStack {
							ReelView()
							Image(symbols[reels[2]])
								.resizable()
								.imageModifier()
								.opacity(animatingSymbol ? 1 : 0)
								.offset(y: animatingSymbol ? 0 : -50)
								.animation(.easeOut(duration: Double.random(in: 0.9...1.1)), value: animatingSymbol)
								.onAppear {
									self.animatingSymbol.toggle()
								}
						}
					} //: Reel 2개 HStack
					.frame(maxWidth: 500)
					
					// MARK: - Spin Button
					Button(action: {
						withAnimation {
							self.animatingSymbol = false
						}
						
						self.spinReels()
						
						withAnimation {
							self.animatingSymbol = true
						}
						
						self.checkWinning()
						self.isGameOver()
					}, label: {
						Image("gfx-spin")
							.renderingMode(.original)
							.resizable()
							.imageModifier()
					})
					
				} //: Slot Machine
				.layoutPriority(2)
				
				// MARK: - Footer
				Spacer()
				
				HStack {
					// MARK: - Bet 20
					HStack(alignment: .center, spacing: 10) {
						Button(action: {
							self.activateBet20()
						}, label: {
							Text("20")
								.fontWeight(.heavy)
								.foregroundColor(isActiveBet20 ? Color("ColorYellow"): Color.white)
								.betNumberModifier()
						})
						.betCapsuleModifier()
						
						Image("gfx-casino-chips")
							.resizable()
							.offset(x: isActiveBet20 ? 0 : 20)
							.opacity(isActiveBet20 ? 1 : 0)
							.animation(.default, value: isActiveBet20)
							.casinoChipsModifier()
					}
					
					Spacer()
					
					// MARK: - Bet 10
					HStack(alignment: .center, spacing: 10) {
						Image("gfx-casino-chips")
							.resizable()
							.offset(x: isActiveBet10 ? 0 : -20)
							.opacity(isActiveBet10 ? 1 : 0)
							.animation(.default, value: isActiveBet10)
							.casinoChipsModifier()
						
						Button(action: {
							self.activateBet10()
						}, label: {
							Text("10")
								.fontWeight(.heavy)
								.foregroundColor(isActiveBet10 ? Color("ColorYellow"): Color.white)
								.betNumberModifier()
						})
						.betCapsuleModifier()
						
						
					}
				}
				
				Spacer()
				
			} // VStack - Interface
			.overlay(alignment: .topLeading, content: {
				// Reset
				Button(action: {
					self.resetGame()
				}, label: {
					Image(systemName: "arrow.2.circlepath.circle")
				})
				.buttonModifier()
			})
			.overlay(alignment: .topTrailing, content: {
				// Info
				Button(action: {
					self.showingInfoView = true
				}, label: {
					Image(systemName: "info.circle")
				})
				.buttonModifier()
			})
			
			.padding()
			.frame(maxWidth: 720)
			.blur(radius: $showingModal.wrappedValue ? 5 : 0, opaque: false)
			
			// MARK: - Popup
			
			if $showingModal.wrappedValue {
				ZStack {
					Color("ColorTransparnetBlack").edgesIgnoringSafeArea(.all)
					VStack(spacing: 0) {
						Text("Game Over")
							.font(.system(.title, design: .rounded))
							.fontWeight(.heavy)
							.padding()
							.frame(minWidth: 0, maxWidth: .infinity)
							.background(Color("ColorPink"))
							.foregroundColor(Color.white)
						
						Spacer()
						
						VStack(alignment: .center, spacing: 16) {
							Image("gfx-seven-reel")
								.resizable()
								.scaledToFit()
								.frame(maxHeight: 72)
							Text("Bad luck! You lost all of the coins. \nLet's play again!")
								.font(.system(.body, design: .rounded))
								.lineLimit(2)
								.multilineTextAlignment(.center)
								.foregroundColor(.gray)
								.layoutPriority(1)
							
							Button(action: {
								self.showingModal = false
								self.animatingModal = false
								self.activateBet10()
								self.coins = 100
							}, label: {
								Text("New Game".uppercased())
									.font(.system(.body, design: .rounded))
									.fontWeight(.semibold)
									.accentColor(Color("ColorPink"))
									.padding(.horizontal, 12)
									.padding(.vertical, 8)
									.frame(minWidth: 128)
									.background(
									  Capsule()
										.strokeBorder(lineWidth: 1.75)
										.foregroundColor(Color("ColorPink"))
									)
							})
						}
						
						Spacer()
					}
					.frame(minWidth: 280, idealWidth: 280, maxWidth: 320, minHeight: 260, idealHeight: 280, maxHeight: 320, alignment: .center)
					.background(Color.white)
					.cornerRadius(20)
					.shadow(color: Color("ColorTransparnetBlack"), radius: 6, x: 0, y: 8)
					.opacity($animatingModal.wrappedValue ? 1 : 0)
					.offset(y: $animatingModal.wrappedValue ? 0 : -100)
					.animation(.spring(response: 0.6, dampingFraction: 1.0, blendDuration: 1.0), value: animatingModal)
					.onAppear {
						self.animatingModal = true
					}
				}
			}
		} //: ZStack
		.sheet(isPresented: $showingInfoView, content: {
			InfoView()
		})
	}
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
