//
//  PhotoGrid.swift
//  SwiftUIPhotoGrid
//
//  Created by Marble Interactive SL on 11/2/23.
//

import SwiftUI

struct MultiGridView: View {
    
    @State var gridLayout = [ GridItem(.adaptive(minimum: 100)), GridItem(.flexible()) ]
    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    @Environment(\.verticalSizeClass) var verticalSizeClass: UserInterfaceSizeClass?
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                    ForEach(sampleCafes) { cafe in
                        Image(cafe.image)
                            .resizable()
                            .scaledToFill()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(maxHeight: 150)
                            .cornerRadius(10)
                            .shadow(color: Color.primary.opacity(0.3), radius: 1)
                        
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 50))]) {
                            ForEach(cafe.coffeePhotos) { photo in
                                Image(photo.name)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(minWidth: 0, maxWidth: .infinity)
                                    .frame(height: 50)
                                    .cornerRadius(10)
                            }
                        }
                        .frame(minWidth: 0, maxHeight: .infinity, alignment: .top)
                        .animation(.easeIn, value: gridLayout.count)
                        
                    }
                }
                .padding(.all, 10)
                .animation(.interactiveSpring(), value: gridLayout.count)
            }
            .navigationTitle("Coffee Feed")
        }
        .onChange(of: verticalSizeClass) { _ in
            gridLayout = [ GridItem(.adaptive(minimum: verticalSizeClass == .compact ? 100 : 250)), GridItem(.flexible()) ]
        }
    }
}

struct MultiGridView_Previews: PreviewProvider {
    static var previews: some View {
        MultiGridView()
    }
}
