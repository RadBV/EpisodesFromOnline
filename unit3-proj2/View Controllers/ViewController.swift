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

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showsTableView.dataSource = self
        showsTableView.delegate = self
        showsSearchBar.delegate = self
        loadData()
    }

    private func getEpisodeID() -> Int {
//        guard let indexPath = showsTableView.indexPathForSelectedRow.row else {
//
//        }
        let episodeID = showsArr[showsTableView.indexPathForSelectedRow!.row].id
        return episodeID
    }
    private func loadData() {
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let episodeVC = segue.destination as? EpisodesTableViewController else {
            fatalError()
        }
        
        EpisodesAPIClient.shared.getEpisodes(id: getEpisodeID()) { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let episodes):
                    episodeVC.episodes = episodes
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return showsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let show = showsArr[indexPath.row]
        if let cell = showsTableView.dequeueReusableCell(withIdentifier: "showCell", for: indexPath) as? ShowsTableViewCell {
            cell.showTitleLabel.text = show.name
            
            if let imageUnwrapped = show.image?.medium {
                ImageHelper.shared.getImage(urlStr: imageUnwrapped) { (result) in
                    DispatchQueue.main.async {
                        switch result {
                        case .failure(let error):
                            print(error)
                        case .success(let imageFromOnline):
                            cell.showImage.image = imageFromOnline
                        }
                    }
                }
            } else {
                cell.showImage.image = UIImage(contentsOfFile: "noimage")
            }
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 220
    }
    
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchedText = searchText
        print(searchText)
        loadData()
    }

}
