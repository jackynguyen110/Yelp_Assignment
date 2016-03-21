//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit
import MBProgressHUD

class BusinessesViewController: UIViewController, FilterSettingDelegate{

    var businesses: [Business]!
    var filterResult : [Business]!
    var searchBar : UISearchBar!
    var searchActive : Bool = false
    var debounceTimer: NSTimer?
    var term:String!
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate   = self
        
        tableView.estimatedRowHeight = 110
        tableView.rowHeight = UITableViewAutomaticDimension

        
        searchBar = UISearchBar()
        searchBar.delegate = self
        searchBar.sizeToFit()
        searchBar.placeholder = "Restaurances"
        
        self.performSearch("")
        navigationItem.titleView = searchBar

    }
}

extension BusinessesViewController: UITableViewDelegate, UITableViewDataSource {
    // Implement methods of table view
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("YelpCell", forIndexPath: indexPath) as!YelpTableViewCell
        cell.business = businesses[indexPath.row]
        return cell
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let myBusinesses = self.businesses {
            return myBusinesses.count
        } else {
            return 0
        }
    }
}

extension BusinessesViewController: UISearchBarDelegate {
    
    
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(true, animated: true)
        return true;
    }
    
    func searchBarShouldEndEditing(searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(false, animated: true)
        return true;
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchBar.text = ""
        performSearch(searchBar.text!)
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        performSearch(searchBar.text!)
    }
    final func performSearch(term: String) {
        //MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        searchBar.resignFirstResponder()
        var near_by:Double?
        let parameter = YelpFilters.instance.Parameters
        if let raduis = Double(parameter["near_distance"]!){
            near_by = raduis
        } else {
            near_by = nil
        }
        var sortBy:YelpSortMode!
        if(parameter["sort_mode"] == "0") {
            sortBy = YelpSortMode.BestMatched
        } else if (parameter["sort_mode"] == "1") {
            sortBy = YelpSortMode.Distance
        } else {
            sortBy = YelpSortMode.HighestRated
        }
        
        print(sortBy)
        
        let deals:Bool? = (parameter["deals_filter"]!) == "1" ? true : nil

        Business.searchWithTerm(term, sort: sortBy, categories: ["vietnamese"], deals: deals, radius : near_by) { (businesses: [Business]!, error: NSError!) -> Void in
            if(businesses != nil){
                self.businesses = businesses
                self.tableView.reloadData()
                 //MBProgressHUD.hideHUDForView(self.view, animated: true)
            }
            
        }
    }
    
    func onFilterSettingChange(YelpFilter: YellFilterViewController) {
        searchBar.text = ""
        performSearch("")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.destinationViewController is UINavigationController {
            let navigationController = segue.destinationViewController as! UINavigationController
            if navigationController.viewControllers[0] is YellFilterViewController {
                let controller = navigationController.viewControllers[0] as! YellFilterViewController
                controller.delegate = self
            }
        }
    }



}
