//
//  TemplateMethod.swift
//  DesignPatterns
//
//  Created by 박승태 on 2021/05/17.
//

import Foundation

/*
 
    Template Method Pattern
    알고리즘의 구조를 메소드에 정의하고
    하위 클래스에서 알고리즘 구조의
    변경없이 알고리즘을 재정의하는 패턴
    (어떤 같은 형식을 지닌 특정 작업들의 세부 방식을 다양화하고자 할 때)
 
    * 구현하려는 알고리즘이 일정한 프로세스가 있다. (여러 단계로 되어있다)
    * 구현하려는 알고리즘이 변경 가능성이 있다.
 
    1. 알고리즘을 여러 단계로 나눈다.
    2. 나눠진 알고리즘의 단계를 메소드로 선언한다.
    3. 알고리즘을 수행할 템플릿 메소드를 만든다.
    4. 하위 클래스에서 나눠진 메소드들을 구현한다.
 */

protocol MapView {
    
    func connectMapServer()
    func showMapOnScreen()
    func moveToCurrentLocation()
}

extension MapView {
    
    func initMap() {
        
        connectMapServer()
        showMapOnScreen()
        moveToCurrentLocation()
    }
}

class NaverMap: MapView {
    
    func connectMapServer() {
        print("네이버 지도 서버 연결")
    }
    
    func showMapOnScreen() {
        print("네이버 지도를 보여줌")
    }
    
    func moveToCurrentLocation() {
        print("네이버 지도에서 현 좌표로 이동")
    }
}

class KakaoMap: MapView {
    
    func connectMapServer() {
        print("카카오 지도 서버 연결")
    }
    
    func showMapOnScreen() {
        print("카카오 지도를 보여줌")
    }
    
    func moveToCurrentLocation() {
        print("카카오 지도에서 현 좌표로 이동")
    }
}

let naverMap = NaverMap()
naverMap.initMap()

let kakaoMap = KakaoMap()
kakaoMap.initMap()
