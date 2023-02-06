//
//  ContentView.swift
//  You-Are-Awesome
//
//  Created by Riya Kodali on 1/29/23.
//
//test
import SwiftUI
import AVFAudio

struct ContentView: View {
    @State private var messageString = ""
    @State private var imageName = ""
    @State private var lastMessageNumber = -1
    @State private var lastImageNumber = -1
    @State private var audioPlayer: AVAudioPlayer!
    @State private var lastSoundNumber = -1
    
    var body: some View {
        
        VStack {
            Text(messageString)
                .font(.largeTitle)
                .fontWeight(.heavy)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
                .foregroundColor(.red)
                .frame(height: 150)
                .frame(maxWidth: .infinity)
            //.border(.orange, width:1)
                .padding()
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(30)
                .padding()
        
            
            Spacer()
            
            
            HStack{
                Button("Show Message"){
                    let messages = ["You Are Awesome!",
                                    "You Are Great!",
                                    "You Are Fanatstic!",
                                    "Fabulous?, That's You!",
                                    "You Make Me Smile!", "When the Genius Bar Needs Help, They Call You!"]
                    
                    lastMessageNumber = nonRepeatingRandom(lastNumber: lastMessageNumber, upperBound: messages.count-1)
                    messageString = messages[lastMessageNumber]
                    
                    lastImageNumber = nonRepeatingRandom(lastNumber: lastImageNumber, upperBound: 9)
                    imageName = "image\(lastImageNumber)"
                    
                    lastSoundNumber = nonRepeatingRandom(lastNumber: lastSoundNumber, upperBound: 5)
                    playSound(soundName: "sound\(lastSoundNumber)")

                }
                .buttonStyle(.borderedProminent)
                
            }
            .padding()
            .tint(.blue)
            
            
        }
    }
    
    func nonRepeatingRandom(lastNumber: Int, upperBound: Int) -> Int {
        var newNumber: Int
        repeat {
            newNumber = Int.random(in: 0...upperBound)
        } while newNumber == lastNumber
        return newNumber
    }
    
    
    func playSound(soundName: String){
        guard let soundFile = NSDataAsset(name: soundName) else{
            print("😡 Could not read file names \(soundName)")
            return
        }
        do {
            audioPlayer = try AVAudioPlayer(data: soundFile.data)
            audioPlayer.play()

        } catch {
            print("😡 ERROR: \(error.localizedDescription) creating audioPlayer.")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

