//
//  ConverterViewModel.swift
//  Converter
//
//  Created by Владислав Лесовой on 29.11.2023.
//

import SwiftUI

extension ConverterView{
    @MainActor class ConverterVM : ObservableObject{
        
        func getValue(val: Double) -> String{
            if val.truncatingRemainder(dividingBy: 1) != 0{
                return String(round(val * 1000) / 1000)
            }
            return String(val)
        }
    }
}
