//
//  BarcodeModel.swift
//  BarcodeGenerator
//
//  Created by hungwei on 2021/9/2.
//

import UIKit

class BarcodeModel {

    // defaultCode init
    static let defaultCode = "4711238491823"
    
    // MARK: - generateBarCode with message
    
    static func generateBarCode(messgae: String?) -> UIImage? {
        
        // inputData init
        let inputData = messgae?.data(using: String.Encoding.utf8, allowLossyConversion: false)

        // CICode128BarcodeGenerator
        let filter = CIFilter.init(name: "CICode128BarcodeGenerator")!

        // set inputMessage
        filter.setValue(inputData, forKey: "inputMessage")
        
        // if barImage is exist
        guard let barImage = filter.outputImage else { return nil }
    
        // transform init
        let transform = CGAffineTransform(scaleX: 5.0, y: 5.0)
        
        // scaled init
        let scaled = barImage.transformed(by: transform)
                
        return(UIImage(ciImage: scaled))
    }
    
}
