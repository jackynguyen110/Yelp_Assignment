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
    
    
    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        let term = searchBar.text!
        NSObject.cancelPreviousPerformRequestsWithTarget(self)
        self.performSelector("performSearch:", withObject: term, afterDelay: 0.5)
        //performSearch(searchText)
    }

    
    
    final func performSearch(term: String) {
        MBProgressHUD.showHUDAddedTo(self.view, animated: true)
        self.searchBar.resignFirstResponder()
        var near_by:Double!
        let parameter = YelpFilters.instance.Parameters
        if let raduis = Double(parameter["near_distance"]!){
            near_by = raduis
        } else {
            near_by = 0
        }
        var sortBy:YelpSortMode!
        if(parameter["sort"] == "1") {
            sortBy = YelpSortMode.BestMatched
        } else if (parameter["sort"] == "2") {
            sortBy = YelpSortMode.Distance
        } else {
            sortBy = YelpSortMode.Distance
        }
        
        let deals:Bool? = (parameter["deals_filter"]!) == "1" ? true : nil

        Business.searchWithTerm(term, sort: sortBy, categories: [], deals: deals, radius : near_by) { (businesses: [Business]!, error: NSError!) -> Void in
            if(businesses != nil){
                self.businesses = businesses
                self.tableView.reloadData()
                 MBProgressHUD.hideHUDForView(self.view, animated: true)
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
