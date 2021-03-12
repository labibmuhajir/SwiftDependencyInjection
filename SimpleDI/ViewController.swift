//
//  ViewController.swift
//  SimpleDI
//
//  Created by Labib Muhajir on 11/03/21.
//

import UIKit

class ViewController: UIViewController {
    @Inject var repository: MovieRepository
    @Inject(factoryName: "app_name") var appName: String
    @Inject(factoryName: "created") var created: String

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        repository.getMovies { (movie, error) in
            let label = UILabel()
            label.frame = CGRect(x: 0, y: 0, width: 400, height: 100)
            label.text = "Sukses \(self.appName) \(self.created)"
            
            self.view.addSubview(label)
        }
    }


}

