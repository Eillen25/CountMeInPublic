//
//  CustomTableViewCell.swift
//  NC_1_Simple
//
//  Created by Eillen Hartono on 09/05/22.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var nama_bahan: UILabel!
    @IBOutlet weak var berat_bahan: UILabel!
    @IBOutlet weak var harga_bahan: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
