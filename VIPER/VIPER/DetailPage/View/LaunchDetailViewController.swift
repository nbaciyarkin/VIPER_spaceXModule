//
//  DetailView.swift
//  VIPER
//
//  Created by Hamdi Aktar on 13.06.2022.
//

import Foundation
import UIKit
import WebKit

class LaunchDetailViewController: UIViewController, LaunchesPagePresenterToViewConformable {
    func onFetchLaunchListSucces() {
        //
    }
    
    var articleUrl:String?
    
    var presenter: DetailPageViewToPresenterConformable?
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.text = "Launch Detail"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.textColor = .white
        label.layer.masksToBounds = true
        return label
    }()
    
    private let launchNameLabel: UILabel = {
        let label  = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.text = "Harry Potter"
        label.textColor = .black
        return label
    }()
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 15
        return image
    }()
    
    private let overViewLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.numberOfLines = 0
        label.text = "This is the best movie ever to watch as a kid"
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let readArticleBtn: AnimatedButton = {
        let button = AnimatedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .red
        button.setTitle("READ ARTICLE", for: .normal)
        button.addTarget(self, action: #selector(btn_TUI), for: .touchUpInside)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        return button
    }()
    
    private let blankScreenBtn: AnimatedButton = {
         let button = AnimatedButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .brown
        button.setTitle("Open Blank Screen", for: .normal)
        button.addTarget(self, action: #selector(blank_btn_TUI), for: .touchUpInside)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        return button
    }()
    
    let scrollView: UIScrollView = {
        let v = UIScrollView()
        v.translatesAutoresizingMaskIntoConstraints = false
        v.backgroundColor = UIColor(white: 0.2, alpha: 0.9)
        v.alwaysBounceVertical = true
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Kullanmadım!!!
        presenter?.initialize()
        
        view.backgroundColor = .white
        self.view.addSubview(scrollView)
        view.addSubview(imageView)
        view.addSubview(launchNameLabel)
        view.addSubview(detailLabel)
        scrollView.addSubview(overViewLabel)
        view.addSubview(readArticleBtn)
        view.addSubview(blankScreenBtn)

         
        configureConstraints()
    }
    
    @objc func blank_btn_TUI(){
//        DispatchQueue.main.async {
//            let vc = ArticleViewController()
//            vc.article = self.articleUrl
//            self.navigationController?.pushViewController(vc, animated: true)
//        }
    }
    
    @objc func btn_TUI(){
        presenter?.didTapReadArticleButton(navigationController: navigationController ?? UINavigationController(), with: articleUrl!)
    }

//    let vc = ArticleViewController()
//    //            vc.article = self.articleUrl
//    //            self.navigationController?.pushViewController(vc, animated: true)
    
    private func configureConstraints(){
        
        
        let titleLabelConstraints = [
            launchNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 50),
            launchNameLabel.centerXAnchor.constraint(equalTo: imageView.centerXAnchor)
        ]
        
        let imageViewConstraints = [
            imageView.topAnchor.constraint(equalTo: launchNameLabel.topAnchor,constant: 70),
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.widthAnchor.constraint(equalToConstant: view.frame.width / 2),
            imageView.heightAnchor.constraint(equalToConstant: 150)
        ]
        
        let scrollViewConstraints = [
            scrollView.leftAnchor.constraint(equalTo: view.leftAnchor,constant: 10),
            scrollView.rightAnchor.constraint(equalTo: view.rightAnchor,constant: -10),
            scrollView.topAnchor.constraint(equalTo: detailLabel.bottomAnchor, constant: 10),
            scrollView.heightAnchor.constraint(equalToConstant: 250),
        ]
    
        let detailLabelConstraints = [
            detailLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 50),
            detailLabel.heightAnchor.constraint(equalToConstant: 25),
            detailLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ]
        
        let overViewLabelConstraints = [
            overViewLabel.topAnchor.constraint(equalTo: scrollView.topAnchor),
            overViewLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: 20),
            overViewLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 15),
            overViewLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -15),
        ]
        let downloadButtonConstraints = [
            readArticleBtn.trailingAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: -10),
            readArticleBtn.topAnchor.constraint(equalTo:scrollView.bottomAnchor,constant: 30),
            readArticleBtn.heightAnchor.constraint(equalToConstant: 30),
            readArticleBtn.widthAnchor.constraint(equalTo: blankScreenBtn.widthAnchor)
        ]
        
        let blankScreenButtonConstraints = [
            blankScreenBtn.leadingAnchor.constraint(equalTo: scrollView.centerXAnchor, constant: 10),
            blankScreenBtn.topAnchor.constraint(equalTo:scrollView.bottomAnchor,constant: 30),
            blankScreenBtn.heightAnchor.constraint(equalToConstant: 30)
        ]
        
        NSLayoutConstraint.activate(imageViewConstraints)
        NSLayoutConstraint.activate(scrollViewConstraints)
        NSLayoutConstraint.activate(detailLabelConstraints)
        NSLayoutConstraint.activate(titleLabelConstraints)
        NSLayoutConstraint.activate(overViewLabelConstraints)
        NSLayoutConstraint.activate(downloadButtonConstraints)
        NSLayoutConstraint.activate(blankScreenButtonConstraints)
    }
    
    func configure(with model: LaunchDetailViewModel) {
        imageView.kf.setImage(with: URL(string: model.launch_image))
        launchNameLabel.text = model.title
        overViewLabel.text = "\(model.launchDetail)"
        //guard let url = URL(string: "https://www.youtube.com/embed/\(model.youtubeView.id.videoId)") else {return}
    }
}


