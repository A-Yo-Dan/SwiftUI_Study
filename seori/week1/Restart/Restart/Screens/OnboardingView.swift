//
//  OnboardingView.swift
//  Restart
//
//  Created by 서은수 on 2023/07/01.
//

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTY
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80 // FOOTER의 버튼 가로 길이
    @State private var buttonOffset: CGFloat = 0 // 동그란 버튼 가로 offset값
    @State private var isAnimating: Bool = false // 애니메이션 on/off 여부
    @State private var imageOffset: CGSize = .zero // CGSize(width: 0, height: 0)와 동일
    @State private var indicatorOpacity: Double = 1.0 // 하단의 양옆 화살표 모양 인티케이터의 불투명도
    @State private var textTitle: String = "Share."
    
    let hapticFeedback = UINotificationFeedbackGenerator()
    
    // MARK: - BODY
    
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            VStack(spacing: 20) {
                // MARK: - HEADER
                Spacer()
                
                VStack() {
                    Text(textTitle)
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .transition(.opacity) // 삽입 시 투명에서 불투명으로 전환되고 제거 시 불투명에서 투명으로 전환됨
                        .id(textTitle) // id 변경 -> 이것은 새로운 텍스트 뷰라고 알린다 -> transition이 트리거 됨
                    
                    Text("""
                    It's not how much we give but
                    how much love we put into giving.
                    """)
                    .font(.title3) // 폰트 설정
                    .fontWeight(.light) // 두께 설정
                    .foregroundColor(.white) // 색 설정
                    .multilineTextAlignment(.center) // 여러 줄 중앙 정렬
                    .padding(.horizontal, 10) // 수평 방향으로 10씩 패딩 추가
                } //: HEADER
                .opacity(isAnimating ? 1 : 0) // 투명에서 불투명하게
                .offset(y: isAnimating ? 0 : -40) // 위(y: -40)에 있다가 아래로(y: 0) 내려오도록
                // value의 값이 변할 때 주어진 애니메이션을 뷰에 적용한다
                .animation(.easeOut(duration: 1), value: isAnimating)
                
                // MARK: - CENTER
                
                ZStack {
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                        .offset(x: imageOffset.width * -1) // 이미지의 Offset과는 반대 방향으로 이동
                        .blur(radius: abs(imageOffset.width / 5)) // 이미지의 offset.width가 클수록 블러도 많이 들어감
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: isAnimating)
                        .offset(x: imageOffset.width * 1.2, y: 0)
                        .rotationEffect(.degrees(Double(imageOffset.width / 20)))
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    // left-right drag limitation
                                    if abs(imageOffset.width) <= 150 { // 왼쪽으로 드래그 하면 imageOffset 값이 음수가 되기 때문에 abs 함수로 절대값 처리
                                        imageOffset = gesture.translation // translation의 값이 CGSize 타입
                                        
                                        withAnimation(.linear(duration: 0.25)) {
                                            indicatorOpacity = 0 // 드래그 할 때마다 화살표 이모지 투명하게
                                            textTitle = "Give." // 드래그 할 때마다 텍스트 변경
                                        }
                                    }
                                }
                                .onEnded { _ in
                                    imageOffset = .zero
                                    
                                    withAnimation(.linear(duration: 0.25)) {
                                        indicatorOpacity = 1 // 드래그 끝나면 화살표 이모지 불투명하게
                                        textTitle = "Share." // 드래그 끝나면 원래 텍스트로
                                    }
                                }
                        ) //: GESTURE
                        .animation(.easeOut(duration: 1), value: imageOffset)
                } //: CENTER
                .overlay ( // CENTER 위에 중첩, 하단에 정렬
                    // indicator 추가
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 44, weight: .ultraLight))
                        .foregroundColor(.white)
                        .offset(y: 20)
                        .opacity(isAnimating ? 1 : 0)
                        // 2초 뒤에 애니메이션 시작 -> 윗 줄의 코드로 인해 처음에 opacity가 0이라 안 보임
                        .animation(.easeOut(duration: 1).delay(2), value: isAnimating)
                        .opacity(indicatorOpacity) // 똑같은 modifier 또 사용 가능 둘 다 영향을 받게 되는 듯
                    , alignment: .bottom)
                
                Spacer()
                
                // MARK: - FOOTER
                
                ZStack {
                    // Part of the custom button
                    
                    // 1. BACKGROUND (Static)
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    
                    // 2. Call-to-action (Static)
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    // 3. Capsule (Dynamic width)
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffset + 80)
                        Spacer()
                    }
                    // 4. Circle (Draggable)
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color("ColorRed"))
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in // Action Closure - gesture parameter
                                    // gesture 값 : 실제 움직임에 대한 정보를 제공
                                    // gesture 값이 바뀔 때마다 이 action이 트리거된다
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                        buttonOffset = gesture.translation.width
                                    }
                                }
                                .onEnded { _ in // 드래그가 끝났을 때 실행됨
                                    // 수평 방향으로 절반 이상까지 드래그 했으면 버튼을 맨 오른쪽으로 이동시키고 Home 화면으로 이동
                                    if buttonOffset > buttonWidth / 2 {
                                        // 유저에게 success 햅틱 피드백 제공
                                        hapticFeedback.notificationOccurred(.success)
                                        // 사운드 재생
                                        playSound(sound: "chimeup", type: "mp3")
                                        buttonOffset = buttonWidth - 80
                                        isOnboardingViewActive = false
                                    } else { // 절반 이하면 버튼을 맨 왼쪽으로 이동시킴
                                        // 유저에게 warning 햅틱 피드백 제공
                                        hapticFeedback.notificationOccurred(.warning)
                                        buttonOffset = 0
                                    }
                                }
                        ) //: GESTURE
                        
                        Spacer()
                    } //: HSTACK
                } //: FOOTER
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(isAnimating ? 1 : 0) // 투명했다가 불투명하게
                .offset(y: isAnimating ? 0 : 40) // y가 40이었다가(더 아래에 있다가) appear 되면 0으로 올라오는 효과
                .animation(.easeOut(duration: 1), value: isAnimating) // 빨랐다가 끝날 때가 될수록 느려지는 애니메이션을 1초 동안 실행. isAnimating이 변화할 때
            } //: VSTACK
        } //: ZSTACK - 제일 바깥에 있는 ZStack
        .onAppear {
            isAnimating = true
        }
        .preferredColorScheme(.dark) // 이 뷰는 dark 모드로 보여줘!
    }
}

// MARK: - PREVIEW

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
