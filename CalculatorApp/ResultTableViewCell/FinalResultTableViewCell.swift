//
//  FinalResultTableViewCell.swift
//  CalculatorApp
//
//  Created by Asif on 22/04/2024.
//

import UIKit

class FinalResultTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lblFinalResult: UILabel!
    @IBOutlet weak var lblResult: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
