//
//  VideosView.swift
//  FoodieBagFrontend
//
//  Created by Heidi Albarazi on 18.11.23.
//


// Tiktok scroll behaviour
import SwiftUI


struct VideosView: View {
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(spacing: 0) {
                ForEach(0..<100) { i in
                    ZStack {
                        Rectangle()
                            .fill(Color.blue.opacity(0.6))
                            .containerRelativeFrame([.horizontal, .vertical])
                        Text("Video \(i+1)")
                            .font(.title)
                            .bold()
                    }
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
    }
}

#Preview {
    VideosView()
}
