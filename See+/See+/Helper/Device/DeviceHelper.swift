//
//  DeviceHelper.swift
//  See plus
//
//  Created by Quentin CLEMENT on 16/06/2018.
//  Copyright © 2018 Quentin. All rights reserved.
//

import UIKit

@objcMembers
open class DeviceHelper: NSObject {
    
    public class func isIphone5OrLess() -> Bool {
        return UIScreen.main.bounds.size.height <= 568
    }
    
    public class func isLessThanIphone5() -> Bool {
        return UIScreen.main.bounds.size.height < 568
    }
    
    public class func isIphone5() -> Bool {
        return UIScreen.main.bounds.size.height == 568
    }
    
    public class func isRetina() -> Bool {
        return UIScreen.main.scale >= 2.0
    }
    
    public class func isIpad() -> Bool {
        return UI_USER_INTERFACE_IDIOM() == .pad
    }
    
    public class func deviceWidthScale() -> CGFloat {
        return self.isIpad() ? 1 : UIScreen.main.bounds.size.width/320
    }
    
    public class func isForceTouchAvailable(traitCollection: UITraitCollection) -> Bool {
        if #available(iOS 9, *) {
            return traitCollection.forceTouchCapability == .available
        } else {
            return false
        }
    }
    
    public class func updatedSizeForDeviceScale(size: CGSize) -> CGSize {
        let deviceScale = UIScreen.main.scale
        return CGSize(width: size.width*deviceScale, height: size.height*deviceScale)
    }
    
    public class func deviceName(device: UIDevice) -> String {
        return device.systemName
    }
    
    public class func deviceSystemVersion(device: UIDevice) -> String {
        return device.systemVersion
    }
    
    public class func anonymousId() -> String? {
        return UIDevice.current.identifierForVendor?.uuidString
    }
    
}
