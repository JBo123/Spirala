//
//  DrawingNoRecursiveView.swift
//  Spirala
//
//  Created by Jakub Klucký on 11.09.2023.
//

import SwiftUI

struct DrawingNoRecursiveView: View {
    
    @Binding var valueA: String
    @Binding var valueN: String
    
    @State var stateX: Bool = true
    @State var stateY: Bool = false
    @State var x = ""
    
    var body: some View {
        
        Text(valueA + valueN)
        
        draw2(valueA: valueA, valueN: valueN, stateX: stateX, stateY: stateY)
            .stroke(.blue, lineWidth: 1)
    }
}

func draw2(valueA: String, valueN: String, stateX: Bool, stateY: Bool) -> Path {
        let counter = 0
        let sideSwitch = true
        let ANSwitch = true
        let x = 10
        let y = 10
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
        
        if a < n {
            return path
        }else{
            
            path = recursionDraw(counter: counter, sideSwitch: sideSwitch, ANSwitch: ANSwitch, x: x, y: y, path: path, a: a, n: n, baseN: baseN)
        }
    
    return path
}
func recursionDraw(counter: Int,
                   sideSwitch: Bool,
                   ANSwitch: Bool,
                   x: Int, y: Int,
                   path: Path,
                   a: Int,
                   n: Int,
                   baseN: Int) -> Path{
    
    var x = x
    var y = y
    var path = path
    var sideSwitch = sideSwitch
    var ANSwitch = ANSwitch
    var a = a
    var n = n
    var counter = counter
    var baseN = baseN

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
    if a < n {
        return path
    }
    
    return recursionDraw(counter: counter, sideSwitch: sideSwitch, ANSwitch: ANSwitch, x: x, y: y, path: path, a: a, n: n, baseN: baseN)
}

struct DrawingNoRecursiveView_Previews: PreviewProvider {
    static var previews: some View {
        DrawingNoRecursiveView(valueA: .constant("10"), valueN: .constant("2"))
    }
}

