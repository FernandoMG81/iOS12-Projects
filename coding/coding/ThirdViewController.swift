//
//  ThirdViewController.swift
//  coding
//
//  Created by Fernando Martin Gordillo on 01/12/2020.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    var families : [String] = []
    var fonts : [String: [String]] = [:]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        families = UIFont.familyNames
        for fam in families{
            fonts[fam] = UIFont.fontNames(forFamilyName: fam)
        }
    }
//MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowFontsForFamily"{
            let navController = segue.destination as! UINavigationController
            let destinationVC = navController.topViewController as! FontDetailViewController
            let idx = self.tableView.indexPathForSelectedRow!.row
            destinationVC.familyName = self.families[idx]
            destinationVC.fonts = self.fonts[self.families[idx]]!
        }
    }
    
    
    
    //MARK: - Metodos del protocolo UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.families.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FontFamilyCell", for: indexPath)
        let fontFamily = families[indexPath.row]
        cell.textLabel?.text = fontFamily
        cell.textLabel?.font = UIFont(name: fontFamily, size: 20.0)
        
        return cell
        
    }
    

//    MARK: - Metodos del protocolo UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let fontFamily = families[row]
        let familyFonts = fonts[fontFamily]!
    }

}
