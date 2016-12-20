//
//  DetailViewController.swift
//  GrailDiary
//
//  Created by Kimberly Skipper on 12/19/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{
    //why does making this optional rmove the need for initializers?
    var islandDetails: Island?
    
    @IBOutlet weak var islandNameLabel: UILabel!
    @IBOutlet weak var populationLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var currencyLabel: UILabel!
    @IBOutlet weak var homePriceLabel: UILabel!
    

    override func viewDidLoad()
    {
        super.viewDidLoad()
        title = "Island Statistics"
        
        if let myIsland = islandDetails
        {
            islandNameLabel!.text? = myIsland.islandName
            languageLabel.text = myIsland.language
            populationLabel.text = "\(myIsland.population)"
            currencyLabel.text = myIsland.currency
            homePriceLabel.text = "\(myIsland.startingHomePrice)"
            
            
            
            
        }
        
        
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
