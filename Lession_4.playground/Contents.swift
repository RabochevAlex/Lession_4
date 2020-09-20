
import UIKit

enum doorStats {
    case open
    case close
}

enum EngineStats {
    case Start
    case Stop
}

enum lightStats {
    case on
    case off
}

enum driver {
    case man, woman
}

enum hatchstate {
    case open, close
    
}

class car {
    let model: String
    let year: UInt
    let trunkSize: Double
    let bodySize: Double
    var trunkCargo: Double
    var bodyCargo: Double
    var lightStatus: lightStats
    var typeDriver: driver
    
    var doorStatus: doorStats {
        willSet {
            if newValue == .open {
                print("Двери сейчас откроются")
            } else {
                print("Двери сейчас закроются")
            }
        }
    }
    var engineStatus:EngineStats{
        willSet {
            if newValue == .Start {
                print("Машина будет заведена")
            } else {
                print("Машина остановлена")
            }
        }
    }
    
    init(model: String, year: UInt, trunkSize: Double, bodySize: Double, trunkCargo: Double, bodyCargo: Double, lightStatus: lightStats, doorStatus:doorStats, engineStatus: EngineStats, typeDriver: driver) {
        self.model = model
        self.year = year
        self.trunkSize = trunkSize
        self.bodySize = bodySize
        self.trunkCargo = trunkCargo
        self.bodyCargo = bodyCargo
        self.lightStatus = lightStatus
        self.doorStatus = doorStatus
        self.typeDriver = typeDriver
        self.engineStatus = engineStatus
    }
    
    func EngineUse (engineStatus: EngineStats) {
        if engineStatus == .Start {
            print("Включен свет")
            self.lightStatus = .on
        } else {
            print("Выключен свет")
            self.lightStatus = .off
        }
    }
}

class SportCar: car {
    let seats: Int
    
    init(seats: Int, model: String, year: UInt, trunkSize: Double, bodySize: Double, trunkCargo: Double, bodyCargo: Double, lightStatus: lightStats, doorStatus:doorStats, engineStatus: EngineStats, typeDriver: driver = .man) {
        
        self.seats = seats
        
        super.init(model: model, year: year, trunkSize: trunkSize, bodySize: bodySize, trunkCargo: trunkCargo, bodyCargo: bodyCargo, lightStatus: lightStatus, doorStatus:doorStatus, engineStatus: engineStatus, typeDriver:typeDriver)
    }
}




class TruckCar: car {
    let tonnage: Int
    var hatch: hatchstate
    
    init(hatch: hatchstate, tonnage: Int, model: String, year: UInt, trunkSize: Double, bodySize: Double, trunkCargo: Double, bodyCargo: Double, lightStatus: lightStats, doorStatus:doorStats, engineStatus: EngineStats, typeDriver: driver = .man) {
        
        self.tonnage = tonnage
        self.hatch = hatch
        
        super.init(model: model, year: year, trunkSize: trunkSize, bodySize: bodySize, trunkCargo: trunkCargo, bodyCargo: bodyCargo, lightStatus: lightStatus, doorStatus:doorStatus, engineStatus: engineStatus, typeDriver:typeDriver)
    }
    func changeHatchOpen() {
        hatch = .open
    }
    
    func changeHatchClose() {
        hatch = .close
    }
    
}


var sportCar1 = SportCar(seats: 2, model: "Porsch", year: 2020, trunkSize: 800, bodySize: 1650, trunkCargo: 0, bodyCargo: 0, lightStatus: .off, doorStatus:.close, engineStatus: .Stop)

sportCar1.EngineUse(engineStatus: .Start)
sportCar1.typeDriver

var truckCar1 = TruckCar(hatch: .open, tonnage: 10000, model: "MAN", year: 2020, trunkSize: 800, bodySize: 1650, trunkCargo: 0, bodyCargo: 0, lightStatus: .off, doorStatus:.close, engineStatus: .Stop)
truckCar1.EngineUse(engineStatus: .Start)
truckCar1.typeDriver
truckCar1.changeHatchClose()
truckCar1.hatch
truckCar1.changeHatchOpen()
truckCar1.hatch







