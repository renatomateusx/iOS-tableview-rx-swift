//
//  ProductViewModel.swift
//  TableViewRxSwift
//
//  Created by Renato Mateus on 05/04/21.
//

import RxSwift
import RxCocoa

struct ProductViewModel {
    var items = PublishSubject<[Product]>()
    
    func fetchProducts(){
        let products = [
            Product(imageName: "house", title: "Home"),
            Product(imageName: "gear", title: "Settings"),
            Product(imageName: "person.circle", title: "Profile"),
            Product(imageName: "airplane", title: "Flights"),
            Product(imageName: "bell", title: "Activity"),
        ]
        
        items.onNext(products)
        items.onCompleted()
    }
}
