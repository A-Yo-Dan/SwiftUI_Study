//
//  ContentView.swift
//  Pinch
//
//  Created by 서은수 on 2023/07/05.
//

import SwiftUI

struct ContentView: View {
    
    // MARK: - PROPERTY
    
    @State private var isAnimating: Bool = false
    @State private var imageScale: CGFloat = 1
    @State private var imageOffset: CGSize = .zero
    @State private var isDrawerOpen: Bool = false
    
    let pages: [Page] = pagesData
    @State private var pageIndex: Int = 1
    
    // MARK: - FUNCTION
    
    func resetImageState() {
        return withAnimation(.spring()) {
            imageScale = 1
            imageOffset = .zero
        }
    }
    
    func currentPage() -> String {
        return pages[pageIndex - 1].imageName
    }
    
    // MARK: - CONTENT
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.clear
                
                // MARK: - Page Image
                Image(currentPage())
                    .resizable()
                    .aspectRatio(contentMode: .fit) /// .scaledToFit()과 같은 건가?
                    .cornerRadius(10)
                    .padding()
                    .shadow(color: .black.opacity(0.2), radius: 12, x: 2, y: 2) // 이미지 주위에 그림자
                    .opacity(isAnimating ? 1 : 0)
                    .offset(x: imageOffset.width, y: imageOffset.height) // 순서 중요 꼭 scaleEffect 전에 작성되어야 함!
                    .scaleEffect(imageScale)
                // MARK: - 1. TAP GESTURE
                    .onTapGesture(count: 2) {
                        if imageScale == 1 { // 원래 크기일 때 탭 2번 했으면
                            withAnimation(.spring()) {
                                imageScale = 5 // 이미지 확대
                            }
                        } else { // 확대된 상태에서 탭 2번 했으면
                            // 원래 크기, 원래 위치로 돌려놓기
                            resetImageState()
                        }
                    }
                // MARK: - 2. DRAG GESTURE
                    .gesture(
                        DragGesture() // 이미지에 드래그 제스쳐 추가
                            .onChanged { value in
                                withAnimation(.linear(duration: 1)) {
                                    // 드래그 한만큼 이동
                                    imageOffset = value.translation
                                }
                            }
                            .onEnded { _ in
                                if imageScale <= 1 { // 드래그 끝났고, 이미지 확대 안 했을 경우
                                    // 원래 크기, 원래 위치로 돌려놓기
                                    resetImageState()
                                }
                            }
                    )
                // MARK: - 3. MAGNIFICATION
                    .gesture(
                        MagnificationGesture()
                            .onChanged { value in
                                withAnimation(.linear(duration: 1)) {
                                    if imageScale >= 1 && imageScale <= 5 {
                                        imageScale = value
                                    } else if imageScale > 5 {
                                        imageScale = 5
                                    }
                                }
                            }
                            .onEnded { _ in
                                if imageScale > 5 {
                                    imageScale = 5
                                } else if imageScale <= 1 {
                                    resetImageState()
                                }
                            }
                    )
                
            } //: ZSTACK
            .navigationTitle("Pinch & Zoom")
            .navigationBarTitleDisplayMode(.inline)
            .onAppear(perform: {
                withAnimation(.linear(duration: 1)) {
                    isAnimating = true
                }
            })
            // MARK: - INFO PANEL
            .overlay(
                // 커스텀 뷰 추가
                InfoPanelView(scale: imageScale, offset: imageOffset)
                    .padding(.horizontal)
                    .padding(.top, 30)
                , alignment: .top
            )
            // MARK: - CONTROLS
            .overlay(
                Group {
                    HStack {
                        // SCALE DOWN
                        Button {
                            // Action
                            withAnimation(.spring()) {
                                if imageScale > 1 {
                                    imageScale -= 1
                                    
                                    if imageScale <= 1 {
                                        resetImageState()
                                    }
                                }
                            }
                        } label: {
                            ControlImageView(icon: "minus.magnifyingglass")
                        }
                        
                        // RESET
                        Button {
                            // Action
                            resetImageState()
                        } label: {
                            ControlImageView(icon: "arrow.up.left.and.down.right.magnifyingglass")
                        }
                        
                        // SCALE UP
                        Button {
                            // Action
                            withAnimation(.spring()) {
                                if imageScale < 5 {
                                    imageScale += 1
                                    
                                    if imageScale > 5 {
                                        imageScale = 5 // max = 5
                                    }
                                }
                            }
                        } label: {
                            ControlImageView(icon: "plus.magnifyingglass")
                        }
                    } //: HStack (CONTROLS)
                    .padding(EdgeInsets(top: 12, leading: 20, bottom: 12, trailing: 20))
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .opacity(isAnimating ? 1 : 0)
                }
                    .padding(.bottom, 30)
                , alignment: .bottom
            )
            // MARK: - DRAWER
            .overlay(
                HStack(spacing: 12) {
                    // MARK: - DRAWER HANDLE
                    Image(systemName: isDrawerOpen ? "chevron.compact.right" : "chevron.compact.left")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 40)
                        .padding(8)
                        .foregroundColor(.secondary)
                        .onTapGesture {
                            withAnimation(.easeOut) {
                                isDrawerOpen.toggle()
                            }
                        }
                    // MARK: - THUMBNAILS
                    ForEach(pages) { item in
                        Image(item.thumbnailName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                            .cornerRadius(8)
                            .shadow(radius: 4)
                            .opacity(isDrawerOpen ? 1 : 0)
                            .animation(.easeOut(duration: 0.5), value: isDrawerOpen)
                            .onTapGesture { // 썸네일 이미지 클릭 시
                                isAnimating = true
                                pageIndex = item.id
                            }
                    }
                } //: DRAWER
                    .padding(EdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8))
                    .background(.ultraThinMaterial)
                    .cornerRadius(12)
                    .opacity(isAnimating ? 1 : 0)
                    .frame(width: 260)
                    .padding(.top, UIScreen.main.bounds.height / 12)
                    .offset(x: isDrawerOpen ? 20 : 215)
                , alignment: .topTrailing
            )
        } //: Navigation
        .navigationViewStyle(.stack)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
