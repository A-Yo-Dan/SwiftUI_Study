//
//  InsetFactView.swift
//  Africa
//
//  Created by 정현우 on 2023/07/16.
//

import SwiftUI

struct InsetFactView: View {
	// MARK: - Property
	let animal: Animal
	
	// MARK: - Body
    var body: some View {
		GroupBox {
			TabView {
				ForEach(animal.fact, id: \.self) { item in
					Text(item)
				}
			}
			.tabViewStyle(.page)
			.frame(minHeight: 148, idealHeight: 168, maxHeight: 180)
		}
    }
}


// MARK: - Preview
struct InsetFactView_Previews: PreviewProvider {
	static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetFactView(animal: animals[0])
    }
}
