//
//  FourthViewController.swift
//  coding
//
//  Created by Fernando Martin Gordillo on 08/12/2020.
//

import UIKit

class FourthViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var pickerViewWeight: UIPickerView!
    @IBOutlet weak var pickerViewHeight: UIPickerView!
    @IBOutlet weak var labelResult: UILabel!
    @IBOutlet weak var imageIMC: UIImageView!
    
    
    
    var pickerWeight : [Int] = Array(1...700)
    var pickerHeight : [Int] = Array(1...250)
    var selectedValueWeight : Int = 0
    var selectedValueHeight : Int = 0
    var normalWeight = 60
    var normalHeight = 170
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        selectedValueWeight = normalWeight
        selectedValueHeight = normalHeight

        pickerViewWeight.selectRow(normalWeight-1, inComponent: 0, animated: true)
        pickerViewHeight.selectRow(normalHeight-1, inComponent: 0, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    @IBAction func buttonCalculatePressed(_ sender: UIButton) {
        
        calculateIMC()
    }
    
    func calculateIMC(){
        print(selectedValueHeight)
        print(selectedValueWeight)
        let result = Double(selectedValueWeight) /  pow(Double(selectedValueHeight) / 100, 2.0)
        
        self.labelResult.text = "\(result.redondear(numeroDeDecimales: 2))"
        
        if result < 18.5 {
            imageIMC.image = UIImage(named: "pesobajo")
        }
        else if result >= 18.5 && result <= 24.9{
            imageIMC.image = UIImage(named: "pesoideal")
        }
        else if result >= 25 && result <= 29.9{
            imageIMC.image = UIImage(named: "pesosobrepeso")
        }
        else if result >= 30.0 && result <= 39.9{
            imageIMC.image = UIImage(named: "pesoobesidad")
        }
        else {
            imageIMC.image = UIImage(named: "pesoobesidadmorbida")
        }
        
    }
    
    
//    MARK: - UIPickerView Data source methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0{
            return pickerWeight.count
        } else {
            return pickerHeight.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            return "\(pickerWeight[row])"
        } else {
            return "\(pickerHeight[row])"
        }
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0{
            self.selectedValueWeight = row + 1
        } else {
            self.selectedValueHeight = row + 1
        }
    }
    
}

extension Double {
    func redondear(numeroDeDecimales: Int) -> String {
        let formateador = NumberFormatter()
        formateador.maximumFractionDigits = numeroDeDecimales
        formateador.roundingMode = .down
        return formateador.string(from: NSNumber(value: self)) ?? ""
    }
}
