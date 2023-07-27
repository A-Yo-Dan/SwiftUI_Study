//
//  ContentView.swift
//  Honeymoon
//
//  Created by 서은수 on 2023/07/25.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - Properties
    
    @State var showAlert: Bool = false
    @State var showGuide: Bool = false
    @State var showInfo: Bool = false
    @GestureState private var dragState = DragState.inactive
    private var dragAreaThreshold: CGFloat = 65.0
    @State private var lastCardIndex: Int = 1
    @State private var cardRemovalTransition = AnyTransition.trailingBottom
    
    // MARK: - Card Views
    
    @State var cardViews: [CardView] = {
        var views = [CardView]()
        for index in 0...1 {
            views.append(CardView(honeymoon: honeymoonData[index]))
        }
        return views
        // cardViews 선언 시 배열에 내용을 채워서 생성함
    }()
    
    // MARK: - Move the card
    
    private func moveCards() {
        cardViews.removeFirst() // 맨위의 카드 제거
        
        self.lastCardIndex += 1 // 범위 1칸 증가
        
        // 맨 위의 카드가 없어지면서 원래 배열에 없던 범위(lastCardIndex)의 카드가 새로 추가됨
        // 전체 데이터 개수로 나눔으로써 전체 데이터 개수 이상이 되면 인덱스 0부터 다시 추가
        let newCard = CardView(honeymoon: honeymoonData[lastCardIndex % honeymoonData.count])
        
        cardViews.append(newCard)
    }
    
    // MARK: - Top Card
    
    // 인자로 들어간 카드뷰가 첫번째 카드가 맞는지 아닌지
    private func isTopCard(cardView: CardView) -> Bool {
        guard let index = cardViews.firstIndex(where: { $0.id == cardView.id }) else {
            return false
        }
        return index == 0 // 첫번째 인덱스가 0이 맞으면 True
    }
    
    // MARK: - Drag State
    
    enum DragState {
        case inactive
        case pressing
        case dragging(translation: CGSize)
        
        var translation: CGSize {
            switch self {
            case .inactive, .pressing:
                return .zero
            case .dragging(let translation):
                return translation
            }
        }
        
        var isDragging: Bool {
            switch self {
            case .dragging:
                return true
            case .inactive, .pressing:
                return false
            }
        }
        
        var isPressing: Bool {
            switch self {
            case .pressing, .dragging:
                return true
            case .inactive:
                return false
            }
        }
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack {
            // MARK: - Header
            
            HeaderView(showGuideView: $showGuide, showInfoView: $showInfo)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default)
            
            Spacer()
            
            // MARK: - Cards
            
            ZStack {
                ForEach(cardViews) { cardView in
                    cardView
                        .zIndex(self.isTopCard(cardView: cardView) ? 1 : 0)
                        // 첫번째 카드가 맞으면 zIndex 1로 해서 위로 올리기
                        // 첫번째 카드가 아니면 zIndex 0으로 해서 아래로 내리기
                        .overlay(
                            ZStack {
                                // LEFT
                                // X-mark Symbol
                                Image(systemName: "xmark.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(self.dragState.translation.width < -self.dragAreaThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                                
                                // RIGHT
                                // Heart Symbol
                                Image(systemName: "heart.circle")
                                    .modifier(SymbolModifier())
                                    .opacity(self.dragState.translation.width > self.dragAreaThreshold && self.isTopCard(cardView: cardView) ? 1.0 : 0.0)
                            }
                        )
                        .offset(x: self.isTopCard(cardView: cardView) ? self.dragState.translation.width : 0, y: self.isTopCard(cardView: cardView) ? self.dragState.translation.height : 0)
                        .scaleEffect(self.dragState.isDragging && self.isTopCard(cardView: cardView) ? 0.85 : 1.0) // .animation 위에 적어야 animation이 적용됨!
                        .rotationEffect(Angle(degrees: self.isTopCard(cardView: cardView) ? self.dragState.translation.width / 12 : 0.0))
                        .animation(.interpolatingSpring(stiffness: 120, damping: 120))
                        .gesture( // 길게 누르는 제스처를 감지하도록 설정
                            LongPressGesture(minimumDuration: 0.01)
                                .sequenced(before: DragGesture())
                                .updating(self.$dragState, body: { (value, state, transaction) in
                                    print("THIS1", value, state)
                                    switch value {
                                    case .first(true):
                                        state = .pressing
                                        print("THIS2", value, state)
                                    case .second(true, let drag):
                                        state = .dragging(translation: drag?.translation ?? .zero) // 드래그 된 만큼 값 업데이트
                                        print("THIS3", value, state)
                                    default:
                                        break
                                    }
                                })
                                .onChanged({ value in
                                    guard case .second(true, let drag?) = value else {
                                        return
                                    }
                                    
                                    // 방향에 맞는 removal transition을 설정
                                    if drag.translation.width < -self.dragAreaThreshold {
                                        self.cardRemovalTransition = AnyTransition.leadingBottom // 왼쪽 아래 방향으로 remove
                                    }
                                    if drag.translation.width > self.dragAreaThreshold {
                                        self.cardRemovalTransition = AnyTransition.trailingBottom // 오른쪽 아래 방향으로 remove
                                    }
                                })
                                // 제스처가 끝났을 때 실행
                                .onEnded({ value in
                                    guard case .second(true, let drag?) = value else {
                                        return
                                    }
                                    
                                    // 범위 넘어가면 카드 넘기기
                                    if drag.translation.width < -self.dragAreaThreshold || drag.translation.width > self.dragAreaThreshold {
                                        playSound(sound: "sound-rise", type: "mp3")
                                        self.moveCards()
                                    }
                                })
                        )
                        .transition(self.cardRemovalTransition)
                }
            }
            .padding(.horizontal)
            
            Spacer()
            
            // MARK: - Footer
            
            FooterView(showBookingAlert: $showAlert)
                .opacity(dragState.isDragging ? 0.0 : 1.0)
                .animation(.default)
        }
        .alert(isPresented: $showAlert) {
            Alert(title: Text("SUCCESS"),
                  message: Text("Wishing a lovely and most precious of the times together for the amazing couple"),
                  dismissButton: .default(Text("Happy Honeymoon!"))
            )
        }
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
