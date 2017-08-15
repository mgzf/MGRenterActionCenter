//
//  MGRenterWishModuleNavigates.swift
//  MGRenterActionCenter
//
//  Created by Harly on 2017/8/15.
//  Copyright © 2017年 Harly. All rights reserved.
//

import UIKit
import DeeplinkNavigator

public protocol WillNavigateToWishCenter : class
{
    func navigatorToWishList()
}

public extension WillNavigateToWishCenter {
    
    public func navigatorToWishList()
    {
        Navigator.push(wishUrl)
    }
    
}
