//
//  ViewController.swift
//  Test
//
//  Created by Akshay on 25/09/23.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    let viewModel = SongListingViewModel()
    
    private var dataSource: [Song]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        dataSource = viewModel.dataSource()
    }

    
    private func setupTableView() {
        tableView.register(UINib(nibName: "SongNameTableViewCell", bundle: .main), forCellReuseIdentifier: "SongNameTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        
    }

}
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0

    }
    
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "SongNameTableViewCell") as! SongNameTableViewCell
        if let data = dataSource {
            let song = data[indexPath.row]
            cell.configure(song: song)
        }
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        var viewController = SongDetailsViewController(nibName: "SongDetailsViewController",
                                                       bundle: nil)
        if let datasource = dataSource {
            let songListingViewModel = SongDetailsViewModel(songs: datasource,
                                                            index: indexPath.row)
            viewController.viewModel = songListingViewModel
        }
        present(viewController, animated: true)
    }
    

}

