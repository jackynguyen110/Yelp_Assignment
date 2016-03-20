//
//  YelpFilters.swift
//  Yelp
//
//  Created by jacky nguyen on 3/19/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import Foundation

class YelpFilters {
    
    var filters = [
        Filter(
            label: "Popular",
            options: [
                Option(label: "Offering a Deal", name: "deals_filter", value: "1")
            ],
            type: .Default
        ),
        
        Filter(
            label: "Sort by",
            options: [
                Option(label: "Best Match", value: "0", selected: true),
                Option(label: "Distance", value: "1"),
                Option(label: "Rating", value: "2")
            ],
            name : "sort_mode",
            type: .Single
        ),
        
        Filter(
            label: "Distance",
            options: [
                Option(label: "Auto", value: "", selected: true),
                Option(label: "20 miles", value: "20"),
                Option(label: "5 miles", value: "5"),
                Option(label: "1 miles", value: "1"),
                Option(label: "0.3 miles", value: "0.3")
            ],
            name : "near_distance",
            type: .Single
        )
    ]
        
    
    init(instance: YelpFilters? = nil) {
        if instance != nil {
            self.copyStateFrom(instance!)
        }
    }
    
    func copyStateFrom(instance: YelpFilters) {
        for var f = 0; f < self.filters.count; f++ {
            for var o = 0; o < self.filters[f].options.count; o++ {
                self.filters[f].options[o].selected = instance.filters[f].options[o].selected
            }
        }
    }
    class var instance: YelpFilters {
        struct Static {
            static let instance: YelpFilters = YelpFilters()
        }
        return Static.instance
    }
 
    
    var Parameters: Dictionary<String,String> {
        get {
            var parameter = Dictionary<String, String>()
                for filter in filters {
                    switch filter.type {
                        case FilterType.Single :
                            if filter.name !=  nil {
                                var selectedOption = filter.selectedOptions
                                if selectedOption.count > 0 {
                                    parameter[filter.name!] = filter.options[filter.selectedIndex].value
                                }
                            }
                        case FilterType.Default :
                            for option in filter.options {
                                if option.name != nil {
                                    parameter[option.name!] = option.value
                                }
                            }
                        default : break
                        }
                    }
                return parameter
                }
        }
}


class Filter {
    var label : String
    var options: Array<Option>
    var name: String?
    var type  : FilterType
    var isOpen : Bool
    
    init (label: String, options :Array<Option>, name: String? = nil, type: FilterType, isOpen: Bool = false ){
        self.label = label
        self.type  = type
        self.options = options
        self.isOpen = isOpen
        self.name = name
    }
    
    var selectedIndex: Int {
        get {
            for var i = 0; i < self.options.count; i++ {
                if options[i].selected == true {
                    return i
                }
            }
            return -1
        }
        set {
            if (self.type == .Single) {
                self.options[self.selectedIndex].selected = false
            }
            self.options[newValue].selected = true
        }
    }
    
    var selectedOptions: Array<Option> {
        get {
            var options:Array<Option> = []
            for option in self.options {
                if option.selected == true{
                    options.append(option)
                }
            }
            return options
            
        }
    }
}

enum FilterType {
    case Default, Single, Multiple
}


class Option {
    var label: String
    var value: String
    var name : String?
    var selected: Bool
    
    init(label: String, name: String? = nil, value : String, selected: Bool =  false){
        self.label = label
        self.name  = name
        self.value = value
        self.selected = selected
    }
}