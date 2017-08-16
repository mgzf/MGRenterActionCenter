//
//  MGNavigationCenter.swift
//  MGRenterActionCenter
//
//  Created by Harly on 2017/8/15.
//  Copyright © 2017年 Harly. All rights reserved.
//

import UIKit
import DeeplinkNavigator

let MGNavSubStoreName = "NavigationSubStore"

let MGNavRegistionFuncName = "navigationMapping"

let MogoRenterScheme:String = "MG://app"

let wishUrl = "\(MogoRenterScheme)/wishModule"

open class MGNavigationCenter
{
    open class func register(){
        
        Navigator.scheme = MogoRenterScheme
        
        MGNavigationCenter.register(with: "MGRenterWishModule")
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
    
    
    /// Register all urls in sub projects
    ///
    /// - Parameter projectName: Project Name
    fileprivate class func register(with projectName : String)
    {
        guard let subStoreClass = NSClassFromString("\(projectName).\(MGNavSubStoreName)") as? NSObject.Type
            
        else
        {
            assert(false , "Project register error : \(projectName) or \(MGNavSubStoreName) cannot be found in your project" )
            
            return
        }
        
        let subStore = subStoreClass.init()
        
        let registionAction = Selector((MGNavRegistionFuncName))
        
        let result = subStore.perform(registionAction).takeUnretainedValue()
        
        guard let registionResult = result as? [String : String] else {
            
            assert(false , "Project registion error with return value \(result)" )
            return
            
        }
        
        for (vcName , vcUrl) in registionResult
        {
            MGNavigationCenter.register(for: vcUrl, in: projectName, for: vcName)
        }
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

