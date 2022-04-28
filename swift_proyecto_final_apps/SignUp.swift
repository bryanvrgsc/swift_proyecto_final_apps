//
//  SignUp.swift
//  swift_proyecto_final_apps
//
//  Created by Bryan Vargas on 27/04/22.
//

import SwiftUI

struct SignUp: View {
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
                    Text("Registrarse")
                }
                .frame(width: 200)
                .padding()
                .foregroundColor(.white)
                .background(.yellow)
                .cornerRadius(10)
            }.padding()
                .navigationBarTitle("Registro")
        }
      Spacer()
        .frame(height: 900)
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
