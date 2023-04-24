//
//  ContentView.swift
//  ColorizedSwiftUI
//
//  Created by Anton Kuzmin on 24.04.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var redSliderValue = Double.random(in: 0...255)
    @State private var greenSliderValue = Double.random(in: 0...255)
    @State private var blueSliderValue = Double.random(in: 0...255)
    
    private var viewColor: Color {
        Color(
            red: redSliderValue / 255,
            green: greenSliderValue / 255,
            blue: blueSliderValue / 255
        )
    }
    
    var body: some View {
        VStack {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(viewColor)
                .frame(height: 200)
            
            ColoredSliderView(value: $redSliderValue, color: .red)
            ColoredSliderView(value: $greenSliderValue, color: .green)
            ColoredSliderView(value: $blueSliderValue, color: .blue)
            
            Spacer()
        }
        .padding()
    }
}

struct ColoredSliderView: View {
    @Binding var value: Double
    
    let color: Color
    
    var body: some View {
        HStack() {
            Text("\(lround(value))")
                .frame(width: 45, height: 30)
            Slider(value: $value, in: 0...255, step: 1)
                .tint(color)
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
