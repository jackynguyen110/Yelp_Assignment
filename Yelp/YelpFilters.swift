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
                Option(label: "Offering a Deal", name: "deals_filter", value: "0")
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
        ),
        
        Filter(
            label: "Categories",
            options: [
                Option(label: "Afghan", value: "afghani"),
                Option(label: "African", value: "african"),
                Option(label: "American (New)", value: "newamerican"),
                Option(label: "American (Traditional)", value: "tradamerican"),
                Option(label: "Arabian", value: "arabian"),
                Option(label: "Argentine", value: "argentine"),
                Option(label: "Armenian", value: "armenian"),
                Option(label: "Asian Fusion", value: "asianfusion"),
                Option(label: "Australian", value: "australian"),
                Option(label: "Austrian", value: "austrian"),
                Option(label: "Bangladeshi", value: "bangladeshi"),
                Option(label: "Barbeque", value: "bbq"),
                Option(label: "Basque", value: "basque"),
                Option(label: "Belgian", value: "belgian"),
                Option(label: "Brasseries", value: "brasseries"),
                Option(label: "Brazilian", value: "brazilian"),
                Option(label: "Breakfast & Brunch", value: "breakfast_brunch"),
                Option(label: "British", value: "british"),
                Option(label: "Buffets", value: "buffets"),
                Option(label: "Burgers", value: "burgers"),
                Option(label: "Burmese", value: "burmese"),
                Option(label: "Cafes", value: "cafes"),
                Option(label: "Cafeteria", value: "cafeteria"),
                Option(label: "Cajun/Creole", value: "cajun"),
                Option(label: "Cambodian", value: "cambodian"),
                Option(label: "Caribbean", value: "caribbean"),
                Option(label: "Catalan", value: "catalan"),
                Option(label: "Cheesesteaks", value: "cheesesteaks"),
                Option(label: "Chicken Wings", value: "chicken_wings"),
                Option(label: "Chinese", value: "chinese"),
                Option(label: "Comfort Food", value: "comfortfood"),
                Option(label: "Creperies", value: "creperies"),
                Option(label: "Cuban", value: "cuban"),
                Option(label: "Czech", value: "czech"),
                Option(label: "Delis", value: "delis"),
                Option(label: "Diners", value: "diners"),
                Option(label: "Ethiopian", value: "ethiopian"),
                Option(label: "Fast Food", value: "hotdogs"),
                Option(label: "Filipino", value: "filipino"),
                Option(label: "Fish & Chips", value: "fishnchips"),
                Option(label: "Fondue", value: "fondue"),
                Option(label: "Food Court", value: "food_court"),
                Option(label: "Food Stands", value: "foodstands"),
                Option(label: "French", value: "french"),
                Option(label: "Gastropubs", value: "gastropubs"),
                Option(label: "German", value: "german"),
                Option(label: "Gluten-Free", value: "gluten_free"),
                Option(label: "Greek", value: "greek"),
                Option(label: "Halal", value: "halal"),
                Option(label: "Hawaiian", value: "hawaiian"),
                Option(label: "Himalayan/Nepalese", value: "himalayan"),
                Option(label: "Hot Dogs", value: "hotdog"),
                Option(label: "Hot Pot", value: "hotpot"),
                Option(label: "Hungarian", value: "hungarian"),
                Option(label: "Iberian", value: "iberian"),
                Option(label: "Indian", value: "indpak"),
                Option(label: "Indonesian", value: "indonesian"),
                Option(label: "Irish", value: "irish"),
                Option(label: "Italian", value: "italian"),
                Option(label: "Japanese", value: "japanese"),
                Option(label: "Korean", value: "korean"),
                Option(label: "Kosher", value: "kosher"),
                Option(label: "Laotian", value: "laotian"),
                Option(label: "Latin American", value: "latin"),
                Option(label: "Live/Raw Food", value: "raw_food"),
                Option(label: "Malaysian", value: "malaysian"),
                Option(label: "Mediterranean", value: "mediterranean"),
                Option(label: "Mexican", value: "mexican"),
                Option(label: "Middle Eastern", value: "mideastern"),
                Option(label: "Modern European", value: "modern_european"),
                Option(label: "Mongolian", value: "mongolian"),
                Option(label: "Moroccan", value: "moroccan"),
                Option(label: "Pakistani", value: "pakistani"),
                Option(label: "Persian/Iranian", value: "persian"),
                Option(label: "Peruvian", value: "peruvian"),
                Option(label: "Pizza", value: "pizza"),
                Option(label: "Polish", value: "polish"),
                Option(label: "Portuguese", value: "portuguese"),
                Option(label: "Russian", value: "russian"),
                Option(label: "Salad", value: "salad"),
                Option(label: "Sandwiches", value: "sandwiches"),
                Option(label: "Scandinavian", value: "scandinavian"),
                Option(label: "Scottish", value: "scottish"),
                Option(label: "Seafood", value: "seafood"),
                Option(label: "Singaporean", value: "singaporean"),
                Option(label: "Slovakian", value: "slovakian"),
                Option(label: "Soul Food", value: "soulfood"),
                Option(label: "Soup", value: "soup"),
                Option(label: "Southern", value: "southern"),
                Option(label: "Spanish", value: "spanish"),
                Option(label: "Steakhouses", value: "steak"),
                Option(label: "Sushi Bars", value: "sushi"),
                Option(label: "Taiwanese", value: "taiwanese"),
                Option(label: "Tapas Bars", value: "tapas"),
                Option(label: "Tapas/Small Plates", value: "tapasmallplates"),
                Option(label: "Tex-Mex", value: "tex-mex"),
                Option(label: "Thai", value: "thai"),
                Option(label: "Turkish", value: "turkish"),
                Option(label: "Ukrainian", value: "ukrainian"),
                Option(label: "Uzbek", value: "uzbek"),
                Option(label: "Vegan", value: "vegan"),
                Option(label: "Vegetarian", value: "vegetarian"),
                Option(label: "Vietnamese", value: "vietnamese")
            ],
            name: "category_filter",
            type: FilterType.Multiple,
            numItemVisible: 3
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
                                let selectedOption = filter.selectedOptions
                                if selectedOption.count > 0 {
                                    parameter[filter.name!] = filter.options[filter.selectedIndex].value
                                }
                            }
                        case FilterType.Multiple :
                            if(filter.selectedOptions.count > 0) {
                                parameter[filter.name!] = filter.selectedOptions.map({$0.value}).joinWithSeparator(",")
                            }
                        
                        case FilterType.Default :
                            for option in filter.options {
                                if option.name != nil {
                                    parameter[option.name!] = option.value
                                }
                            }
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
    var numItemsVisible: Int?
    
    init (label: String, options :Array<Option>, name: String? = nil, type: FilterType,numItemVisible: Int? = 0, isOpen: Bool = false ){
        self.label = label
        self.type  = type
        self.options = options
        self.isOpen = isOpen
        self.numItemsVisible = numItemVisible
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