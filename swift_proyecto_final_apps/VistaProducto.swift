//
//  VistaProducto.swift
//  swift_proyecto_final_apps
//
//  Created by Bryan Vargas on 16/05/22.
//

import SwiftUI

struct VistaProducto: View {
    @EnvironmentObject var vistamodelo: ViewModel
    @State var producto   = "0"
    @State var foto       = "0"
    @State var precio     = ""
    @State var cantidad   = "0"
    @State var productoid = ""
    @State var userid     = ""

    @Environment(\.dismiss) var regresa
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: URL(string: foto)) {
                image in image
                    .resizable()
                    .scaledToFit()
            } placeholder: {
                ProgressView()
            }
            Spacer()
                .frame(height: 10)
            HStack {
                Spacer()
                Text("$\(precio)")
                .font(.system(.title, design: .rounded))
                    .fontWeight(.black)
                Spacer()
            }

            Spacer()
                .frame(height: 10)
            HStack {
                Spacer()
                Button {
                    let params: [String: Any] = [
                        "username": self.userid,
                        "producto": self.productoid,
                    ]
                    vistamodelo.postAgregarProductoCarrito(parameters: params)
                }
                label: {
                    Text("Agregar al carrito")
                }
                .frame(width: 200)
                .padding()
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10)
                Spacer()
            }

            Spacer()

        }.padding() // fin VStack
            .navigationBarTitle(
                "\(producto)")
    }
}
