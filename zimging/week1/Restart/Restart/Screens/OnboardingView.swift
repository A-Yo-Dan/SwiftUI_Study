//
//  OnboardingView.swift
//  Restart
//
//  Created by YOUJIM on 2023/07/03.
//

// 모든 애니메이션이 프리뷰에서 작동하는 건 아님

import SwiftUI

struct OnboardingView: View {
    // MARK: - PROPERTY
    
    // 프로그램이 UserDefault에서 onboarding 키를 찾지 못할 때만 true 값을 할당함
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    // (실제 화면 크기 - 80) 만큼 buttonWidth에 할당. 실제 기기의 화면 크기에 따라 달라짐
    // 왼쪽과 오른쪽 가장자리에 각각 40만큼의 padding이 추가됨
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    
    // 사용자가 버튼을 끌고 다닐 때는 버튼은 활성 상태, 아닐 때는 비활성 상태임
    // 사용자가 버튼을 끌고 다닐 때 buttonOffset은 계속 변경됨
    @State private var buttonOffset: CGFloat = 0
    
    // A property to control the animation
    // isAnimating이 true면 애니메이션을 시작함
    @State private var isAnimating: Bool = false
    
    // 드래그 제스처를 위한 속성 값 선언
    @State private var imageOffset: CGSize = .zero
    
    // 화살표 불투명도를 저장할 새로운 변수 선언
    @State private var indicatorOpacity: Double = 1.0
    
    // 동적 문자열 변환을 위한 새로운 변수 선언
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
                
                VStack(spacing: 0) {
                    Text(textTitle)
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .transition(.opacity)
                        .id(textTitle) // 해당 텍스트뷰를 위한 고유 ID 생성, 변경하면 완전히 새로운 텍스트뷰로 인식함
                    
                    Text("""
                         It's not how much we give but
                         how much love we put into giving.
                         """)
                    .font(.title3)
                    .fontWeight(.light)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 10)
                } //: HEADER
                // ternary operator는 ? 앞의 조건이 true면 2번째 값을, false면 3번째 값을 반환함
                .opacity(isAnimating ? 1 : 0) // 처음 나타나면 투명도 0이지만 나타나자마자 true로 바뀜 -> 애니메이션 촉발하며 헤더가 나타남
                .offset(y: isAnimating ? 0 : -40) // 높이 설정
                .animation(.easeOut(duration: 1), value: isAnimating) // 애니메이션 유형
                // 첫번째 부분은 Animation Parameter, .easeOut은 애니메이션 마지막에 속도를 늦춰줌
                // 두번째 부분은 Value Parameter, iOS 15부터는 필수임. 애니메이션의 변화를 야기하는 값을 프로그램에게 알려줘야 함
                
                // MARK: - CENTER
                
                ZStack {
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                        .offset(x: imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width / 5))
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
                                    if abs(imageOffset.width) <= 150 { // 사용자가 왼쪽으로 이미지를 드래그하면 abs는 절댓값을 반환하기 때문에 양수로 반환
                                        // 이미지가 화면을 벗어나게 하는 것을 방지
                                        imageOffset = gesture.translation // gesture.translation은 드래그 제스처의 시작부터 현재 이벤트까지 전체 움직임에 관한 필수 정보를 제공함
                                        
                                        withAnimation(.linear(duration: 0.25)) {
                                            indicatorOpacity = 0
                                            textTitle = "Give."
                                        }
                                    }
                                }
                                .onEnded { _ in // 애니메이션이 끝나면
                                    imageOffset = .zero // 다시 제자리로 오게 함
                                    
                                    withAnimation(.linear(duration: 0.25)) {
                                        indicatorOpacity = 1
                                        textTitle = "Share."
                                    }
                                }
                        ) //: GESTURE
                        .animation(.easeOut(duration: 1), value: imageOffset) // 다시 제자리로 돌아갈 때 서서히 돌아가게 하는 애니메이션 적용
                } //: CENTER
                .overlay(
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 44, weight: .ultraLight))
                        .foregroundColor(.white)
                        .offset(y: 20)
                        .opacity(isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 1).delay(1), value: isAnimating)
                        .opacity(indicatorOpacity)
                    , alignment: .bottom
                )
                
                Spacer()
                
                // MARK: - FOOTER
                
                ZStack {
                    // PARTS OF THE CUSTOM BUTTON
                    
                    // 1. BACKGROUND (STATIC)
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    
                    // 2. CALL-TO-ACTION (STATIC)
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    
                    // 3. CAPSULE (DYNAMIC WIDTH)
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: buttonOffset + 80) // buttonOffeset의 초기값이 0이기 때문에 80을 더해줌
                        Spacer(minLength: 0) // 그냥 Spacer로 하면 여백이 좀 남고 minLength: 0으로 설정해줘야 여백이 안 남음
                    }
                    
                    // 4. CIRCLE (DRAGGABLE)
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
                        .offset(x: buttonOffset) //Automatic View Update
                        .gesture(
                            DragGesture()
                                // 클로저 이용해서 표현
                                .onChanged { gesture in
                                    if gesture.translation.width > 0  && buttonOffset <= buttonWidth - 80 { // ZStack은 화면 좌측 상단 코너 좌표를 사용하기 때문에 - 80읋 해주는 것
                                        buttonOffset = gesture.translation.width
                                    }
                                }
                                .onEnded { _ in // 제스처가 끝나면
                                    if buttonOffset > buttonWidth / 2 { // 빨간 버튼이 화면에서 오른쪽으로 치우쳐져 있으면
                                        hapticFeedback.notificationOccurred(.success)
                                        playSound(sound: "chimeup", type: "mp3")
                                        buttonOffset = buttonWidth - 80 // 완전 오른쪽으로 밀어줌
                                        isOnboardingViewActive = false // 화면 전환
                                    }
                                    else {
                                        hapticFeedback.notificationOccurred(.warning)
                                        buttonOffset = 0
                                    } // 완전 왼쪽으로 밀어줌
                                }
                        ) //: GSETURE
                        Spacer()
                    } //: HSTACK
                } //: FOOTER
                .frame(width: buttonWidth, height: 80, alignment: .center) // width를 이용해 버튼 크기에 제약을 걸어줌
                .padding()
                .opacity(isAnimating ? 1 : 0)
                .offset(y: isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: isAnimating)
            } //: VStack
        } //: ZStack
        .onAppear(perform: { // onboarding 화면이 나타났을 때
            isAnimating = true // 애니메이션 시작
        })
        .preferredColorScheme(.dark) // 이 뷰에는 다크 스킨 구성표를 사용하겠음
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
