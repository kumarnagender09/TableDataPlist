//
//  ZipCodeUpdateVC.swift
//  TableDataPlist
//
//  Created by Nagender Kumar on 22/05/24.
//
import UIKit

protocol ZipCodeUpdateDelegate: AnyObject {
    func didUpdateZipCode(newZipCode: String, at index: Int)
}

class ZipCodeUpdateVC: UIViewController {
    @IBOutlet weak var lblZip: UILabel!
    @IBOutlet weak var txtNewZip: UITextField!
    @IBOutlet weak var btnOk: UIButton!
    
    var selectedZipCode: String = ""
    var selectedIndex: Int = 0
    weak var delegate: ZipCodeUpdateDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblZip.text = selectedZipCode
    }
    
    @IBAction func btnOkTapped(_ sender: UIButton) {
        guard let newZipCode = txtNewZip.text, !newZipCode.isEmpty else {
            // Show an alert if the text field is empty
            let alert = UIAlertController(title: "Error", message: "Please enter a new zip code.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        
        // Call the delegate method to notify the previous view controller about the update
        delegate?.didUpdateZipCode(newZipCode: newZipCode, at: selectedIndex)
        
        // Pop the view controller
        navigationController?.popViewController(animated: true)
    }
}
