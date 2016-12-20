//
//  IslandTableViewController.swift
//  GrailDiary
//
//  Created by Kimberly Skipper on 12/19/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class IslandTableViewController: UITableViewController
{

    var islandsArray = [Island]()
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.loadIslandList()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
       
        return islandsArray.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "IslandCell", for: indexPath)
        
        let anIsland = islandsArray[indexPath.row]
        cell.textLabel?.text = anIsland.islandName

        return cell
    }
    
    func loadIslandList ()
    {
        
        let bundle = Bundle(for: type(of: self))
        if let theURL = bundle.url(forResource: "Island", withExtension: "json")
        {
            do
            {
                let data = try Data(contentsOf: theURL)
                if let arrayOfDictionaries = try? JSONSerialization.jsonObject(with: data) as! [[String:Any]]
                {
                    
                    if let createAnArray = Island.createIslandArrayFromArray(dictionaryOfIslandsMadeFromJSON: arrayOfDictionaries)
                    {
                        self.islandsArray = createAnArray
                        self.tableView.reloadData()
                    }
                    
                    
                }
            }
            catch
            {
                print(error)
            }
        }
    }

    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
