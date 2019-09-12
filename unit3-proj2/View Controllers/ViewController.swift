//
//  ViewController.swift
//  unit3-proj2
//
//  Created by Radharani Ribas-Valongo on 9/11/19.
//  Copyright © 2019 Radharani Ribas-Valongo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: -- Properties
    var showsArr = [Shows]() {
        didSet {
            showsTableView.reloadData()
        }
    }
    
    
    
    @IBOutlet weak var showsSearchBar: UISearchBar!
    @IBOutlet weak var showsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}

//extension ViewController: UITableViewDataSource {
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        <#code#>
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }
//    
//    
//}
