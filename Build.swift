//
//  Build.swift
//  DesignPatterns
//
//  Created by 박승태 on 2021/05/12.
//

import UIKit

/*
 빌더패턴이란?
 많은 인자를 가진 객체의 생성을
 다른 객체의 도움으로 생성하는 패턴
        <키워드>
 *** 가독성 & 많은 멤버 변수 ***
*/

// iOS Style

protocol UILabelBuilder {
        
    func withText(_ text: String?) -> UILabelBuilder
    func withTextColor(_ color: UIColor) -> UILabelBuilder
    func withFont(_ font: UIFont) -> UILabelBuilder
    func withTextAlignment(_ textAlignment: NSTextAlignment) -> UILabelBuilder
    func build() -> UILabel
}

class CustomLabel: UILabelBuilder {
        
    private var text: String? = nil
    private var textColor: UIColor = .black
    private var font: UIFont = .systemFont(ofSize: 13)
    private var textAlignment: NSTextAlignment = .left
    
    static func create() -> UILabelBuilder {
        return CustomLabel()
    }
    
    func withText(_ text: String?) -> UILabelBuilder {
        self.text = text
        return self
    }
    
    func withTextColor(_ color: UIColor) -> UILabelBuilder {
        self.textColor = color
        return self
    }
    
    func withFont(_ font: UIFont) -> UILabelBuilder {
        self.font = font
        return self
    }
    
    func withTextAlignment(_ textAlignment: NSTextAlignment) -> UILabelBuilder {
        self.textAlignment = textAlignment
        return self
    }
    
    func build() -> UILabel {
        
        let label = UILabel()
        label.text = self.text
        label.textColor = self.textColor
        label.font = self.font
        label.textAlignment = self.textAlignment
        return label
    }
}

let label = CustomLabel
                .create()
                .withText("테스트")
                .withTextColor(.blue)
                .build()
    

// Java Style

public class Computer {
    
    private var cpu: String
    private var ram: String
    private var storage: String
    
    init(cpu: String,
         ram: String,
         storage: String) {
        
        self.cpu = cpu
        self.ram = ram
        self.storage = storage
    }
    
    func setCpu(_ cpu: String) {
        
        self.cpu = cpu
    }
    
    func getCpu() -> String {
        
        return self.cpu
    }
    
    func setRam(_ ram: String) {
        
        self.ram = ram
    }
    
    func getRam() -> String {
        
        return self.ram
    }
    
    func setStorage(_ storage: String) {
        
        self.storage = storage
    }
    
    func getStorage() -> String {
        
        return self.storage
    }
}

public class ComputerBuilder {
    
    private var computer: Computer
    
    private init() {
        
        computer = Computer(cpu: "defualt",
                            ram: "defualt",
                            storage: "defualt")
    }
    
    static func start() -> ComputerBuilder {
        
        return ComputerBuilder()
    }
    
    func setCpu(_ cpu: String) -> ComputerBuilder {
        
        computer.setCpu(cpu)
        return self
    }
    
    func setRam(_ ram: String) -> ComputerBuilder {
        
        computer.setRam(ram)
        return self
    }
    
    func setStorage(_ storage: String) -> ComputerBuilder {
        
        computer.setStorage(storage)
        return self
    }
    
    func build() -> Computer {
        
        return computer
    }
}

var computer: Computer = ComputerBuilder
                            .start()
                            .setCpu("i7")
                            .setRam("16g")
                            .setStorage("256g ssd")
                            .build()
