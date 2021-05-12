//
//  ViewController.swift
//  calculated
//
//  Created by Monica Lo on 2021/5/8.
//

import UIKit

class ViewController: UIViewController {

    let allFood = ["seafood", "T-Bone", "vegetable", "fruit"]
    let names = ["跳跳海鮮組", "疊疊T-Bone塔", "嫩嫩好菜團", "龐貢拱果包"]
    let oldPrices = ["4999", "2550", "210", "880"]
    
    let discounts = ["10", "20", "30", "40", "50", "60", "70", "80", "90"]
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var nameOfProductLabel: UILabel!
    @IBOutlet weak var pageDot: UIPageControl!
    
    @IBOutlet weak var originalPriceLabel: UILabel!
    @IBOutlet weak var savePriceLbael: UILabel!
    @IBOutlet weak var finalPriceLabel: UILabel!
    
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var discountLabel2: UILabel!
    @IBOutlet weak var deleteLabel: UILabel!
    
    @IBOutlet weak var luckyButton: UIButton!
    @IBOutlet weak var restartButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        luckyButton.layer.borderWidth = 1
        luckyButton.layer.borderColor = UIColor.white.cgColor
        luckyButton.layer.cornerRadius = 15
        restartButton.clipsToBounds = true
        
        restartButton.layer.borderWidth = 1
        restartButton.layer.borderColor = UIColor.white.cgColor
        restartButton.layer.cornerRadius = 15
        restartButton.clipsToBounds = true
    }

    @IBAction func changePageControl(_ sender: UIPageControl) {
        let food = allFood [sender.currentPage]
        image.image = UIImage(named: food)

        nameOfProductLabel.text =  names[sender.currentPage]

        originalPriceLabel.text = oldPrices[sender.currentPage]
    }
    
    @IBAction func giveItAShot(_ sender: UIButton) {
        deleteLabel.textColor = .red
        
        discountLabel.text = "\(discounts.randomElement()!)"
        discountLabel2.text = discountLabel.text
        discountLabel2.textColor = .cyan
        
        discountLabel.transform = CGAffineTransform(translationX: 45, y: -170).scaledBy(x: 3, y: 3)
        discountLabel.backgroundColor = UIColor.gray
        discountLabel.alpha = 0.85
        
        finalPriceLabel.text = String(Int(originalPriceLabel.text!)! * Int(discountLabel.text!)! / 100)
        savePriceLbael.text = String(Int(originalPriceLabel.text!)!-Int(finalPriceLabel.text!)!)
    }
    
    @IBAction func retrunButton(_ sender: UIButton) {
        deleteLabel.textColor = .clear
        
        discountLabel.transform = CGAffineTransform(scaleX: 1, y: 1)
        discountLabel.backgroundColor = UIColor.clear
        
        discountLabel.text = "?"
        discountLabel2.text = "?"
        savePriceLbael.text = "?"
        finalPriceLabel.text = "?"
    }
    
}

