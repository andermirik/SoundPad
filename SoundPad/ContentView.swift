//
//  ContentView.swift
//  SoundPad
//
//  Created by Огурцов Андрей on 10.02.2022.
//

import SwiftUI
import AVFoundation


var player = AVPlayer()

struct ContentView: View {
    
    var body: some View {
        Button(action: {
            
            let url = URL(string: "https://www.myinstants.com/media/sounds/definetly-a-moan-lololol-made-with-clipchamp.mp3")
           
            let playerItem = AVPlayerItem(url:url!)
            player = AVPlayer(playerItem: playerItem)
            player.play()
        }, label: {
            Text("Touch me")
        }).padding()
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 12 mini")
    }
}
