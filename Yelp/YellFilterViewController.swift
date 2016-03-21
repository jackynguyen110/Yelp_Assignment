//
//  YellFilterViewController.swift
//  Yelp
//
//  Created by jacky nguyen on 3/19/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

// create delegate when filter done
protocol FilterSettingDelegate: class {
    func onFilterSettingChange(YelpFilter:YellFilterViewController)
}

class YellFilterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {
    
    var model:YelpFilters?
    var delegate:FilterSettingDelegate?

    @IBAction func onCancelTapped(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func onSaveTapped(sender: AnyObject) {
        YelpFilters.instance.copyStateFrom(self.model!)
        delegate?.onFilterSettingChange(self)
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet weak var tableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.model = YelpFilters(instance: YelpFilters.instance)
        tableview.dataSource = self
        tableview.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return (self.model?.filters.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: nil)
        
        let filter = model!.filters[indexPath.section]
        switch filter.type {
            case .Single :
                if filter.isOpen == true {
                    let filterOption = filter.options[indexPath.row]
                    cell.textLabel?.text = filterOption.label
                    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
                    if filterOption.selected == true {
                        imageView.image = UIImage(named: "check")
                        cell.accessoryView = imageView
                    } else {
                        imageView.image = UIImage(named: "uncheck")
                        cell.accessoryView = imageView
                    }
                    
                } else {
                    cell.textLabel?.text = filter.options[filter.selectedIndex].label
                    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
                    imageView.image = UIImage(named: "dropdown")
                    cell.accessoryView = imageView
                }
            case .Multiple :
                if filter.isOpen == true || indexPath.row < filter.numItemsVisible {
                    let filterOption = filter.options[indexPath.row]
                    cell.textLabel?.text = filterOption.label
                    let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
                    if filterOption.selected == true {
                        imageView.image = UIImage(named: "check")
                        cell.accessoryView = imageView
                    } else {
                        imageView.image = UIImage(named: "uncheck")
                        cell.accessoryView = imageView
                    }
                } else {
                    cell.textLabel!.text = "See All"
                    cell.textLabel!.textAlignment = NSTextAlignment.Center
                    cell.textLabel!.textColor = .darkGrayColor()
            }
            case .Default :
                let filterOption = filter.options[indexPath.row]
                cell.textLabel?.text = filterOption.label
                cell.selectionStyle = UITableViewCellSelectionStyle.None
                let switchView = UISwitch(frame: CGRectZero)
                switchView.on = filterOption.selected
                switchView.onTintColor = UIColor(red: 73.0/255.0, green: 134.0/255.0, blue: 231.0/255.0, alpha: 1.0)
                switchView.addTarget(self, action: "switchChangedValue:", forControlEvents: UIControlEvents.ValueChanged)
                cell.accessoryView = switchView
        }
        return cell
        
    }
    
    func switchChangedValue(switchView: UISwitch){
        let cell = switchView.superview as! UITableViewCell
        if let index = self.tableview.indexPathForCell(cell) {
            let FilterCell = (self.model?.filters[index.section])! as Filter
            FilterCell.options[index.row].selected = switchView.on
        }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let filter = self.model?.filters[section]
        return filter?.label
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let filter = self.model?.filters[section]
        
        if filter?.isOpen == false {
            if filter?.type == FilterType.Single {
                return 1
            } else {
                return (filter?.numItemsVisible)! + 1
            }
        }
        return (filter?.options.count)!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let filter = self.model!.filters[indexPath.section]
        
        switch filter.type {
            case FilterType.Single :
                print(filter.isOpen)
                if filter.isOpen == true {
                        let previousIndex = filter.selectedIndex
                        if previousIndex != indexPath.row {
                            filter.selectedIndex = indexPath.row
                            let previousIndexPath = NSIndexPath(forRow: previousIndex, inSection: indexPath.section)
                            self.tableview.reloadRowsAtIndexPaths([indexPath, previousIndexPath], withRowAnimation: .Automatic)
                    }
                }
                
                    let opened = filter.isOpen
                    filter.isOpen = !opened

                    print(opened)
                    if opened == true {
                        let time = dispatch_time(DISPATCH_TIME_NOW, Int64(0.25 * Double(NSEC_PER_SEC)))
                        dispatch_after(time, dispatch_get_main_queue(), {
                            self.tableview.reloadSections(NSMutableIndexSet(index: indexPath.section), withRowAnimation: .Automatic)
                        })
                    } else {
                        print(opened)
                        self.tableview.reloadSections(NSMutableIndexSet(index: indexPath.section), withRowAnimation: .Automatic)
                    }
                case .Multiple:
                        if !filter.isOpen && indexPath.row == filter.numItemsVisible {
                            filter.isOpen = true
                            self.tableview.reloadSections(NSMutableIndexSet(index: indexPath.section), withRowAnimation: .Automatic)
                        } else {
                            let option = filter.options[indexPath.row]
                            option.selected = !option.selected
                            self.tableview.reloadRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
            }

            
        default: break
        }
    }

}


