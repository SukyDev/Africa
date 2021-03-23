//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Vladimir Sukanica on 7.2.21..
//

import SwiftUI

struct AnimalDetailView: View {
    
    let animal: Animal
    var body: some View {
        ScrollView(.vertical, showsIndicators: false, content: {
            /*@START_MENU_TOKEN@*/VStack(alignment: .center, spacing: 20) {
                // HERO IMAGE
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                // TITLE
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24))
                
                // HEADLINE
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                // GALLERY
                Group {
                    HeadingView(headingImage: "photo.on.rectangle.angled", headingText: "Wilderness in Pictures")
                    
                    InsetGalleryView(animal: animal)
                }
                .padding(.horizontal)
                // FACTS
                
                Group {
                    HeadingView(headingImage: "questionmark.circle", headingText: "Did You Know?")
                    InsetFactView(animal: animal)
                }
                .padding(.horizontal)
                
                
                // DESCRIPTION
                
                Group {
                    HeadingView(headingImage: "info.circle", headingText: "All about \(animal.name)")
                    
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1)
                }
                .padding(.horizontal)
                
                // MAP
                Group {
                    HeadingView(headingImage: "map", headingText: "National parks")
                    InsetMapView()
                    
                }
                .padding(.horizontal)
                
                // LINK
                Group {
                    HeadingView(headingImage: "books.vertical", headingText: "Learn More")
                    ExternalWeblinkView(animal: animal)
                }
                .padding(.horizontal)
                
                
            }/*@END_MENU_TOKEN@*/
            .navigationBarTitle("Learn about \(animal.name)", displayMode: .inline)
        })
    }
}

struct AnimalDetailView_Previews: PreviewProvider {
    static let animals: [Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        NavigationView{
        AnimalDetailView(animal: animals[0])
        }
        .previewDevice("iPhone 12 Pro")
    }
}
