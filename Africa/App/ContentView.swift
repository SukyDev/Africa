//
//  ContentView.swift
//  Africa
//
//  Created by Vladimir Sukanica on 6.2.21..
//

import SwiftUI

struct ContentView: View {
    // MARK: - Properties
    
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    @State private var isGridViewActive: Bool = false

    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var gridIcon :String = "square.grid.2x2"
    
    // MARK: - Functions
    
    func gridSwitch(){
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        print("Grid Number: \(gridColumn)")
        
        //TOOLBAR IMAGE
        
        switch gridColumn {
        case 1:
            gridIcon = "square.grid.2x2"
        case 2:
            gridIcon = "square.grid.3x2"
        case 3:
            gridIcon = "rectangle.grid.1x2"
        default:
            gridIcon = "square.grid.2x2"
        }
    }
    // MARK: - Body
    var body: some View {
        
        
        NavigationView {
            Group {
                if !isGridViewActive {
                    List{
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
                            .padding(.vertical, 10)
                        ForEach(animals){animal in
                            NavigationLink(
                                destination: AnimalDetailView(animal: animal),
                                label: {
                                    AnimalListItemView(animal: animal)
                                })//: NAVIGATION
                        }//: LOOP
                        
                        CreditsView()
                            .modifier(CenterModifier())
                    }//: LIST
                } else {
                    ScrollView(.vertical, showsIndicators: false){
                        LazyVGrid(columns: gridLayout, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10, pinnedViews: /*@START_MENU_TOKEN@*/[]/*@END_MENU_TOKEN@*/, content: {
                            ForEach(animals) { animal in
                                NavigationLink(
                                    destination: AnimalDetailView(animal: animal),
                                    label: {
                                        AnimalGridItemView(animal: animal)
                                    })//: LINK
                            }//: LOOP
                        })//: GRID
                        .padding(10)
                        .animation(.easeIn)
                    }//: SCROLL
                }//: CONDITION
            } //: GROUP

            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar(content: {
                ToolbarItem {
                    HStack(spacing: 16){
                        Button(action: {
                            print("List of items activated")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        }, label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .primary : .accentColor)
                        })
                        //GRID
                        Button(action: {
                            print("Grid view is activated")
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        }, label: {
                            Image(systemName: gridIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)

                        })
                    }//:HSTACK
                }//:TOOLBAR
            })
        }//: NAVIGATION
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
