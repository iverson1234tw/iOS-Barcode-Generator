//
//  GeneratorView.swift
//  BarcodeGenerator
//
//  Created by hungwei on 2021/9/2.
//

import UIKit

class GeneratorView: UIView {

    // titleLabel init
    let lightLabel = UILabel()
    
    // lightSwitcher init
    let lightSwitcher = UISwitch()
    
    // codeTitleLabel init
    let codeTitleLabel = UILabel()
    
    // codeTextField init
    let codeTextField = UITextField()
    
    // generateButton init
    let generateButton = UIButton()
    
    // barcodeImageView init
    let barcodeImageView = UIImageView()
    
    // MARK: - init with Frame
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // titleLabel properties
        lightLabel.font = UIFont(name: "Helveitca", size: 20)
        lightLabel.textColor = .black
        lightLabel.text = "調高亮度"
        
        addSubview(lightLabel)
        
        // lightSwitcher properties
        
        addSubview(lightSwitcher)
        
        // codeTitleLabel properties
        codeTitleLabel.font = lightLabel.font
        codeTitleLabel.textColor = .lightGray
        codeTitleLabel.text = "Text to Barcode"
        
        addSubview(codeTitleLabel)
        
        // codeTextField properties
        codeTextField.font = UIFont(name: "Helvetica-Light", size: 15)
        codeTextField.textColor = .darkGray
        codeTextField.layer.cornerRadius = 2.5
        codeTextField.layer.masksToBounds = true
        codeTextField.layer.borderWidth = 0.5
        codeTextField.layer.borderColor = UIColor.darkGray.cgColor
        codeTextField.placeholder = "Fill in text to generate barcode image"
        codeTextField.leftViewMode = .always
        codeTextField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
        codeTextField.keyboardType = .asciiCapable
        
        addSubview(codeTextField)
        
        // generateButton properties
        generateButton.layer.cornerRadius = 2.5
        generateButton.clipsToBounds = true
        generateButton.backgroundColor = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
        generateButton.setTitleColor(.white, for: .normal)
        generateButton.setTitle("Enter", for: .normal)
        generateButton.titleLabel?.font = UIFont(name: "Helvetica", size: 20)
        
        addSubview(generateButton)
        
        // barcodeImageView properties
        barcodeImageView.contentMode = .scaleAspectFill
        
        addSubview(barcodeImageView)
        
    }
    
    // MARK: - layoutSubviews
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        // lightSwitcher constraints
        lightSwitcher.snp.makeConstraints { maker in
            maker.top.equalToSuperview().offset(30)
            maker.right.equalToSuperview().offset(-30)
            maker.width.equalTo(50)
            maker.height.equalTo(30)
        }
        
        // lightLabel constraints
        lightLabel.snp.makeConstraints { maker in
            maker.centerY.equalTo(lightSwitcher)
            maker.right.equalTo(lightSwitcher.snp.left).offset(-10)
        }
        
        // codeTitleLabel constraints
        codeTitleLabel.snp.makeConstraints { maker in
            maker.top.equalTo(lightSwitcher.snp.bottom).offset(30)
            maker.left.equalToSuperview().offset(30)
        }
        
        // codeTextField constraints
        codeTextField.snp.makeConstraints { maker in
            maker.top.equalTo(codeTitleLabel.snp.bottom).offset(10)
            maker.left.equalToSuperview().offset(30)
            maker.right.equalToSuperview().offset(-30)
            maker.height.equalTo(45)
        }
        
        // generateButton constraints
        generateButton.snp.makeConstraints { maker in
            maker.top.equalTo(codeTextField.snp.bottom).offset(15)
            maker.left.right.equalTo(codeTextField)
            maker.height.equalTo(50)
        }
        
        // barcodeImageView constraints
        barcodeImageView.snp.makeConstraints { maker in
            maker.centerY.equalToSuperview()
            maker.left.right.equalTo(codeTextField)
            maker.height.equalTo(40)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
