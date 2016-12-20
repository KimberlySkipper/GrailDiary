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
        self.title = "Islands"
        
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

    // MARK: - Navigation

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if segue.identifier == "DetailViewSegue"
        {
            // Get the new view controller using segue.destinationViewController.
            let detailVC = segue.destination as! DetailViewController
            let indexPath = tableView.indexPathForSelectedRow!
            let oneIsland = islandsArray[indexPath.row]
            detailVC.islandDetails = oneIsland
        }

    }


}// class end
