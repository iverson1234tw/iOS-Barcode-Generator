//
//  ViewController.swift
//  BarcodeGenerator
//
//  Created by hungwei on 2021/9/2.
//

import UIKit
import CoreImage

@objcMembers
class ViewController: UIViewController {

    // generatorView init
    let generatorView = GeneratorView(frame: .zero)
    
    // currentBrightness init
    let currentBrightness = UIScreen.main.brightness
    
    // MARK: - viewDidLoad
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // navigationController properties
        navigationController?.navigationBar.isTranslucent = false
        
        // generatorView properties
        generatorView.codeTextField.text = "4711238491823"
        generatorView.generateButton.addTarget(self, action: #selector(generateButtonClicked), for: .touchUpInside)
        generatorView.lightSwitcher.addTarget(self, action: #selector(lightSwitcherChange), for: .valueChanged)
        
        view.addSubview(generatorView)
        
        // self add gesture
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(hideKeyboard)))
        
    }

    // MARK: - viewWillLayoutSubviews
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // generatorView constraints
        generatorView.snp.makeConstraints { maker in
            maker.left.top.right.bottom.equalToSuperview()
        }
        
    }
    
    // MARK: - hideKeyboard
    
    func hideKeyboard() {
        
        // view endEditing
        view.endEditing(true)
        
    }
    
    // MARK: - lightSwitcherChange
    
    func lightSwitcherChange(sender: AnyObject) {
        
        // tempSwitch init
        let tempSwitch = sender as! UISwitch
                
        // set the screen brightness
        UIScreen.main.brightness = tempSwitch.isOn ? CGFloat(1.0) : currentBrightness
        
    }
    
    // MARK: - generateButtonClicked
    
    func generateButtonClicked() {
        
        // set the barcodeImage to imageView
        generatorView.barcodeImageView.image = generateBarCode(messgae: generatorView.codeTextField.text)
        
    }
    
    // MARK: - generateBarCode with message
    
    func generateBarCode(messgae: String?) -> UIImage? {
        
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
