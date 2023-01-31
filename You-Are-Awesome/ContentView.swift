//
//  ContentView.swift
//  You-Are-Awesome
//
//  Created by Riya Kodali on 1/29/23.
//

import SwiftUI

struct ContentView: View {
    @State private var messageString = ""
    @State private var imageName = ""
    @State private var imageNumber = 0
    @State private var messageNumber = 0
    
    var body: some View {
        
        VStack {
            
            
            Image(imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(30)
                .padding()
            
            Spacer()
            
            
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
            
            Spacer()
            
            
            HStack{
                Button("Show Message"){
                    let messages = ["You Are Awesome!",
                                    "You Are Great!",
                                    "You Are Fanatstic!",
                                    "Fabulous?, That's You!",
                                    "You Make Me Smile!", "When the Genius Bar Needs Help, They Call You!"]
                    
                   messageString = messages[messageNumber]
                    messageNumber += 1
                    if messageNumber == messages.count {
                        messageNumber = 0
                    }
                    
                    imageName = "image\(imageNumber)"
                    imageNumber = imageNumber + 1
                    if imageNumber > 9 {
                        imageNumber = 0
                    }
                    print(imageNumber)
                }
                .buttonStyle(.borderedProminent)
                
            }
            .padding()
            .tint(.blue)
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

