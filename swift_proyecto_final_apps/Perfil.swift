//
//  Perfil.swift
//  swift_proyecto_final_apps
//
//  Created by Bryan Vargas on 13/05/22.
//

import SwiftUI

struct Perfil: View {
  @Environment(\.dismiss) var regresa
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .navigationBarItems(trailing: BotonCerrarSesion)
    }
  var BotonCerrarSesion: some View {
    Button(action: {
               regresa()
           },
           label: {
               Text("Guardar")
           })

  //  @Environment(\.dismiss) var regresa
  //    Button(action: {
  //               regresa()
  //           },
  //           label: {
  //               Text("Cerrar Sesión")
  //           })
  //    NavigationLink(
  //        destination: ContentView(isLoggedIn: false),
  //
  //        label: {
  //            Text("Cerrar Sesión")
  //        }
  //    )
  }
}



struct Perfil_Previews: PreviewProvider {
    static var previews: some View {
        Perfil()
    }
}
