//
//  ContentView.swift
//  CarCustomiser
//
//  Created by William Eze on 10/01/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var starterCars = StarterCars()
    @State private var selectedCar = 0 {
        didSet{
            if selectedCar >= self.starterCars.cars.count - 1{
                selectedCar = 0
            }
        }
    }
    @State private var exhaustPackage = false
    @State private var tyresPackage = false
    @State private var turboChargerPackage = false
    @State private var gearRatioPackage = false
    @State private var remainingFunds = 1000
    @State private var shouldToggleStayOn = false
    @State private var remainingTime = 30

    
    var exhuastPackageToggle: Bool {
        return exhaustPackage ? true : remainingFunds >= 300 ? true : false
    }
    var tyresPackageToggle: Bool {
        return tyresPackage ? true: remainingFunds >= 200 ? true : false
    }
    var turboChargePackageToggle: Bool {
        return turboChargerPackage ? true : remainingFunds >= 500 ? true : false
    }
    var gearRatioPackageToggle: Bool {
        return gearRatioPackage ? true : remainingFunds >= 1000 ? true : false
    }
    
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()


    var body: some View {
        Text("\(remainingTime)")
            .onReceive(timer, perform: { _ in
                if remainingTime > 0{
                    remainingTime -= 1
                }
            })
            .foregroundColor(.red)
        let exhaustPackageBinding = Binding<Bool>(
            get: {self.exhaustPackage},
            set: { newValue in
                self.exhaustPackage = newValue
                if newValue == true{
                    starterCars.cars[selectedCar].topSpeed += 5
                    remainingFunds -= 300
                }else{
                    starterCars.cars[selectedCar].topSpeed -= 5
                    remainingFunds += 300

                }
                
            }
        )
        let tyresPackageBinding = Binding<Bool>(
            get: {self.tyresPackage},
            set: { newValue in
                self.tyresPackage = newValue
                if newValue == true{
                    starterCars.cars[selectedCar].handling += 2
                    remainingFunds -= 200
                }else{
                    starterCars.cars[selectedCar].handling -= 2
                    remainingFunds += 200

                }
                
            }
        )
        let turboChargerPackageBinding = Binding<Bool>(
            get: {self.turboChargerPackage},
            set: { newValue in
                self.turboChargerPackage = newValue
                if newValue == true{
                    starterCars.cars[selectedCar].torque += 170
                    remainingFunds -= 500

                }else{
                    starterCars.cars[selectedCar].torque -= 170
                    remainingFunds += 500

                }
                
            }
        )
        let gearRatioPackageBinding = Binding<Bool>(
            get: {self.gearRatioPackage},
            set: { newValue in
                self.gearRatioPackage = newValue
                if newValue == true{
                    starterCars.cars[selectedCar].acceleration -= 1
                    remainingFunds -= 1000
                }else{
                    starterCars.cars[selectedCar].acceleration += 1
                    remainingFunds += 1000

                }
                
            }
        )

        VStack{
            Form{
                VStack(alignment: .leading, spacing: 20) {
                    Text("Hello, welcome to the car customiser app!")
                    Text(starterCars.cars[selectedCar].displayStats())
                    Button("Next Car", action: {
                        selectedCar += 1
                        resetDisplay()
                    })
                    .disabled({
                        return remainingTime == 0 ? true : false
                    }())
                }
                Section{
                    Toggle("Exhaust package (Cost:300)", isOn: exhaustPackageBinding)
                        .disabled({
                            return remainingTime == 0 ? true : !exhuastPackageToggle
                        }())
                    Toggle("Tyres package (Cost:200)", isOn: tyresPackageBinding)
                        .disabled({
                            return remainingTime == 0 ? true : !tyresPackageToggle
                        }())
                    Toggle("Turbocharger package (Cost:500)", isOn: turboChargerPackageBinding)
                        .disabled({
                            return remainingTime == 0 ? true : !turboChargePackageToggle
                        }())
                    Toggle("Gear ratio package (Cost:1000)", isOn: gearRatioPackageBinding)
                        .disabled({
                            return remainingTime == 0 ? true : !gearRatioPackageToggle
                        }())
                }
            }
            Text("Remaining funds: \(remainingFunds)")
                .foregroundStyle(.red)
        }

        .padding()
    }
    
    func resetDisplay(){
        exhaustPackage = false
        tyresPackage = false
        turboChargerPackage = false
        gearRatioPackage = false
        remainingFunds = 1000
        starterCars = StarterCars()
    }
}

#Preview {
    ContentView()
}
