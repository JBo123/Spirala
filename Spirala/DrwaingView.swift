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
 
    
    var body: some View {
        Text(valueA + valueN)
      
       
        draw(valueA: valueA, valueN: 1)
            .stroke(.blue, lineWidth: 1)
        
        
    }
}

func draw(valueA: String, valueN: Int) -> Path {
    
    var path = Path()
    path.move(to: CGPoint(x: Int(valueA) ?? 5000, y: 100))
    path.addLine(to: CGPoint(x: 100, y: 300))
    path.addLine(to: CGPoint(x: 300, y: 300))
    path.addLine(to: CGPoint(x: 200, y: 100))
    path.closeSubpath()
        return path
}
    

struct DrwaingView_Previews: PreviewProvider {
    static var previews: some View {

        DrwaingView(valueA: .constant("0") , valueN: .constant("5") )
        
    }
}
