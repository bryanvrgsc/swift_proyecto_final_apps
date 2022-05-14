//
//  LogIn.swift
//  swift_proyecto_final_apps
//
//  Created by Bryan Vargas on 13/05/22.
//

import SwiftUI

struct LogIn: View {
  @State var email = ""
  @State var password = ""
//  @Binding var isLoggedIn: Bool
    var body: some View {
      NavigationView {
          VStack {
              Image("logo")
                  .resizable()
                  .scaledToFit()
                  .frame(width: 200)
              TextField("Email", text: $email)
                  .padding()
                  .background(Color.white)
                  .cornerRadius(3)
              SecureInputView("Password", text: $password)
                  .padding()
                  .background(Color.white)
                  .cornerRadius(3)
              Spacer()
                  .frame(height: 70)
              Button {
              }
              label: {
                  Text("Iniciar sesión")
              }
              .frame(width: 200)
              .padding()
              .foregroundColor(.white)
              .background(.yellow)
              .cornerRadius(10)

              NavigationLink(
                  destination: ContentView(),
                  label: {
                      VStack {
                          Text("Continuar sin iniciar sesión")
                          .frame(width: 200)
                          .padding()
                          .foregroundColor(.blue)
                          .background(.white)
                          .cornerRadius(10)
                      }
                  })


          }.padding()
              .navigationBarTitle("Inicio de Sesión")
              .navigationBarItems(trailing: BotonRegistrarse)
               .foregroundColor(.blue)
      }
      Spacer()
        .navigationBarBackButtonHidden(true)
    }
  var BotonRegistrarse: some View {
      NavigationLink(
          destination: SignUp(),
          label: {
              Text("Registrarse")
          })
  }
}

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
      LogIn(email: "", password: "")
    }
}
