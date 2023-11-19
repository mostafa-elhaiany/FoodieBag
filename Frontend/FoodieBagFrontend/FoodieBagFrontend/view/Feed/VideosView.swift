//
//  VideosView.swift
//  FoodieBagFrontend
//
//  Created by Heidi Albarazi on 18.11.23.
//


// Tiktok scroll behaviour
import SwiftUI
import AVKit

struct VideosView: View {
    @StateObject var viewModel = VideosViewModel()

    var body: some View {
        ScrollView() {
            LazyVStack(spacing:0) {
                ForEach(viewModel.posts) { post in
                    FeedCell(post:post)
                }
            }
            .scrollTargetLayout()
        }
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
    }
}

struct VideosView_Previews: PreviewProvider {
    static var previews: some View {
        VideosView()
    }
}
