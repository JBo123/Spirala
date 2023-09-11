//
//  ContentView.swift
//  Spirala
//
//  Created by Jakub Klucký on 08.09.2023.
//

import SwiftUI

struct ContentView: View {
   @State var valueA: String
   @State var valueN: String
    var body: some View {
        
        NavigationView {
            
            
            VStack {
                HStack{
                    TextField("hrana v px 1:10 ratio...", text: $valueA)
                        .keyboardType(.numberPad)
                        .onChange(of: valueA) { value in
                                guard let number = Int(value), number < 38 else {
                                    self.valueA = ""
                                    return
                                }
                                self.valueA = String(number)
                            }
                    TextField("mezery v px 1:10 ratio...", text: $valueN)
                        .keyboardType(.numberPad)
                        .onChange(of: valueN) { value in
                                guard let number = Int(value), number < 19 else {
                                    self.valueN = ""
                                    return
                                }
                                self.valueN = String(number)
                            }
                    
                }
                NavigationLink("Draw", destination: DrwaingView(valueA: $valueA, valueN: $valueN))
                    .padding()
                    
                
                Spacer()
                
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(valueA: "5", valueN: "1")
    }
}
