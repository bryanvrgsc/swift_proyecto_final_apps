//
//  APIFinalTienda.swift
//  swift_proyecto_final_apps
//
//  Created by Bryan Vargas on 13/05/22.
//

import Foundation

// MARK: - DataModel
struct DataModel : Decodable {
    let error: Bool?
    let message: String?
    let data: [DataResultado]?
}

// MARK: - DataResultado
struct DataResultado : Decodable {
    let idProducto, nombre, descripcion, cantidad: String?
    let imagenPrincipal: String?
    let precio, idUsuario, usuario, password: String?
    let nombres, apellidoPaterno, apellidoMaterno: String?
    let suscripcion: Bool?
    let direccion: String?
    let admin: Bool?
}
