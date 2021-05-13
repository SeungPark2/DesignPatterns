//
//  Strategy.swift
//  DesignPatterns
//
//  Created by 박승태 on 2021/05/13.
//

import Foundation

/*
    1. Protocol(Interface)
       기능에 대한 선언과 구현을 분리
       기능을 사용 통로
 
    2. Delegate
       위임하다
       특정 객체의 기능을 사용하기 위해
       다른 객체의 기능을 호출하는 것
 
    3. Strategy Pattern
       여러 알고리즘을 하나의 추상적인 접근점을 만들어 접근 점에서
       서로 교환 가능하도록 하는 패턴
 */

// 캐릭터와 무기를 구현해주세요.

protocol Weapon {
    func attack()
}

class Nife: Weapon {
    
    func attack() {
        
        print("칼 공격")
    }
}

class Sword: Weapon {
    
    func attck() {
        
        print("검 공격")
    }
}

class GameCharacter {
    
    private var weapon: Weapon?
    
    func setWeapon(_ weapon: Weapon) {
        
        self.weapon = weapon
    }
    
    func attack() {
        
        if weapon == nil {
            
            print("맨손 공격")
            return
        }
        
        weapon.attack()
    }
}

var character = GameCharacter() // weapon == nil
character.attack()              // 맨손 공격

character.setWeapon(Nife())     // weapon == Nife
character.attack()              // 칼 공격

character.setWeapon(Sword())    // weapon == Sword
character.attack()              // 검 공격

// 무기(도끼)를 추가해주세요.

class Ax: Weapon {
    
    func weapon() {
        
        print("도끼 공격")
    }
}

character.setWeapon(AX())       // weapon == Ax
character.attack()              // 도끼 공격
