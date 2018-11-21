//
//  Producto.swift
//  Kuali
//
//  Created by Daniela Anguiano on 11/20/18.
//  Copyright © 2018 Daniela Anguiano. All rights reserved.
//

import Foundation


class Producto{
    private var Categorias: [String];
    private var descripcion: String;
    private var id: Int;
    private var marca: String;
    private var nombre: String;
    private var numLikes: Int;
    private var precio: String;
    private var urlImagenes: [String];
    private var urlSociales: [Any];
    private var urlMarcaLogo: String;
    private var urlTiendas: [Any];
    
    required init(Categorias: [String], descripcion: String, id: Int, marca: String, nombre: String, numLikes: Int, precio: String, urlImagenes: [String], urlSociales: [Any], urlMarcaLogo: String, urlTiendas: [Any]) {
        self.Categorias = Categorias
        self.descripcion = descripcion;
        self.id = id
        self.marca = marca
        self.nombre = nombre
        self.numLikes = numLikes
        self.precio = precio
        self.urlImagenes = urlImagenes
        self.urlSociales = urlSociales
        self.urlMarcaLogo = urlMarcaLogo
        self.urlTiendas = urlTiendas
    }
    
    func getNombre() -> String{
        return self.nombre
    }
}



