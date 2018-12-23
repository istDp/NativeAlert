//
//  ADCountry.swift
//  ADCountryPicker
//
//  Created by Amila on 21/04/2017.
//  Copyright © 2017 Amila Diman. All rights reserved.
//

import UIKit

class ADCountry: NSObject {
    @objc var name: String
    @objc var code: String
    var section: Int?
   @objc  var dialCode: String!
   @objc  var flagImg: UIImage?
    
    init(name: String, code: String, dialCode: String = " - ", flagImg: UIImage?) {
        self.name = name
        self.code = code
        self.dialCode = dialCode
        self.flagImg = flagImg
    }
}
class Utilities {
    
    var CallingCodes = { () -> [[String: String]] in
        let resourceBundle = Bundle(for: ADCountryPicker.classForCoder())
        guard let path = resourceBundle.path(forResource: "CallingCodes", ofType: "plist") else { return [] }
        return NSArray(contentsOfFile: path) as! [[String: String]]
    }()
    
    //MARK:- get default/current country from locale
    func getCountryFromLocale(Code:String? = nil) -> (countryCode:String,countryName:String,flag: UIImage,dialCode:String) {
        var imageFlage:UIImage?
        var countryCode = ""
        if Code != nil{
            countryCode = Code ?? "US"
        }else{
            countryCode = (Locale.current as NSLocale).object(forKey: .countryCode) as? String ?? "US"
        }
        let locale = Locale.current
        let  displayCountryName = (locale as NSLocale).displayName(forKey: NSLocale.Key.countryCode, value: countryCode)!
        let countryData = CallingCodes.filter { $0["code"] == countryCode }
        let bundle = "assets.bundle/"
        if let imgFlag =  UIImage(named: bundle + countryCode.uppercased() + ".png", in: Bundle(for: ADCountryPicker.self), compatibleWith: nil) {
            imageFlage = imgFlag
        }else{
            imageFlage = UIImage.init(color: .lightGray,
                                      size: CGSize(width:CGFloat(25), height:CGFloat(20)/CGFloat(1.5)))?.fitImage(size: CGSize(width:CGFloat(25), height:CGFloat(20)/CGFloat(1.5)))
        }
        if countryData.count > 0, let dialCode = countryData[0]["dial_code"] {
            return(countryCode:countryCode,countryName:displayCountryName,flag:imageFlage!,dialCode:dialCode)
        } else {
            return(countryCode:countryCode,countryName:displayCountryName,flag:imageFlage!,dialCode: "")
        }
    }
}
