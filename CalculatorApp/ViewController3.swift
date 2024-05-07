//
//  ViewController3.swift
//  CalculatorApp
//
//  Created by Asif on 29/04/2024.
//

import UIKit

class ViewController3: UIViewController {

    @IBOutlet weak var btnScientificTitle: CustomButton!
   
    @IBOutlet weak var lblSin: UILabel!
    @IBOutlet weak var lblCos: UILabel!
    @IBOutlet weak var lblTan: UILabel!
    
    @IBOutlet weak var lblSinh: UILabel!
    @IBOutlet weak var lblCosh: UILabel!
    @IBOutlet weak var lblTanh: UILabel!
    
    @IBOutlet weak var lbltest: UILabel!
    @IBOutlet weak var topView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnScientificTitle.setTitle("2ⁿᵈ", for: .normal)
        self.topView.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnScientificTap(_ sender: UIButton) {
                
        switch sender.tag {
        case 0, 1:
            if btnScientificTitle.tag == 0 {
                btnScientificTitle.tag = 1
                btnScientificTitle.backgroundColor = .white
                btnScientificTitle.setTitleColor(.black, for: .normal)
             
                lblSin.text = "sin⁻¹"
                lblCos.text = "cos⁻¹"
                lblTan.text = "tan⁻¹"
                
                lblSinh.text = "sinh⁻¹"
                lblCosh.text = "cosh⁻¹"
                lblTanh.text = "tanh⁻¹"
                
            } else {
                
                btnScientificTitle.tag = 0
                btnScientificTitle.backgroundColor = UIColor(hex: "262626", alpha: 1.0)
                btnScientificTitle.setTitleColor(.white, for: .normal)
                
                lblSin.text = "sin"
                lblCos.text = "cos"
                lblTan.text = "tan"
                
                lblSinh.text = "sinh"
                lblCosh.text = "cosh"
                lblTanh.text = "tanh"
            }
//           case 2:
//               // Handle case for button with tag 2
//           case 3:
//               // Handle case for button with tag 3
//           // Add more cases as needed
           default:
               // Handle default case or do nothing
               break
           }
    }
    
    @IBAction func tap(_ sender: UIButton) {
      
        if self.topView.isHidden == true {
            self.topView.isHidden = false
        } else {
            self.topView.isHidden = true
        }

    }
    
}



