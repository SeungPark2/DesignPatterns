//
//  Singleton.swift
//  DesignPatterns
//
//  Created by 박승태 on 2021/05/20.
//

import UIKit

/*
 
    객체     : 속성과 기능을 갖춘 것
    클래스    : 속성과 기능을 정의한 것
    인스턴스   : 속성과 기능을 가진 것 중 실제하는 것
 
    싱글톤    : 하나의 인스턴스만 생성하도록 구현하는 것
 */

class Settings {
    
    private init() { }
    static let shared: Settings = Settings()
    
    var isDark: Bool = false
    private var backgroundColor: UIColor = .white
    
    func changeBackgroundColor() {
        
        if isDark {
            
            backgroundColor = .black
            return
        }
        
        backgroundColor = .white
    }
}

print(Settings.shared.isDark)
Settings.shared.isDark = true
Settings.shared.changeBackgroundColor
print(Settings.shared.isDark)
