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
    
    var exhuastPackageToggle: Bool {
        if exhaustPackage == true{
            return true
        }
        if remainingFunds >= 300{
            return true
        }
        else{
            return false
        }
    }
    var tyresPackageToggle: Bool {
        if tyresPackage == true{
            return true
        }
        if remainingFunds >= 200{
            return true
        }
        else{
            return false
        }
    }
    var turboChargePackageToggle: Bool {
        if turboChargerPackage == true{
            return true
        }
        if remainingFunds >= 500{
            return true
        }
        else{
            return false
        }
    }
    var gearRatioPackageToggle: Bool {
        if gearRatioPackage == true{
            return true
        }
        if remainingFunds >= 1000{
            return true
        }
        else{
            return false
        }
    }


    var body: some View {
        
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
                }
                Section{
                    Toggle("Exhaust package (Cost:300)", isOn: exhaustPackageBinding)
                        .disabled(!exhuastPackageToggle)
                    Toggle("Tyres package (Cost:200)", isOn: tyresPackageBinding)
                        .disabled(!tyresPackageToggle)
                    Toggle("Turbocharger package (Cost:500)", isOn: turboChargerPackageBinding)
                        .disabled(!turboChargePackageToggle)
                    Toggle("Gear ratio package (Cost:1000)", isOn: gearRatioPackageBinding)
                        .disabled(!gearRatioPackageToggle)
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
