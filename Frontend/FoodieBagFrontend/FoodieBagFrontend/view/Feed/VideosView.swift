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
    @State private var scrollPosition: String?
    @State private var player = AVPlayer()

    var body: some View {
        ScrollView() {
            LazyVStack(spacing:0) {
                ForEach(viewModel.posts) { post in
                    FeedCell(post:post, player: player)
                        .id(post.id)
                        .onAppear{
                            playInitialVideoIfNessecary()
                        }
                }
            }
            .scrollTargetLayout()
        }
        .onAppear{
            player.play()
        }
        .scrollPosition(id: $scrollPosition)
        .scrollTargetBehavior(.paging)
        .ignoresSafeArea()
        .onChange(of: scrollPosition) {oldValue, newValue in
            playVideoOnChangePosition(postID: newValue)
        }
    }
    
    func playInitialVideoIfNessecary(){
        guard
            scrollPosition == nil,
            let post = viewModel.posts.first,
            player.currentItem == nil else {return}
        let item = AVPlayerItem(url: URL(string: post.videoUrl)!)
        player.replaceCurrentItem(with: item)
    }
    
    
    func playVideoOnChangePosition(postID: String?){
        guard let currentPost = viewModel.posts.first(where: {$0.id == postID} )  else { return }
        player.replaceCurrentItem(with: nil)
        let playerItem = AVPlayerItem(url: URL(string: currentPost.videoUrl)!)
        player.replaceCurrentItem(with: playerItem)
    }
}

struct VideosView_Previews: PreviewProvider {
    static var previews: some View {
        VideosView()
    }
}
