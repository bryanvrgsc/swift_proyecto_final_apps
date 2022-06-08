//
//  VistaProductoSin.swift
//  swift_proyecto_final_apps
//
//  Created by Bryan Vargas on 19/05/22.
//

import SwiftUI

struct VistaProductoSin: View {
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

        }.padding() // fin VStack
            .navigationBarTitle(
                "\(producto)")
    }
}
