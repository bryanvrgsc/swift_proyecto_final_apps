//
//  ViewController.swift
//  swift_proyecto_final_apps
//
//  Created by Bryan Vargas on 13/05/22.
//

import UIKit

struct ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Bar Items"
        view.backgroundColor = .systemBlue

        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        view.addSubview(view.center)
        button.center = view.center
        button.backgroundColor = .systemBlue
        button.setTitle("Go to View 2", for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)

        configureItems()
    }

    private func configureItems() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: nil
        )
    }

    @objc func didTapButotn() {
        let vc = UIViewController()
        UINavigationController?.pushViewController(vc, animated: true)
    }
}
