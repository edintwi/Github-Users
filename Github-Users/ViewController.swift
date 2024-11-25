//
//  ViewController.swift
//  Github-Users
//
//  Created by Edson Brandon on 25/11/24.
//

import UIKit

class ViewController: UIViewController {
    var user: GithubUser?
    
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
        
        Task {
            do {
                user = try await UserService.shared.getUser()
                
                guard let url = URL(string: user?.avatarUrl ?? "") else {
                    throw GHError.invalidURL
                }
                
                avatar.load(url: url)
                username.text = user?.login
                userDescription.text = user?.bio
                
            } catch {
                print("error")
            }
        }
    }

    // - MARK: - UI Components
    private lazy var avatar: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 100
        imageView.backgroundColor = .lightGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
        
    } ()

    private lazy var username: UILabel = {
        let label = UILabel()
        label.text = "username"
        label.font = .systemFont(ofSize: 20, weight: .bold)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    private lazy var userDescription: UILabel = {
        let label = UILabel()
        label.text = "user bio"
        label.numberOfLines = 3
        label.textAlignment = .center
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
            userDescription.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            userDescription.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
            
        ])
    }

}

