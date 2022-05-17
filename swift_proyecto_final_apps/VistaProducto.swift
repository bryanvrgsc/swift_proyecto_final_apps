//
//  VistaProducto.swift
//  swift_proyecto_final_apps
//
//  Created by Bryan Vargas on 16/05/22.
//

import SwiftUI

struct VistaProducto: View {
    @EnvironmentObject var vistamodelo: ViewModel
    @State var producto = "0"
    @State var foto = "0"
    @State var cantidad = "0"
    @State var id_producto = -1

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

        }.padding() // fin VStack
            .navigationBarTitle(
                "\(producto)")
    }
}
