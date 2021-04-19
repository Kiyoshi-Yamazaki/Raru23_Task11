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

    @IBAction func didTapChangeButton(_ sender: Any) {
        performSegue(withIdentifier: "Next", sender: sender)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }

        switch identifier {
        case "Next":
            guard let navigationController = segue.destination as? UINavigationController,
                  let secondViewController = navigationController.topViewController as? SecondViewController else {

                return
            }

            secondViewController.delegate = self
        default:
            break
        }
    }
}

extension ViewController: SecondViewControllerDelegate {

    func didSelectPrefecture(name: String) {
        prefectureLabel.text = name
    }
}
