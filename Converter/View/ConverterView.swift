//
//  Converter_View.swift
//  Converter
//
//  Created by Владик Лесовичок on 30.11.2023.
//  Review code by Белозерская водка
//

import SwiftUI

struct ConverterView: View {
    
    var pickList: [any Converter]
    @State var selectedConverter: String
    @State var firstInput: String = ""
    @State var secondInput: String = ""
    
    @State var firstInputChange: Bool = false
    @State var secondInputChange: Bool = false
    
    @State var inputVal: String = ""
    @State var outputVal: String = ""
    
    @StateObject var ConvVM: ConverterVM = ConverterVM()
    
    init(pickList: [any Converter]) {
        self.pickList = pickList
        self.selectedConverter = self.pickList[0].id
        inputVal = pickList.filter({$0.id == selectedConverter}).first!.text.components(separatedBy: " ")[0]
        outputVal = pickList.filter({$0.id == selectedConverter}).first!.text.components(separatedBy: " ")[2]
    }
    var body: some View {
        VStack{
            NavigationStack{
                Form{
                    Section{
                        Picker("Конвертер", selection: $selectedConverter) {
                            ForEach(pickList, id: \.id) { pick in
                                Text(pick.text)
                            }
                        }
                        .onChange(of: selectedConverter, {
                            if secondInputChange{
                                if let val: Double = Double(secondInput){
                                    let converter: any Converter = pickList.filter({$0.id == selectedConverter}).first!
                                    firstInput = self.ConvVM.getValue(val: converter.from(int: val))
                                }
                                else{
                                    firstInput = String(0.0)
                                }
                            }
                            if firstInputChange{
                                if let val: Double = Double(firstInput){
                                    let converter: any Converter = pickList.filter({$0.id == selectedConverter}).first!
                                    secondInput = self.ConvVM.getValue(val: converter.into(int: val))
                                }
                                else{
                                    secondInput = String(0.0)
                                }
                            }
                        })
                    }
                    Section{
                        Text("Значение \(pickList.filter({$0.id == selectedConverter}).first!.text.components(separatedBy: " ")[0])")
                        TextField("", text: $firstInput, prompt: Text("Значение"))
                            .onTapGesture {
                                secondInputChange = false
                                firstInputChange = true
                            }
                            .onChange(of: firstInput, {
                                if firstInputChange{
                                    if let val: Double = Double(firstInput){
                                        let converter: any Converter = pickList.filter({$0.id == selectedConverter}).first!
                                        secondInput = self.ConvVM.getValue(val: converter.into(int: val))
                                    }
                                    else{
                                        secondInput = String(0.0)
                                    }
                                }
                            })
                    }
                    Section{
                        Text("Значение \(pickList.filter({$0.id == selectedConverter}).first!.text.components(separatedBy: " ")[2])")
                        TextField("", text: $secondInput, prompt: Text("Значение"))
                            .onTapGesture {
                                secondInputChange = true
                                firstInputChange = false
                            }
                            .onChange(of: secondInput, {
                                if secondInputChange{
                                    if let val: Double = Double(secondInput){
                                        let converter: any Converter = pickList.filter({$0.id == selectedConverter}).first!
                                        firstInput = self.ConvVM.getValue(val: converter.from(int: val))
                                    }
                                    else{
                                        firstInput = String(0.0)
                                    }
                                }
                            })
                    }
                    Section{
                        Text(selectedConverter)
                    }
                }
            }
            .navigationTitle("Конвертер")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    ConverterView(pickList: [Mass_Kilo_Gramms(), Mass_Kilo_Pounds()])
}
