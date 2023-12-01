//
//  Button_View.swift
//  Converter
//
//  Created by Владислав Лесовой on 30.11.2023.
//

import SwiftUI

struct Button_View: View {

    let img: String
    let name: String
    
    init(image: String, nam: String) {
        img = image
        name = nam
    }
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25)
                .fill(.white)
                .shadow(radius: 5)
                .frame(width: 150, height: 150)
            VStack{
                Image(img)
                    .resizable()
                    .frame(width: 120, height: 120)
                Text(name)
                    .font(.custom("Roboto", size: 16))
            }
        }
    }
}

#Preview {
    Button_View(image: "Mass_Pic", nam: "Масса")
}
