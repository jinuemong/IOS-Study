//
//  ViewController.swift
//  QuotesGenerator
//
//  Created by 김진우 on 2023/05/01.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var quotesLable: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    let quotes = [
        Quote(contents: "명언 1", name: "작가1"),
        Quote(contents: "명언 2", name: "작가2"),
        Quote(contents: "명언 3", name: "작가3"),
        Quote(contents: "명언 4", name: "작가4"),
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tabQuotesGenerator(_ sender: Any) {
        let random = Int(arc4random_uniform(4)) // 0~3 사이 난수
        let quote = quotes[random]
        self.quotesLable.text = quote.contents
        self.nameLabel.text = quote.name
    }
    
}

