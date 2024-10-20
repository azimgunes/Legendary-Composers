//
//  ViewController.swift
//  Legendary Composers
//
//  Created by Azim Güneş on 28.02.2024.
//

import UIKit

class ComposersViewController: UIViewController {
    
    
    
    // MARK: - UI
    
    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .clear
        tv.rowHeight = UITableView.automaticDimension
        tv.estimatedRowHeight = 44
        tv.separatorStyle = .none
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tv.register(ComposerTableViewCell.self, forCellReuseIdentifier: ComposerTableViewCell.cellId)
        return tv
    }()
    
    
    private lazy var composersViewModel = ComposersViewModel()
    private lazy var audioManagerViewModel = AuidoManagerViewModel()
    private lazy var composerTableViewCell = ComposerTableViewCell()
    
    
    // MARK: - Lifecycle
    override func loadView() {
        super.loadView()
        setup()
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewStyle()
        
        overrideUserInterfaceStyle = .light

        self.view.backgroundColor = .white
        self.title = "Legendary Composers"
        }
}


private extension ComposersViewController {
    func setup(){
        
        self.navigationController?.navigationBar.backgroundColor = .clear
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        
        
        tableView.dataSource = self
        tableView.delegate = self
        self.view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
            
        ])
    }
}

// MARK: - UITableViewDataSource


extension ComposersViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return composersViewModel.composers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let composer = composersViewModel.composers[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: ComposerTableViewCell.cellId, for: indexPath) as! ComposerTableViewCell
        cell.configure(with: composer, delegate: self)
        cell.selectionStyle = .none
        return cell
        
    }
    
   
}

extension ComposersViewController: ComposerTableViewCellDelegate {
    func didTapPlayButton(for composer: Composer) {
        audioManagerViewModel.play(composer)
        composersViewModel.togglePlaying(for: composer)
        tableView.reloadData()
    }


}

extension ComposersViewController{
    func viewStyle(){
        let appearance = UINavigationBarAppearance()
                appearance.configureWithOpaqueBackground()
                appearance.backgroundColor = UIColor.blue
                appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
                navigationItem.standardAppearance = appearance
                navigationItem.scrollEdgeAppearance = appearance
                navigationItem.compactAppearance = appearance
    }
}
