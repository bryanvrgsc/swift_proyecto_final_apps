//
//  Finalizado.swift
//  swift_proyecto_final_apps
//
//  Created by Bryan Vargas on 19/05/22.
//

import SwiftUI

struct Finalizado: View {
    var body: some View {
      VStack{
        Spacer()
        
        Text("Pedido con éxito")
        .frame(width: 200)
        .padding()
        .foregroundColor(.white)
        .background(.black)
        .cornerRadius(10)
        Spacer()
      }


    }
}

struct Finalizado_Previews: PreviewProvider {
    static var previews: some View {
        Finalizado()
    }
}
