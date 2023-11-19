import SwiftUI
import AVKit

struct FeedCell: View {
    let post: Post
    @State private var isHeartFilled = false
    @State private var isSaved = false
    @State private var likesCount = Int.random(in: 13000...500000)
    @State private var commentsCount = Int.random(in: 13000...500000)
    @State private var savesCount = Int.random(in: 13000...500000)
    var player: AVPlayer
    
    // List of common names
    let names = ["Carlos Sanchez", "John Doe", "Jane Smith", "David Johnson", "Emily Davis"]
    
    // List of food-related descriptions
    let foodDescriptions = [
        "Enthusiastic about healthy eating and delicious recipes.",
        "Passionate about exploring diverse cuisines.",
        "Food lover on a journey to better nutrition.",
        "Believes in the power of mindful eating.",
        "Sharing my culinary adventures for a balanced lifestyle."
    ]
    
    // Properties to store random values
    @State private var randomName: String
    @State private var randomDescription: String

    // Initialize with random values
    init(post: Post, player: AVPlayer) {
        self.post = post
        self.player = player
        _randomName = State(initialValue: names.randomElement() ?? "sarah Lynn")
        _randomDescription = State(initialValue: foodDescriptions.randomElement() ?? "Very good food")
    }
    
    var body: some View {
        ZStack{
            CustomVideoPlayer(player: player)
                .containerRelativeFrame([.horizontal, .vertical])
                
            VStack{
                Spacer()
                HStack(alignment: .bottom){
                    VStack(alignment: .leading){
                        Text(randomName)
                            .fontWeight(.semibold)
                        Text(randomDescription)
                    }
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    
                    Spacer()
                    
                    VStack(spacing: 28){
                        Spacer(minLength: 350)
                        Image("profilepic1")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 48, height: 48)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 1))
                            .shadow(radius: 3)
                        
                        Button(action: {
                            withAnimation {
                                isHeartFilled.toggle()
                                if isHeartFilled {
                                    likesCount += 1
                                } else {
                                    likesCount -= 1
                                }
                            }
                        }) {
                            VStack {
                                Image(systemName: isHeartFilled ? "heart.fill" : "heart")
                                    .resizable()
                                    .frame(width: 28, height: 28)
                                    .foregroundColor(isHeartFilled ? .red : .white)
                                
                                Text("\(likesCount)")
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
                                Text("\(commentsCount)")
                                    .foregroundStyle(.white)
                                    .font(.caption)
                                    .bold()
                            }
                        }
                        
                        
                        Button(action: {
                            withAnimation {
                                isSaved.toggle()
                                if isSaved {
                                    savesCount += 1
                                } else {
                                    savesCount -= 1
                                }
                            }
                        }) {
                            VStack {
                                Image(systemName: isSaved ? "bookmark.fill" : "bookmark")
                                    .resizable()
                                    .frame(width: 24, height: 28)
                                    .foregroundColor(isSaved ? .blue : .white)
                                
                                Text("\(savesCount)")
                                    .foregroundStyle(.white)
                                    .font(.caption)
                                    .bold()
                            }
                        }
                        Spacer()
                        
                        
                    }
                }.padding(.bottom, 100)
            }
            .padding()
        }
        .onTapGesture {
            switch player.timeControlStatus {
            case .paused:
                player.play()
            case .waitingToPlayAtSpecifiedRate:
                break
            case .playing:
                player.pause()
            @unknown default:
                break
            }
        }
    }
}

#Preview {
    FeedCell(post: Post(id: NSUUID().uuidString, videoUrl: "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerEscapes.mp4"), player: AVPlayer())
}
