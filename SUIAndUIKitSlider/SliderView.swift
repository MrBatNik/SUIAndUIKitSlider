//
//  SliderView.swift
//  SUIAndUIKitSlider
//
//  Created by Nikita Batrakov on 31.01.2022.
//

import SwiftUI

struct SliderView: UIViewRepresentable {
    @Binding var currentValue: Double
    let opacity: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = Float(currentValue)
        slider.thumbTintColor = .red
            .withAlphaComponent(CGFloat(opacity) / 100)
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.sliderValueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(currentValue)
        uiView.thumbTintColor = .red
            .withAlphaComponent(CGFloat(opacity) / 100)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(currentValue: $currentValue)
    }
}

extension SliderView {
    class Coordinator: NSObject {
        @Binding var currentValue: Double
        
        init(currentValue: Binding<Double>) {
            self._currentValue = currentValue
        }
        
        @objc func sliderValueChanged(_ sender: UISlider) {
            let step: Float = 1.0
            
            currentValue = Double(round(sender.value / step) * step)
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(currentValue: .constant(50), opacity: 50)
    }
}
