//
//  ContentView.swift
//  SoundPad WatchKit Extension
//
//  Created by Огурцов Андрей on 10.02.2022.
//

import SwiftUI
import AVFoundation


var player = AVPlayer()

struct ContentView: View {
    @State var scrollAmount = 1.0
    @State var scroll: Double = 0.0
    @State var scrolling: Bool = false
    var body: some View {
        let url = "https://www.myinstants.com/media/sounds/definetly-a-moan-lololol-made-with-clipchamp.mp3"

                List{
                    getButton(urlButton: url)
                    getButton(urlButton: url)
                    getButton(urlButton: url)
                    getButton(urlButton: url)
                    getButton(urlButton: url)
                }.listStyle(.carousel)
                .focusable(true)
                .digitalCrownRotation($scrollAmount, from: 0, through: 5, by:0.1, sensitivity: .low, isContinuous: true, isHapticFeedbackEnabled: true)
                .onChange(of: scroll) { value in
                                withAnimation {
                                    scrolling = true
                                }
                }
        
    }

    
    func getButton(urlButton : String) -> some View {
        return Button(action: {
            
            let url = URL(string: urlButton)
           
            let playerItem = AVPlayerItem(url:url!)
            player = AVPlayer(playerItem: playerItem)
            player.volume = 1.0
            player.play()
        }, label: {
            
            Image("Complication/rick")
                .resizable()
                .aspectRatio(contentMode: .fit)
                //.clipShape(Circle())
                //.renderingMode(.original)
        }).buttonStyle(.plain)
            .clipShape(Circle())
            
        
    }
    
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
        //VolumeView().background(VolumeView().opacity(0))
    }
}

//struct VolumeView: WKInterfaceObjectRepresentable {
//    typealias WKInterfaceObjectType = WKInterfaceVolumeControl
//
//
//    func makeWKInterfaceObject(context: Self.Context) -> WKInterfaceVolumeControl {
//        let view = WKInterfaceVolumeControl(origin: .local)
//        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak view] timer in
//            if let view = view {
//                view.focus()
//            } else {
//                timer.invalidate()
//            }
//        }
//        DispatchQueue.main.async {
//            view.focus()
//        }
//        return view
//    }
//    func updateWKInterfaceObject(_ wkInterfaceObject: WKInterfaceVolumeControl, context: WKInterfaceObjectRepresentableContext<VolumeView>) {
//    }
//}

