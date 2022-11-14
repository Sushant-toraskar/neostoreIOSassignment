//
//  NavigationModel.swift
//  NeostoreAssignment
//
//  Created by Neosoft on 11/11/22.
//

import Foundation
var options: [option] = [option(title: "My cart",
                                    segue: "",
                                    icon : "shoppingcart_icon"),
                             option(title: "Tables",
                                    segue: "",
                                    icon : "tables_icon"),
                             option(title: "Sofas",
                                    segue: "",
                                    icon : "sofa_icon"),
                             option(title: "Chairs",
                                    segue: "",
                                    icon : "chair_icon"),
                             option(title: "Cupboards",
                                    segue: "",
                                    icon : "cupboard_icon"),
                             option(title: "My Account",
                                    segue: "",
                                    icon : "username_icon"),
                             option(title: "Store Locator",
                                    segue: "",
                                    icon : "storelocator_icon"),
                             option(title: "My Orders",
                                    segue: "",
                                    icon : "myorders_icon"),
                             option(title: "Logout",
                                    segue: "",
                                    icon : "logout_icon")
                            ]
    
    struct option {
        var title = String()
        var segue = String()
        var icon = String()
    }
