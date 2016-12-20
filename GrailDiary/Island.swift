//
//  Island.swift
//  GrailDiary
//
//  Created by Kimberly Skipper on 12/19/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import Foundation

class Island
{
    let islandName: String
    let population: Int
    let language: String
    let currency: String
    let startingHomePrice: Int
    
    init(islandName: String, population: Int, language: String, currency: String, startingHomePrice: Int)
    {
        self.islandName = islandName
        self.population = population
        self.language = language
        self.currency = currency
        self.startingHomePrice = startingHomePrice
    }
    
    static func createIslandArrayFromArray(dictionaryOfIslandsMadeFromJSON: [Any]) ->[Island]?
    {
        var arrayOfIslands = [Island]()
    
        if dictionaryOfIslandsMadeFromJSON.count > 0
        {
            for anEntry in dictionaryOfIslandsMadeFromJSON
            {
                if let aSingleIslandDictionary = anEntry as? [String: Any]
                {
                    if let anIslandName = aSingleIslandDictionary["islandName"] as? String
                    {
                        if let aPopulation = aSingleIslandDictionary["population"] as? Int
                        {
                            if let aLanguage = aSingleIslandDictionary["language"] as? String
                            {
                                if let aCurrency = aSingleIslandDictionary["currency"] as? String
                                {
                                    if let aHomePrice = aSingleIslandDictionary["startingHomePrice"] as? Int
                                    {
                                        let anIsland = Island(islandName: anIslandName, population: aPopulation, language: aLanguage, currency: aCurrency, startingHomePrice: aHomePrice)
                                    
                                        arrayOfIslands.append(anIsland)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        return arrayOfIslands
    }
}// class end

