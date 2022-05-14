//
//  VistaModeloAPI.swift
//  swift_proyecto_final_apps
//
//  Created by Bryan Vargas on 13/05/22.
//

import Foundation

class VistaModeloAPI : ObservableObject
{
    @Published var response = [DataResultado]()
    @Published var regreso = DataModel(error: true, message: "", data: [DataResultado(idProducto: "", nombre: "", descripcion: "", cantidad: "", imagenPrincipal: "", precio: "", idUsuario: "", usuario: "", password: "", nombres: "", apellidoPaterno: "", apellidoMaterno: "", suscripcion: false, direccion: "", admin: false)])

    //MARK: - apiCall
    func apiCall(parameters: [String: Any]) // parametrers es un diccionario
    {
        guard let url = URL(string: "https://reqres.in/api/register") else
        {
            print("error url")
            return

        }
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")


        URLSession.shared.dataTask(with: request)
        { (data,res,error) in

            if error != nil
            {
                print("error ", error?.localizedDescription ?? "")
                return
            }

            do
            {
                if let d = data {
                    let result = try JSONDecoder().decode(DataModel.self, from: d)
                    print("La data es \(result)")
                    DispatchQueue.main.async {
                        print("La data es \(result)")
                        self.regreso = result
                    } //fin async
                } // fin data
                else
                {
                    print("no hay datos")
                }

            }//fin del do
            catch let JsonError
            {
                print("error en json creaFruits", JsonError.localizedDescription)
             }


        }.resume() // fin dataTask

    } //fin de creaFruits

}
