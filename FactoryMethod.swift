//
//  FactoryMethod.swift
//  DesignPatterns
//
//  Created by 박승태 on 2021/05/18.
//

import Foundation

/*
    Factory Method Pattern
    Template Method의 사용
    구조와 구현의 분리와 장점을 이해
    
    객체 생성의 변동사항이 생겼을 때
    객체를 생성하는 Factory에서만 코드를 수정하면 됨.
    (객체 생성이 여러 곳에 있다면 각 부분들을 찾아 일일이 수정해야하는 일들이 발생함)
 */

protocol Component {
    
    func getCompName() -> String
}

extension Component {
    
    func create() {
        
        print("\(getCompName()) 생성")
    }
}

// ---------------------------------------------

class Button: Component {
    
    func getCompName() -> String {
        return "버튼"
    }
}

class Switch: Component {
    
    func getCompName() -> String {
        return "스위치"
    }
}

class Dropdown: Component {
    
    func getCompName() -> String {
        return "드랍다운"
    }
}

// ---------------------------------------------

enum Usage {
    case
        
    PRESS, TOGGLE, EXPAND
}

// ---------------------------------------------

class ComponentFactory {
    
    func getComponent(usage: Usage) -> Component {
        
        if usage == .PRESS { return Button() }
        else if usage == .TOGGLE { return Switch() }
        else { return Dropdown() }
    }
}

// ---------------------------------------------

class Console {
    
    private let componentFactory = ComponentFactory()
    
    var component1: Component?
    var component2: Component?
    var component3: Component?
    
    func withoutFactory() {
        
        component1 = Button()
        component1 = Switch()
        component1 = Dropdown()
    }
    
    func withFactory() {
        
        component1 = componentFactory.getComponent(usage: .PRESS)
        component2 = componentFactory.getComponent(usage: .TOGGLE)
        component3 = componentFactory.getComponent(usage: .EXPAND)
    }
}

let console = Console()
Console.withFactory()
