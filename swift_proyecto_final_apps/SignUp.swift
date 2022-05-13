//
//  SignUp.swift
//  swift_proyecto_final_apps
//
//  Created by Bryan Vargas on 27/04/22.
//

import SwiftUI

struct SignUp: View {
  @State var emailregistro = ""
  @State var passwordregistro = ""
  var body: some View {

      VStack{
        Image("logo")
            .resizable()
            .scaledToFit()
            .frame(width: 200)
        TextField("Email", text: $emailregistro)
            .padding()
            .background(Color.white)
            .cornerRadius(3)
        SecureInputView("Password", text: $passwordregistro)
            .padding()
            .background(Color.white)
            .cornerRadius(3)
        Spacer()
            .frame(height: 70)
        Button {
        }
        label: {
            Text("Registrarse")
        }
        .frame(width: 200)
        .padding()
        .foregroundColor(.white)
        .background(.yellow)
        .cornerRadius(10)
      }// fin VStack
    .navigationBarTitle("Registro")
    .foregroundColor(.blue)
  }

}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
