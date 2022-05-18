//
//  Carrito.swift
//  swift_proyecto_final_apps
//
//  Created by Bryan Vargas on 13/05/22.
//

import SwiftUI

struct Carrito: View {
    @EnvironmentObject var vistamodelo: ViewModel
    @Binding var userid: String
    var body: some View {
        VStack {
            Text("Carrito \(userid)")
        }
        .onAppear {
            vistamodelo.getProductosCarrito()
        }
    }
}

struct Carrito_Previews: PreviewProvider {
    static var previews: some View {
        Carrito(userid: .constant(""))
    }
}
