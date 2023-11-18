//
//  AllergiesView.swift
//  FoodieBagFrontend
//
//  Created by Heidi Albarazi on 18.11.23.
//

import SwiftUI
import AVKit

struct AllergiesView: View {
    @State var player = AVPlayer(url: Bundle.main.url(forResource: "video2",
                                                      withExtension: "mp4")!)
    @State var isPlaying: Bool = false
    
    var body: some View {
        VideoPlayer(player: player)
            .frame(width: 320, height: 180, alignment: .center)

    }
}

#Preview {
    AllergiesView()
}
