//
//  ContentView.swift
//  Verbarius
//
//  Created by Medyannik Dmitri on 30.03.2024.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentTime: String = ""
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var clockOptions: [ClockOptions] = loadJson(filename: "English")
    
    static let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        return formatter
    }()

    var body: some View {
        
        VStack {
            Text("\(currentTime)")
                .onReceive(timer) { input in
                    let option = clockOptions.first(where: { $0.time == ContentView.timeFormatter.string(from: input) })
                    currentTime = option?.value1 ?? ""
                    
                }
                .lineLimit(2)
                .padding(.horizontal)
                .font(.largeTitle)
                .fontWeight(.regular)
                .foregroundStyle(.white)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
    }
}

#Preview {
    ContentView()
}
