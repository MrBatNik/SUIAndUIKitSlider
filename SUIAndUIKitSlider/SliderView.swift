//
//  SliderView.swift
//  SUIAndUIKitSlider
//
//  Created by Nikita Batrakov on 31.01.2022.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    @Binding var currentValue: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = Float(currentValue)
        slider.thumbTintColor = .red
            .withAlphaComponent(CGFloat(currentValue) / 100)
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(currentValue: .constant(50))
    }
}
