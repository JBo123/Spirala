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
 
    
    var body: some View {
        Text(valueA + valueN)
      
       
        draw(valueA: valueA, valueN: valueN, stateX: stateX, stateY: stateY)
            .stroke(.blue, lineWidth: 1)
        
        
    }
}

/*func draw(valueA: String, valueN: String, stateX: Bool, stateY: Bool) -> Path {
    
    //x*10
    // start je 10px
    // po prvni 10 px
    // po druhe
    
    
    let startValue = 10
    var path = Path()
    path.move(to: CGPoint(x: Int(startValue), y: Int(startValue)))
    path.addLine(to: CGPoint(x: 100+startValue, y: startValue))
    path.addLine(to: CGPoint(x: 100 + startValue, y: 100 + startValue))
    path.addLine(to: CGPoint(x: 40, y: 100 + startValue))
    path.addLine(to: CGPoint(x: 40, y: 40))

    //path.closeSubpath()
        return path
}*/

func draw(valueA: String, valueN: String, stateX: Bool, stateY: Bool) -> Path {
    
    //x*10
    // start je 10px
    // po prvni 10 px
    // po druhe
    //var a = Int(valueA)
    // var n = Int(valueN)
    
    let startValue = 10
    var path = Path()
    guard let a = Int(valueA) else {
           return path
       }
    guard let n = Int(valueA) else {
           return path
       }
    path.move(to: CGPoint(x: startValue, y: startValue))
    path.addLine(to: CGPoint(x: startValue + a, y: startValue))
    path.addLine(to: CGPoint(x: startValue + a, y:  startValue + a))
    path.addLine(to: CGPoint(x: 40, y: 100 + startValue))
    path.addLine(to: CGPoint(x: 40, y: 40))

    //path.closeSubpath()
        return path
}
    

struct DrwaingView_Previews: PreviewProvider {
    static var previews: some View {

        DrwaingView(valueA: .constant("50") , valueN: .constant("50"))
        
    }
}
