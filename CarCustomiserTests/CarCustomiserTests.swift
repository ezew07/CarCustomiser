//
//  CarCustomiserTests.swift
//  CarCustomiserTests
//
//  Created by William Eze on 10/01/2024.
//

import XCTest
@testable import CarCustomiser

final class CarCustomiserTests: XCTestCase {
    
    func testNewCarGivesANewCarWithAllAttributes() {
        // arrange
        // act
        let car = Car(make:"Porsche", model:"Taycan", topSpeed:130, acceleration: 7.9, handling: 7, torque: 12)
        
        // assert
        XCTAssertEqual(car.make, "Porsche")
        XCTAssertEqual(car.model, "Taycan")
        XCTAssertEqual(car.topSpeed, 130)
        XCTAssertEqual(car.acceleration, 7.9)
        XCTAssertEqual(car.handling, 7)
    }
    
//    func testDisplayStatsMethodCanBeCalledOnInstanceOfCar(){
//        //arrange
//        let sut = Car(make:"Porsche", model:"Taycan", topSpeed:130, acceleration: 7.9, handling: 7)
//        let expected = "Porsche"
//        
//        // act
//        let actual = sut.displayStats()
//        
//        //assert
//        XCTAssertEqual(actual, expected)
//    }
    
    func testDisplayStatsMethodReturnsValidMultiLineString() {
        // arrange
        let sut = Car(make:"Porsche", model:"Taycan", topSpeed:130, acceleration: 7.9, handling: 7, torque: 12)
        let expected = """
        Make: Porsche
        Model: Taycan
        Top speed: 130
        Acceleration (0-60): 7.9
        Handling: 7
        """
        
        // act
        let actual = sut.displayStats()
        
        // assert
        XCTAssertEqual(expected, actual)

    }
    
}
