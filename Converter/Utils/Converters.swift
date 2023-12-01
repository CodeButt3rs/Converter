//
//  Converters.swift
//  Converter
//
//  Created by Владислав Лесовой on 29.11.2023.
//

import Foundation


enum Converters {
    case Mass
    case Distance
    case Currency
    case Temperature
    case Square
}
//
//enum MassConverter{
//    case Kilogramms
//    case Pounds
//    case Gramms
//}
//
//enum Distance{
//    case Meters
//    case Miles
//    case Feet
//}
//
//enum Currency{
//    case Dollar
//    case Rouble
//    case Pound
//}
//
//enum Temperature{
//    case Celsius
//    case Kelvin
//    case Fahrenheit
//}
//
//enum Square{
//    case Meters
//    case Miles
//    case Feet
//}
protocol Converter: Identifiable, Hashable{
    
    var id: String {get}
    var type: Converters { get set }
    var value: Double {get set}
    var text: String {get set}
    
    func into(int: Double) -> Double
    func from(int: Double) -> Double
}

// MARK: - MASS CONVERTERS
struct Mass_Kilo_Pounds: Converter{
    func into(int: Double) -> Double {
        return int * value
    }
    
    func from(int: Double) -> Double {
        return int / value
    }
    
    var id: String {
        get{
            return text + String(value)
        }
    }
    
    var type: Converters = Converters.Mass
    var value: Double = 2.205
    var text: String = "Килограммы в Фунты"
}
struct Mass_Kilo_Gramms: Converter{
    func into(int: Double) -> Double {
        return int * value
    }
    
    func from(int: Double) -> Double {
        return int / value
    }
    
    var id: String {
        get{
            return text + String(value)
        }
    }
    var type: Converters = Converters.Mass
    var value: Double = 1000
    var text: String = "Килограммы в Граммы"
}
struct Mass_Pounds_Gramms: Converter{
    func into(int: Double) -> Double {
        return int * value
    }
    
    func from(int: Double) -> Double {
        return int / value
    }
    var id: String {
        get{
            return text + String(value)
        }
    }
    var type: Converters = Converters.Mass
    var value: Double = 453.592
    var text: String = "Фунты в Граммы"
}

// MARK: - CURRENCY CONVERTERS
struct Currency_Dollar_Rouble: Converter{
    func into(int: Double) -> Double {
        return int * value
    }
    
    func from(int: Double) -> Double {
        return int / value
    }
    var id: String {
        get{
            return text + String(value)
        }
    }
    var type: Converters = Converters.Mass
    var value: Double = 89.9
    var text: String = "Доллар в Рубль"
}
struct Currency_Dollar_Euro: Converter{
    func into(int: Double) -> Double {
        return int * value
    }
    
    func from(int: Double) -> Double {
        return int / value
    }
    var id: String {
        get{
            return text + String(value)
        }
    }
    var type: Converters = Converters.Mass
    var value: Double = 0.92
    var text: String = "Доллар в Евро"
}
struct Currency_Euro_Rouble: Converter{
    func into(int: Double) -> Double {
        return int * value
    }
    
    func from(int: Double) -> Double {
        return int / value
    }
    var id: String {
        get{
            return text + String(value)
        }
    }
    var type: Converters = Converters.Mass
    var value: Double = 97.93
    var text: String = "Евро в Рубль"
}

// MARK: - DISTANCE CONVERTERS
struct Distance_KiloMeters_Miles: Converter{
    func into(int: Double) -> Double {
        return int * value
    }
    
    func from(int: Double) -> Double {
        return int / value
    }
    var id: String {
        get{
            return text + String(value)
        }
    }
    var type: Converters = Converters.Distance
    var value: Double = 0.621371
    var text: String = "Километры в Мили"
}

struct Distance_KiloMeters_Feet: Converter{
    func into(int: Double) -> Double {
        return int * value
    }
    
    func from(int: Double) -> Double {
        return int / value
    }
    var id: String {
        get{
            return text + String(value)
        }
    }
    var type: Converters = Converters.Distance
    var value: Double = 3281
    var text: String = "Километры в Футы"
}

struct Distance_Miles_Feet: Converter{
    func into(int: Double) -> Double {
        return int * value
    }
    
    func from(int: Double) -> Double {
        return int / value
    }
    var id: String {
        get{
            return text + String(value)
        }
    }
    var type: Converters = Converters.Distance
    var value: Double = 5280
    var text: String = "Футы в Мили"
}

// MARK: - TEMPERATURE CONVERTERS
struct Temperature_Celsius_Fahrenheit: Converter{
    func into(int: Double) -> Double {
        return (int * 9/5) + 32
    }
    
    func from(int: Double) -> Double {
        return (int - 32) * 5/9
    }
    var id: String {
        get{
            return text + String(value)
        }
    }
    var type: Converters = Converters.Distance
    var value: Double = 0
    var text: String = "Цельсия в Фаренгейты"
}

struct Temperature_Celsius_Celvin: Converter{
    func into(int: Double) -> Double {
        return int + 273.15
    }
    
    func from(int: Double) -> Double {
        return int - 273.15
    }
    var id: String {
        get{
            return text + String(value)
        }
    }
    var type: Converters = Converters.Distance
    var value: Double = 0
    var text: String = "Цельсия в Кельвины"
}

struct Temperature_Celvin_Fahrenheit: Converter{
    func into(int: Double) -> Double {
        return (int - 273.15) * 9/5 + 32
    }
    
    func from(int: Double) -> Double {
        return (int - 32) * 5/9 + 273
    }
    var id: String {
        get{
            return text + String(value)
        }
    }
    var type: Converters = Converters.Distance
    var value: Double = 0
    var text: String = "Кельвины в Фаренгейты"
}

// MARK: - SQUARE CONVERTERS
struct Square_Kilometers_Miles: Converter{
    func into(int: Double) -> Double {
        return int * value
    }
    
    func from(int: Double) -> Double {
        return int / value
    }
    var id: String {
        get{
            return text + String(value)
        }
    }
    var type: Converters = Converters.Distance
    var value: Double = 0.386102
    var text: String = "Километры в Мили"
}

struct Square_Kilometers_Feets: Converter{
    func into(int: Double) -> Double {
        return int * value
    }
    
    func from(int: Double) -> Double {
        return int / value
    }
    var id: String {
        get{
            return text + String(value)
        }
    }
    var type: Converters = Converters.Distance
    var value: Double = 0
    var text: String = "Километры в Футы"
}

struct Square_Miles_Feets: Converter{
    func into(int: Double) -> Double {
        return int * value
    }
    
    func from(int: Double) -> Double {
        return int / value
    }
    var id: String {
        get{
            return text + String(value)
        }
    }
    var type: Converters = Converters.Distance
    var value: Double = 2.788e+7
    var text: String = "Мили в Футы"
}
