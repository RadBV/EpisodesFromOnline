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
    var searchedText = "" {
        didSet {
            showsTableView.reloadData()
        }
    }
    
    
    @IBOutlet weak var showsSearchBar: UISearchBar!
    @IBOutlet weak var showsTableView: UITableView!
    
    
    func loadData() {
        ShowsAPIClient.shared.getShows(userInput: searchedText) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    print("There was a problem: \(error)")
                case .success(let showsFromOnlineAPI):
                    self.showsArr = showsFromOnlineAPI
                    dump(self.showsArr)
                }
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showsTableView.dataSource = self
        showsSearchBar.delegate = self
        loadData()
        // Do any additional setup after loading the view.
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let show = showsArr[indexPath.row]
        if let cell = showsTableView.dequeueReusableCell(withIdentifier: "showCell", for: indexPath) as? ShowsTableViewCell {
            cell.showTitleLabel.text = show.show.name
            if let imageUnwrapped = show.show.image.medium {
            cell.showImage.image = UIImage(named: imageUnwrapped)
            } else {
                cell.showImage.image = UIImage(contentsOfFile: "noimage")
            }
            return cell
        }
        return UITableViewCell()
    }
    
    
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
        searchedText = searchText
        
    }

}
