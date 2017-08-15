//
//  MGNavigationCenter.swift
//  MGRenterActionCenter
//
//  Created by Harly on 2017/8/15.
//  Copyright © 2017年 Harly. All rights reserved.
//

import UIKit
import DeeplinkNavigator

let MogoRenterScheme:String = "MG://app"

let wishUrl = "wishModule"

open class MGNavigationCenter
{
    open class func register(){
        
        Navigator.scheme = MogoRenterScheme
        
        MGNavigationCenter.register(for: wishUrl, in: "bundle", for: "Class")
    }
    
    
    /// Class from name
    ///
    /// - Parameters:
    ///   - bundleName: BundleName
    ///   - name: Class name
    /// - Returns: Class
    fileprivate class func className(with bundleName:String,
                                     for name:String) -> AnyClass?
    {
        if let classType = NSClassFromString(name)
        {
            return classType
        }
        let type = bundleName + "." + name
        
        return NSClassFromString(type)
    }
    
    
    /// Register using class Name
    ///
    /// - Parameters:
    ///   - url: path
    ///   - bundleName: bundleName
    ///   - className: class
    fileprivate class func register(for url : String ,
                                    in bundleName : String ,
                                    for className : String)
    {
        if let navigationClass = MGNavigationCenter.className(with: bundleName, for: className) as? DeeplinkNavigable.Type{
            Navigator.map(url , navigationClass)
        }
        else
        {
            assert(false , "Navigation mapping failed *** \(url) in bundle : \(bundleName) and ClassName : \(className)")
        }
    }

}

