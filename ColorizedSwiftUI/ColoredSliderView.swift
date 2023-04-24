//
//  ColoredSliderView.swift
//  ColorizedSwiftUI
//
//  Created by Anton Kuzmin on 24.04.2023.
//

import SwiftUI

struct ColoredSliderView: View {
    @State var value = 0.5
    
    let color: Color
    
    var body: some View {
        HStack {
            Text("\(lround(value))")
            Slider(value: $value, in: 0...255, step: 1)
                .tint(color)
        }
        .padding()
    }
}

struct ColoredSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ColoredSliderView(color: .red)
    }
}
