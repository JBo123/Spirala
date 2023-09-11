//
//  DrwaingView.swift
//  Spirala
//
//  Created by Jakub Klucký on 08.09.2023.
//

import SwiftUI

struct DrwaingView: View {
    
    @Binding var valueA: String
    @Binding var valueN: String
    @State var stateX: Bool = true
    @State var stateY: Bool = false
    @State var x = ""
    
    var body: some View {
        
        Text(valueA + valueN)
        
        draw(valueA: valueA, valueN: valueN, stateX: stateX, stateY: stateY)
            .stroke(.blue, lineWidth: 1)
    }
}

func draw(valueA: String, valueN: String, stateX: Bool, stateY: Bool) -> Path {
    
    var counter = 0
    var sideSwitch = true
    var ANSwitch = true
    var x = 10
    var y = 10
    
    var path = Path()
    guard var a = Int(valueA)  else {
        return path
    }
    
    guard var n = Int(valueN) else {
        return path
    }
    guard var baseN = Int(valueN) else {
        return path
    }
    a = a * 10
    n = n * 10
    baseN = baseN * 10

    
    path.move(to: CGPoint(x: x, y: y))
    
    while(true){
        if a < n {
            break
        }
        
        if ANSwitch == true {
            
            if sideSwitch == true {
                x = a + 10
            } else {
                y = a + 10
            }
            
            path.addLine(to: CGPoint(x: x, y: y))
            
        } else {
            if sideSwitch == true {
                x = n + 10
            } else {
                y = n + 10
            }
            path.addLine(to: CGPoint(x: x , y: y))
        }
        
        sideSwitch.toggle()
        counter = counter + 1
        
        if counter == 2{
            if ANSwitch == true{
                a = a - baseN
            } else {
                n = n + baseN
            }
            counter = 0
            ANSwitch.toggle()
        }
    }
    return path
}

struct DrwaingView_Previews: PreviewProvider {
    static var previews: some View {
        
        DrwaingView(valueA: .constant("50") , valueN: .constant("50"))
        
    }
}
