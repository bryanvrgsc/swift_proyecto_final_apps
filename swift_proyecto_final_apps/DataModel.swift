//
//  APIFinalTienda.swift
//  swift_proyecto_final_apps
//
//  Created by Bryan Vargas on 13/05/22.
//

import Foundation

// MARK: - DataModel

struct DataModel: Decodable {
    let error: Bool?
    let message: String?
    let data: [DataResultado]?
}

// MARK: - DataResultado

struct DataResultado: Decodable {
    let id_producto, nombre, descripcion, cantidad: String?
    let id_carrito: String?
    let imagen_principal: String?
    let precio, id_usuario, usuario, password: String?
    let nombres, apellido_paterno, apellido_materno: String?
    let suscripcion: Bool?
    let direccion: String?
    let admin: Bool?
}
