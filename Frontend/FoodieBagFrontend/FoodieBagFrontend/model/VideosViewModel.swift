//
//  VideosViewModel.swift
//  FoodieBagFrontend
//
//  Created by Heidi Albarazi on 19.11.23.
//

import SwiftUI

import SwiftUI

class VideosViewModel: ObservableObject {
    @Published var posts = [Post]()
    
    let videoUrls = [
        "https://cdn.glitch.global/8fe95779-5e66-4911-96bb-a8cdf515db6b/video1.mp4?v=1700363807081",
        "https://cdn.glitch.global/8fe95779-5e66-4911-96bb-a8cdf515db6b/video5%20(1).mp4?v=1700363809397",
        "https://cdn.glitch.global/8fe95779-5e66-4911-96bb-a8cdf515db6b/video2.mp4?v=1700363811679",
        "https://cdn.glitch.global/8fe95779-5e66-4911-96bb-a8cdf515db6b/video4.mp4?v=1700363822172",
        "https://cdn.glitch.global/8fe95779-5e66-4911-96bb-a8cdf515db6b/video3.mp4?v=1700363824465",
        "https://cdn.glitch.global/8fe95779-5e66-4911-96bb-a8cdf515db6b/video10.mp4?v=1700363825729",
        "https://cdn.glitch.global/8fe95779-5e66-4911-96bb-a8cdf515db6b/video9.mp4?v=1700363837420",
        "https://cdn.glitch.global/8fe95779-5e66-4911-96bb-a8cdf515db6b/video8.mp4?v=1700363839288",
        "https://cdn.glitch.global/8fe95779-5e66-4911-96bb-a8cdf515db6b/video7.mp4?v=1700363841144",
        "https://cdn.glitch.global/8fe95779-5e66-4911-96bb-a8cdf515db6b/video6%20(1).mp4?v=1700363852729",
        "https://cdn.glitch.global/8fe95779-5e66-4911-96bb-a8cdf515db6b/video5.mp4?v=1700363854926",
        "https://cdn.glitch.global/8fe95779-5e66-4911-96bb-a8cdf515db6b/video6.mp4?v=1700363856796",
        "https://cdn.glitch.global/8fe95779-5e66-4911-96bb-a8cdf515db6b/videox.mp4?v=1700363858241" //13
    ]
    
    init(){
        fetchPosts()
    }
    
    func fetchPosts(){
        self.posts = [
            .init(id: NSUUID().uuidString, videoUrl: videoUrls[0]),
            .init(id: NSUUID().uuidString, videoUrl: videoUrls[1]),
            .init(id: NSUUID().uuidString, videoUrl: videoUrls[2]),
            .init(id: NSUUID().uuidString, videoUrl: videoUrls[3]),
            .init(id: NSUUID().uuidString, videoUrl: videoUrls[4]),
            .init(id: NSUUID().uuidString, videoUrl: videoUrls[5]),
            .init(id: NSUUID().uuidString, videoUrl: videoUrls[6]),
            .init(id: NSUUID().uuidString, videoUrl: videoUrls[7]),
            .init(id: NSUUID().uuidString, videoUrl: videoUrls[8]),
            .init(id: NSUUID().uuidString, videoUrl: videoUrls[9]),
            .init(id: NSUUID().uuidString, videoUrl: videoUrls[10]),
            .init(id: NSUUID().uuidString, videoUrl: videoUrls[11]),
            .init(id: NSUUID().uuidString, videoUrl: videoUrls[12]),

            
        ]
    }
}
