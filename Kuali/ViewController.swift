//
//  ViewController.swift
//  Kuali
//
//  Created by Daniela Anguiano on 11/15/18.
//  Copyright © 2018 Daniela Anguiano. All rights reserved.
//

import UIKit
import Firebase


class ViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var ref: DatabaseReference!
    var dataSource: [Producto] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "ProductCell", bundle: nil), forCellWithReuseIdentifier: "Cell")
        FirebaseApp.configure()
        
        ref = Database.database().reference()
        ref.child("Productos").observeSingleEvent(of: .value, with: { (snapshot) in
            var prod = snapshot.value as! [Any]
            prod.remove(at: 0)
            for pr in prod{
                let p = pr as! [String: Any]
                let categorias = p["categorias"] as! [String]
                let descripcion = p["descripcion"] as! String
                let id = p["id"] as! Int
                let marca = p["marca"] as! String
                let nombre = p["nombre"] as! String
                let numLikes = p["numLikes"] as! Int
                let precio = "\(p["precio"])"
                let urlImagenes = p["url_imagenes"] as! [String]
                let urlSociales = p["url_sociales"] as! [Any]
                let urlMarcaLogo = p["url_marca_logo"] as! String
                let urlTiendas = p["url_tiendas"] as! [Any]
                let newProduct = Producto(Categorias: categorias, descripcion: descripcion, id: id, marca: marca, nombre: nombre, numLikes: numLikes, precio: precio, urlImagenes: urlImagenes, urlSociales: urlSociales,urlMarcaLogo: urlMarcaLogo, urlTiendas: urlTiendas)
                self.dataSource.append(newProduct)
            }
            self.collectionView.reloadData()
        }) { (error) in
            print("------------ERROR------------")
            print(error.localizedDescription)
        }
        
    }

    @IBAction func pressSearch(_ sender: Any) {
    }
    @IBAction func pressMore(_ sender: Any) {
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ProductCell
        cell.nameProducto.text = dataSource[indexPath.row].getNombre()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemsPerRow:CGFloat = 2
        let hardCodedPadding:CGFloat = 1
        
        let itemWidth = (collectionView.bounds.width / itemsPerRow)
        
        let itemHeight = heightForCellAt(indexPath: indexPath, collectionView: collectionView)
        return heightForCellAt(indexPath: indexPath, collectionView: collectionView)
    }
    
    func heightForCellAt(indexPath: IndexPath, collectionView: UICollectionView) -> CGSize {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.setNeedsLayout()
        cell.layoutIfNeeded()
        
        return cell.contentView.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        
    }
    
}

