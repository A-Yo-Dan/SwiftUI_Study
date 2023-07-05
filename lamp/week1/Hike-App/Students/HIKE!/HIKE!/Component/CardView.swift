//
//  CardView.swift
//  HIKE!
//
//  Created by 박민서 on 2023/07/05.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    // MARK: - FUNCTIONS
    
    func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        
        imageNumber = randomNumber
    }
    
    var body: some View {
        //MARK: - CARD
        ZStack {
            CustomBackgroundView()
            
            VStack {
                
                // MARK: - HEADER
                VStack(alignment: .leading) {
                    HStack {
                        Text("오르다")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(colors: [.customGrayLight,.customGrayMedium], startPoint: .top, endPoint: .bottom)
                            )
                        
                        Spacer()
                        
                        Button{
                            // ACTION: show a sheet
                            print("button pressed")
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium,.large])
                        }
                    }//: HSTACK
                    
                    
                    Text("친구랑 나가놀아라 얘야")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }//: HEADER
                .padding(.horizontal, 30)
                // MARK: - MAIN CONTENT
                
                ZStack {
                    CustomCircleView()
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        //.animation(.easeOut(duration: 1), value: imageNumber)
                }//:inner ZStack
                
                // MARK: - FOOTER
                Button {
                    //Action: Generate a random number
                    //print("버튼 눌려따")
                    withAnimation(.easeOut(duration: 1), {
                        randomImage()
                    })
                } label: {
                    Text("나가 제발")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(colors: [
                                .customGreenLight,
                                    .customGreenMedium
                            ],
                                        startPoint: .top,
                                        endPoint: .bottom
                            )
                        )
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButton())
            }
        }//: CARD ZStack
        .frame(width: 320, height: 570)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
