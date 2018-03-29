//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Kleyton josé dos santos on 29/03/18.
//  Copyright © 2018 KleytonCorporation. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
    }
    
    @IBAction func cancel() {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func done() {
        navigationController?.popViewController(animated: true)
    }
}
