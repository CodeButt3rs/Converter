//
//  SwiftUIView.swift
//  Converter
//
//  Created by Владислав Лесовой on 29.11.2023.
//

import SwiftUI

struct MainWindow: View {
    
    let massList: [any Converter] = [Mass_Kilo_Gramms(), Mass_Kilo_Pounds(), Mass_Pounds_Gramms()]
    let currencyList: [any Converter] = [Currency_Dollar_Rouble(), Currency_Dollar_Euro(), Currency_Euro_Rouble()]
    let distanceList: [any Converter] = [Distance_KiloMeters_Miles(), Distance_KiloMeters_Feet(), Distance_Miles_Feet()]
    let tempList: [any Converter] = [Temperature_Celsius_Fahrenheit(), Temperature_Celsius_Celvin(), Temperature_Celvin_Fahrenheit()]
    let squareList: [any Converter] = [Mass_Kilo_Gramms(), Mass_Kilo_Pounds(), Mass_Pounds_Gramms()]
    
    var body: some View {
        NavigationView{
            VStack(spacing: 25){
                Text("Конвертеры")
                    .font(.largeTitle)
                HStack(spacing: 25){
                    NavigationLink{ ConverterView(pickList: massList) } label: { Button_View(image: "Mass_Pic", nam: "Масса") }
                    NavigationLink{ ConverterView(pickList: currencyList) } label: { Button_View(image: "Currency_Pic", nam: "Валюта") }
                }
                HStack(spacing: 25){
                    NavigationLink{ ConverterView(pickList: distanceList) } label: { Button_View(image: "Distance_Pic", nam: "Дистанция") }
                    NavigationLink{ ConverterView(pickList: tempList) } label: { Button_View(image: "Temp_Pic", nam: "Температура") }
                }
                HStack(spacing: 25){
                    NavigationLink{ ConverterView(pickList: squareList) } label: { Button_View(image: "Square_Pic", nam: "Площадь") }
                }
            }
            .navigationTitle("Главная")
        }
        .frame(alignment: .top)
    }
}

#Preview {
    MainWindow()
}
