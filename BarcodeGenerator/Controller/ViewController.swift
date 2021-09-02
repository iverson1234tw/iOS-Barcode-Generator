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
        generatorView.codeTextField.text = BarcodeModel.defaultCode
        generatorView.generateButton.addTarget(self, action: .generateButtonClicked, for: .touchUpInside)
        generatorView.lightSwitcher.addTarget(self, action: .lightSwitcherChange, for: .valueChanged)
        
        view.addSubview(generatorView)
        
        // self add gesture
        view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: .touchScreen))
        
    }

    // MARK: - viewWillLayoutSubviews
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // generatorView constraints
        generatorView.snp.makeConstraints { maker in
            maker.left.top.right.bottom.equalToSuperview()
        }
        
    }
    
    // MARK: - lightSwitcherChange with sender
    
    func lightSwitcherChange(sender: AnyObject) {
        
        // tempSwitch init
        let tempSwitch = sender as! UISwitch

        // set the screen brightness by switcher status
        UIScreen.main.brightness = tempSwitch.isOn ? CGFloat(1.0) : self.currentBrightness
        
    }
    
    // MARK: - generateButtonClicked
    
    func generateButtonClicked() {
        
        // make sure text is not empty
        guard !generatorView.codeTextField.text!.isEmpty else {
            
            // view end edit
            view.endEditing(true)
            
            return
        }
        
        // set the barcodeImage to imageView
        generatorView.barcodeImageView.image =
            BarcodeModel.generateBarCode(messgae: generatorView.codeTextField.text)
        
    }
    
    // MARK: - touchScreen
    
    func touchScreen() {
        
        // view endEditing
        view.endEditing(true)
        
    }        
    
}

// MARK: - private Selector extension

private extension Selector {
    
    // touchScreen static init
    static let touchScreen = #selector(ViewController.touchScreen)
    
    // lightSwitcherChange static init
    static let lightSwitcherChange = #selector(ViewController.lightSwitcherChange)
    
    // generateButtonClicked static init
    static let generateButtonClicked = #selector(ViewController.generateButtonClicked)
    
}
