//
//  SecondViewController.swift
//  Task11App
//
//  Created by 山崎喜代志 on 2021/04/04.
//

import UIKit

protocol SecondViewControllerDelegate: AnyObject {
    func didSelectPrefecture(name: String)
}

class SecondViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    private let prefectures = Prefecture.Prefectures
    weak var delegate: SecondViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension SecondViewController: UITableViewDataSource, UITableViewDelegate {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        prefectures.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = prefectures[indexPath.row].name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedName = prefectures[indexPath.row].name
        delegate?.didSelectPrefecture(name: selectedName)
        performSegue(withIdentifier: "back", sender: nil)
    }
}
