//
//  NSObject+Customize.swift
//  Pods
//
//  Created by Draveness on 7/11/16.
//
//

import Foundation

extension NSObject {
    fileprivate struct AssociatedKeys {
        static var customizeKey = "customizeKey"
    }

    fileprivate var customize: Customize {
        get {
            if let obj = objc_getAssociatedObject(self, &AssociatedKeys.customizeKey) as? Customize {
                return obj
            }

            objc_setAssociatedObject(self, &AssociatedKeys.customizeKey, Customize(obj: self), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)

            return objc_getAssociatedObject(self, &AssociatedKeys.customizeKey) as! Customize
        }
    }

    fileprivate /*public*/ func customize(_ closure: @escaping (NightNight.Theme) -> ()) {
        closure(NightNight.theme)
        self.customize.closures.append(closure)
    }
    
    //anthzhu adds for custom block
    public func sharedCustomize(_ closure: @escaping (NightNight.Theme) -> ()) {
        closure(NightNight.theme)
        self.customize.closures = [closure]
    }

}

open class Customize: NSObject {
    fileprivate var closures: [(NightNight.Theme) -> ()] = []
    fileprivate weak var correspondingObject: NSObject?

    fileprivate convenience init(obj: NSObject) {
        self.init()
        self.correspondingObject = obj

        NotificationCenter.default.addObserver(self, selector: #selector(_callAllExistingClosures), name: NSNotification.Name(rawValue: NightNightThemeChangeNotification), object: nil)
    }

    @objc func _callAllExistingClosures() {
        closures.forEach {
            $0(NightNight.theme)
        }
    }
}
