//
//  allClass.swift
//  NC_1_Simple
//
//  Created by Eillen Hartono on 27/04/22.
//

import Foundation
import UIKit


struct semua {
    var nama_bahan: String
    var berat_bahan: Double
    var harga_modal: Double

    
}

extension Double {
    func thousand_sep() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter.string(for: self) ?? ""
    }
}
