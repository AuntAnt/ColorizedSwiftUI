//
//  ContentView.swift
//  ColorizedSwiftUI
//
//  Created by Anton Kuzmin on 24.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValues = Double.random(in: 0...255)
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20).foregroundColor(.accentColor)
                .frame(height: 200)
            
            ColoredSliderView(color: .red)
            ColoredSliderView(color: .green)
            ColoredSliderView(color: .blue)
            
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
