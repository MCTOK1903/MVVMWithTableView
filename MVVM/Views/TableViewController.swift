//
//  TableViewController.swift
//  MVVM
//
//  Created by MCT on 5.10.2020.
//

import UIKit

class TableViewController: UIViewController {
    
    // MARK: UiView
    
    let tableView: UITableView = {
        let table = UITableView(frame: .zero, style: .plain)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.backgroundColor = .white
        table.register(CustomTableViewCell.self, forCellReuseIdentifier: "customCell")
        return table
    }()
    
    // MARK: Properties
    
    private var tableViewViewModel: TableViewViewModelType?
    private var customCellViewModel: TableViewCellViewModelType?
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableViewViewModel = TableViewViewModel()
        
        fetchMovieData()
        tableView.dataSource = self
        tableView.delegate =
            self
        view.backgroundColor = .white
        view.addSubview(tableView)
        
        tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        
        self.tableViewViewModel?.resultsDidChange = { [weak self] _ in
            self?.tableView.reloadData()
        }
        
    }
    
    // MARK: Func
    
    func fetchMovieData() {
        tableViewViewModel?.fetchMovie(completion: { (response) in
            switch response {
            case.success(_):
                break
            case .failure(_):
                break
            }
        })
    }
}

//MARK: - UITableViewDelegate, UITableViewDataSource
extension TableViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewViewModel!.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! CustomTableViewCell
        
        customCellViewModel = tableViewViewModel?.cellForRowAt(indexPath: indexPath)
        cell.movieNameLabel.text = customCellViewModel?.movieName
        cell.movieVoteLabel.text = String(customCellViewModel!.movieVote)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
