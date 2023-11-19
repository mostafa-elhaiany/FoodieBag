//
//  FeedCell.swift
//  FoodieBagFrontend
//
//  Created by Heidi Albarazi on 19.11.23.
//

import SwiftUI
import AVKit

struct FeedCell: View {
    let post: Post
    var body: some View {
        ZStack{
            VideoPlayer(player: AVPlayer(url: URL(string: post.videoUrl)!))
                .containerRelativeFrame([.horizontal, .vertical])
                
            VStack{
                Spacer()
                HStack(alignment: .bottom){
                    VStack{
                        Text("Carlos.sanchez")
                            .fontWeight(.semibold)
                        Text("Nice recipes")
                    }
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    
                    Spacer()
                    
                    VStack(spacing: 28){
                        Spacer(minLength: 350)
                        Circle()
                            .frame(width: 48, height: 48)
                        Button{
                            
                        } label: {
                            VStack{
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundStyle(.white)
                                
                                Text("450")
                                    .foregroundStyle(.white)
                                    .font(.caption)
                                    .bold()
                            }
                        }
                        
                        Button{
                            
                        } label: {
                            VStack{
                                Image(systemName: "ellipsis.bubble.fill")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundStyle(.white)
                                Text("150")
                                    .foregroundStyle(.white)
                                    .font(.caption)
                                    .bold()
                            }
                        }
                        
                        Button{
                            
                        } label: {
                            Image(systemName: "bookmark.fill")
                                .resizable()
                                .frame(width: 28, height: 28)
                                .foregroundStyle(.white)
                        }
                        
                        Button{
                            
                        } label: {
                            Image(systemName: "heart.fill")
                                .resizable()
                                .frame(width: 28, height: 28)
                                .foregroundStyle(.white)
                        }
                    }
                }.padding(.bottom, 100)
                
            }
            .padding()
        }
    }
}

#Preview {
    FeedCell(post: Post(id: NSUUID().uuidString, videoUrl: ""))
}
