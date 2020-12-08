//
//  FontDetailViewController.swift
//  coding
//
//  Created by Fernando Martin Gordillo on 08/12/2020.
//

import UIKit

class FontDetailViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    

    @IBOutlet weak var labelTitle: UILabel!
    
    @IBOutlet weak var pickerFonts: UIPickerView!
    
    @IBOutlet weak var textView: UITextView!
    
    var familyName : String = ""
    
    var fonts : [String] = []
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.labelTitle.text = familyName
        self.labelTitle.font = UIFont(name: familyName, size: 22.0)
        
        if fonts.count == 0 {
            pickerFonts.isHidden = true
        }
//      otra manera de vincular
        self.pickerFonts.dataSource = self
        self.pickerFonts.delegate = self
        
        self.textView.font = UIFont(name: familyName, size: 14.0)
    }
    

    
    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    
    
//    MARK - UIPickerView Data Source Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.fonts.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fonts[row]
    }
    
//    MARK: UIPickerView Delegate Methods
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        let font = fonts[row]
        self.textView.font = UIFont(name: font, size: 14.0)
    }
    
}
