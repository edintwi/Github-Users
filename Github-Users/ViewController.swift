//
//  ViewController.swift
//  Github-Users
//
//  Created by Edson Brandon on 25/11/24.
//

import UIKit

class ViewController: UIViewController {
    
    private func setupView() {
        view.backgroundColor = .white
    }
    private func setHierarchy() {
        view.addSubview(avatar)
        view.addSubview(username)
        view.addSubview(userDescription)
    }
    
    // - MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setHierarchy()
        setupConstraints()
    }

    // - MARK: - UI Components
    private lazy var avatar: UIImageView = {
        let imageView = UIImageView()
        
        imageView.layer.cornerRadius = 100
        imageView.backgroundColor = .lightGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
        
    } ()

    private lazy var username: UILabel = {
        let label = UILabel()
        label.text = "Username"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    private lazy var userDescription: UILabel = {
        let label = UILabel()
        label.text = "The description contents in user profile"
        label.font = .systemFont(ofSize: 16, weight: .regular)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    } ()
    
    // - MARK: - Constraints
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            avatar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            avatar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatar.widthAnchor.constraint(equalToConstant: 200),
            avatar.heightAnchor.constraint(equalToConstant: 200),
            
            username.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 10),
            username.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            userDescription.topAnchor.constraint(equalTo: username.bottomAnchor, constant: 20),
            userDescription.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
        ])
    }

}

