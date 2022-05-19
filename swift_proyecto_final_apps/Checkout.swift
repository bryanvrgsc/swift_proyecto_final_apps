//
//  Checkout.swift
//  swift_proyecto_final_apps
//
//  Created by Bryan Vargas on 19/05/22.
//

import SwiftUI

struct Checkout: View {
  @EnvironmentObject var vistamodelo: ViewModel
  @Binding var userid: String
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct Checkout_Previews: PreviewProvider {
    static var previews: some View {
      Checkout(userid: .constant(""))
    }
}
