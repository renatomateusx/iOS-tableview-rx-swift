//
//  ViewController.swift
//  TableViewRxSwift
//
//  Created by Renato Mateus on 05/04/21.
//

import UIKit
import RxSwift
import RxCocoa

class ViewController: UIViewController {

    //MARK: Properties
    private let tableView: UITableView = {
       let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private var viewModel = ProductViewModel()
    
    private var bag = DisposeBag()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.addSubview(tableView)
        tableView.frame = view.bounds
        bindTableData()
    }
    
    //MARK: Helpers
    private func bindTableData(){
        // Bind products to table
        viewModel.items.bind(to: tableView.rx.items(cellIdentifier: "cell", cellType: UITableViewCell.self)){
            row, model, cell in
            cell.textLabel?.text = model.title
            cell.imageView?.image = UIImage(systemName: model.imageName)
        }.disposed(by: bag)
        
        
        // Bind a model selected handler
        tableView.rx.modelSelected(Product.self).bind {product in
            print("\(product.title) selected")
        }.disposed(by: bag)
        
        // Fetch Products
        viewModel.fetchProducts()
    }


}

