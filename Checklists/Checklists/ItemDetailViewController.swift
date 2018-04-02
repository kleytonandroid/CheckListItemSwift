//
//  AddItemViewController.swift
//  Checklists
//
//  Created by Kleyton josé dos santos on 29/03/18.
//  Copyright © 2018 KleytonCorporation. All rights reserved.
//

import UIKit

protocol itemDetailViewController: class {
    func itemDetailViewControllerDidCancel(
        _ controller: ItemDetailViewController)
    func itemDetailViewController(_ controller: ItemDetailViewController,
                               didFinishAdding item: ChecklistItem)
    func itemDetailViewController(_ controller: ItemDetailViewController,
                               didFinishEditing item: ChecklistItem)
}

class ItemDetailViewController: UITableViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    
    var itemToEdit: ChecklistItem?
    
    weak var delegate: itemDetailViewController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.text
            doneBarButton.isEnabled = true
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    @IBAction func cancel() {
        delegate?.itemDetailViewControllerDidCancel(self)
    }
    @IBAction func done() {
        if let itemToEdit = itemToEdit {
            itemToEdit.text = textField.text!
            delegate?.itemDetailViewController(self,
                                            didFinishEditing: itemToEdit)
        } else {
            let item = ChecklistItem()
            item.text = textField.text!
            item.checked = false
            delegate?.itemDetailViewController(self, didFinishAdding: item)
        }
    }
    
    override func tableView(_ tableView: UITableView,
                            willSelectRowAt indexPath: IndexPath) -> IndexPath? {
            return nil
    }
 
    
}

extension ItemDetailViewController: UITextFieldDelegate{
    
    func textField(_ textField: UITextField,
                        shouldChangeCharactersIn range: NSRange,
                        replacementString string: String) -> Bool {
        let oldText = textField.text!
        let stringRange = Range(range, in:oldText)!
        let newText = oldText.replacingCharacters(in: stringRange,with: string)
        if newText.isEmpty {
                doneBarButton.isEnabled = false
            } else {
                doneBarButton.isEnabled = true
            }
            return true
    }
}
