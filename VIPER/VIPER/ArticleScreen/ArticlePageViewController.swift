//
//  ArticlePageView.swift
//  VIPER
//
//  Created by Hamdi Aktar on 13.06.2022.
//

import Foundation


import UIKit
import WebKit

class ArticlePageViewController: UIViewController {
    
    
    
    var presenter: ArticlePageViewToPresenterConformable?
    
    private let webView: WKWebView = {
        let webView = WKWebView()
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        
        
        view.addSubview(webView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }
    
    
    func configure(with article_url: String ) {
        guard let url = URL(string: article_url) else {return}
        let urlRequest = URLRequest(url: url)
        webView.load(urlRequest)
    }
    
    
}
