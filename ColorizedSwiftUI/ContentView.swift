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
    
    @FocusState private var isFocused: Bool
    
    private var viewColor: Color {
        Color(
            red: redSliderValue / 255,
            green: greenSliderValue / 255,
            blue: blueSliderValue / 255
        )
    }
    
    var body: some View {
        VStack(spacing: 20) {
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(viewColor)
                .frame(height: 200)
            
            HStack {
                VStack(spacing: 40) {
                    ColoredSliderView(value: $redSliderValue, color: .red)
                    ColoredSliderView(value: $greenSliderValue, color: .green)
                    ColoredSliderView(value: $blueSliderValue, color: .blue)
                }
                
                VStack(spacing: 40) {
                    TextFieldView(value: $redSliderValue)
                        .focused($isFocused)
                    TextFieldView(value: $greenSliderValue)
                        .focused($isFocused)
                    TextFieldView(value: $blueSliderValue)
                        .focused($isFocused)
                }
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done", action: {
                            isFocused = false
                        })
                    }
                }
            }
            
            Spacer()
        }
        .onTapGesture {
            isFocused = false
        }
        .padding()
    }
}

// MARK: - Slider with value label
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
    }
}

// MARK: - Text field
struct TextFieldView: View {
    @Binding var value: Double
    
    var body: some View {
        TextField("", value: $value, formatter: NumberFormatter())
            .textFieldStyle(.roundedBorder)
            .frame(width: 45, height: 30)
            .multilineTextAlignment(.center)
            .keyboardType(.numberPad)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
