//
//  ResultViewController.swift
//  NC_1_Simple
//
//  Created by Eillen Hartono on 27/04/22.
//

import UIKit

class ResultViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var seluruhBahanB = SeluruhBahan()
    
    
    var total_harga: Double = 0
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return seluruhBahanB.seluruh_bahan.count
    }
//
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listBahan") as! CustomTableViewCell
        cell.nama_bahan.text = seluruhBahanB.seluruh_bahan[indexPath.row].nama_bahan
        cell.berat_bahan.text = String(seluruhBahanB.seluruh_bahan[indexPath.row].berat_bahan)
        cell.harga_bahan.text = Double(seluruhBahanB.seluruh_bahan[indexPath.row].harga_modal).thousand_sep()

        return cell
    }
//
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return .delete
    }
//
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.beginUpdates()
            let dihapus = seluruhBahanB.seluruh_bahan[indexPath.row].harga_modal
            total_harga -= dihapus
            total.text = "Total Cost: Rp \(Double(total_harga).thousand_sep())"
            seluruhBahanB.seluruh_bahan.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()


            print(dihapus)
            print(seluruhBahanB.seluruh_bahan)
        }
    }
//
//
//
//
//
    override func viewDidLoad() {
        super.viewDidLoad()
        print(seluruhBahanB.seluruh_bahan)
        for a in 0...seluruhBahanB.seluruh_bahan.count-1 {
            total_harga += seluruhBahanB.seluruh_bahan[a].harga_modal
        }

        total.text = "Total Cost: Rp \(Double(total_harga).thousand_sep())"
    }
    
    @IBOutlet weak var nama: UILabel!
    @IBOutlet weak var berat: UILabel!
    @IBOutlet weak var harga: UILabel!
    @IBOutlet weak var total: UILabel!

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
