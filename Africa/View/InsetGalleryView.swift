//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Vladimir Sukanica on 7.2.21..
//

import SwiftUI

struct InsetGalleryView: View {
    // MARK: - properties
    
    let animal: Animal
    // MARK: - body
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack(alignment: .center, spacing: 15, content: {
                ForEach(animal.gallery, id: \.self) { item in
                    Image(item)
                        .resizable()
                        .scaledToFit()
                        .frame(height: 200)
                        .cornerRadius(12)
                }
            })//: HSTACK
        })//: SCROLL
    }
}

// MARK: - preview
struct InsetGalleryView_Previews: PreviewProvider {
    static let animals : [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetGalleryView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
