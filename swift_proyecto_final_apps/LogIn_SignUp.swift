//
//  LogIn_SignUp.swift
//  swift_proyecto_final_apps
//
//  Created by Bryan Vargas on 27/04/22.
//

import SwiftUI

struct LogIn_SignUp: View {
//    @EnvironmentObject var mivistamodelo2 : VistaModeloAPI
    @State var email = ""
    @State var password = ""
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
                TextField("Password", text: $password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(3)

//                if !(email.isEmpty) && !(password.isEmpty) {
//                    if(mivistamodelo2.regreso.id ?? 0 != 0){
//                        Text("Id: \(mivistamodelo2.regreso.id ?? 0)")
//                        Text("Token: \(mivistamodelo2.regreso.token ?? "")")
//                    } else {
//                        Text("\(mivistamodelo2.regreso.error ?? "")")
//                    }
//                } else {
//                    Text("\(mivistamodelo2.regreso.error ?? "")")
//                }
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

                Button {
                }
                label: {
                    Text("Continuar sin iniciar sesión")
                }
                .frame(width: 200)
                .padding()
                .foregroundColor(.blue)
                .background(.white)
                .cornerRadius(10)
            }.padding()
                .navigationBarTitle("Inicio de Sesión")
                .navigationBarItems(trailing: BotonGuardar)
                .foregroundColor(.blue)
        }
        Spacer()
    }

    var BotonGuardar: some View {
        Button(action: {
                   let params: [String: Any] = [
                       "email": self.email,
                       "password": self.password,
                   ]
                   print("Los parametros son\n\(params)")
//            mivistamodelo2.apiCall(parameters: params)
               },
               label: {
                   Text("Registrate")
               })
    }
}

struct LogIn_SignUp_Previews: PreviewProvider {
    static var previews: some View {
        LogIn_SignUp()
    }
}
