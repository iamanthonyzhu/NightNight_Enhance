//
//  ColorTable.swift
//  NightNight_Enhance
//
//  Created by anthony zhu on 2023/7/26.
//

import Foundation

public class ColorTable {
    public class var sharedInstance: ColorTable {
        struct Static {
            static let instance: ColorTable = ColorTable()
        }
        return Static.instance
    }
    
    fileprivate var colorEntries:[String:(String,String)] = [:]
    
    public func getValue(_ colorTableKey:String) -> (UIColor,UIColor)? {
        if let (normalColor,nightColor) = colorEntries[colorTableKey] {
            return (UIColor.init(hexString: normalColor), UIColor.init(hexString: nightColor))
        }
        return nil
    }
    
    public func setFile(fileName:String, type:String,fileBundle:Bundle? = Bundle.main) {
        if let filePath = fileBundle?.path(forResource: fileName, ofType: type) {
            do {
                let fileContent = try String(contentsOfFile: filePath)
                self.parseFileContent(fileContent)
                
            } catch {
                print("reading failure")
            }
        }
    }
    
    fileprivate func parseFileContent(_ contents:String) {
        var lines:[String] = contents.components(separatedBy: "\n").map { line in
            line.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        }
        if lines.count > 0 {
            lines.remove(at: 0)  //去掉第一行无用
            lines.forEach { line in
                var components = line.components(separatedBy: CharacterSet.whitespaces).map({ $0 }).filter({ !$0.isEmpty})
                if components.count > 1 {
                    if let key = components.last {
                        components.removeLast()
                        if (components.count > 1) {
                            colorEntries[key] = (components[0],components[1])
                        } else {
                            colorEntries[key] = (components[0],components[0])
                        }
                    }
                }
            }
        }
    }
    
}
