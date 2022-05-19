//
//  ViewController.swift
//  NC_1_Simple
//
//  Created by Eillen Hartono on 27/04/22.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
//    var seluruh_bahan: [semua] = []
    let seluruhBahanA = SeluruhBahan()
    
    @IBOutlet weak var name_ingredient: UITextField!
    @IBOutlet weak var weight: UITextField!
    @IBOutlet weak var w_package: UITextField!
    @IBOutlet weak var p_package: UITextField!
    @IBOutlet weak var hasil_hitung: UILabel!
    @IBOutlet weak var lbl_sum: UILabel!
    @IBOutlet weak var bttn_sum: UIButton!
    
    
    @IBAction func countButton(_ sender: Any) {
        let nama: String = name_ingredient.text!
        let berat = Double((weight?.text!)!)!
        let b_package = Double((w_package?.text!)!)
        let h_package = Int((p_package?.text!)!)
        let hasilnya: Double = berat / b_package! * Double(h_package!)
        let pembulatan = String(format: "%.2f", hasilnya)
        
        hasil_hitung.isHidden = false
        hasil_hitung.text = "The cost of \(nama) that you use is Rp \(Double(pembulatan)!.thousand_sep())"
        
        
        
        seluruhBahanA.addBahan(nama: nama, berat: berat, harga: Double(pembulatan)!)
        print(seluruhBahanA.seluruh_bahan)

        
        lbl_sum.isHidden = false
        bttn_sum.isHidden = false
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
            view.addGestureRecognizer(tap)
        name_ingredient.addDoneButtonOnKeyboard()
        weight.addDoneButtonOnKeyboard()
        w_package.addDoneButtonOnKeyboard()
        p_package.addDoneButtonOnKeyboard()
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultSegue"{
            if let ResVC = segue.destination as? ResultViewController{
                ResVC.seluruhBahanB = seluruhBahanA
            }
        }
    }
    
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    

    
    
}


