//
//  ViewController.swift
//  Task11App
//
//  Created by 山崎喜代志 on 2021/04/04.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var prefectureLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        prefectureLabel.text = "未選択"
    }

    @IBAction func exit(segue: UIStoryboardSegue) {

    }

    @IBAction func touchCell(segue: UIStoryboardSegue) {
        if let secondVC = segue.source as? SecondViewController {

            secondVC.delegate = self
        }
    }
}

extension ViewController: PrefectureDelegate {

    func didTapCell(name: String) {
        prefectureLabel.text = name
    }
}
