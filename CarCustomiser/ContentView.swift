//
//  ContentView.swift
//  CarCustomiser
//
//  Created by William Eze on 10/01/2024.
//

import SwiftUI

struct ContentView: View {
    var car = Car(make: "Porsche", model: "Taycan", topSpeed: 130, acceleration: 7.9, handling: 7)

    var body: some View {
        VStack {
            Text("Hello, welcome to the car customiser app!")
            Text("Make: \(car.displayStats().make)")
            Text("Model: \(car.displayStats().model)")
            Text("Top speed: \(car.displayStats().topSpeed)mph")
            Text("Acceleration (0-60): \(car.displayStats().acceleration)")
            Text("Handling: \(car.displayStats().handling)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
