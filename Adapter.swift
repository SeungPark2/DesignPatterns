//
//  Adapter.swift
//  DesignPatterns
//
//  Created by 박승태 on 2021/05/14.
//

import Foundation

/*
    Adapter Pattern
    서로 다른 타입인 객체들이 함께 동작하도록 만든다.
    (연광성 없는 두 객체 묶어 사용하기)
 
    ex) 외국의 콘센트는 110v를 사용하고
        우리나라의 콘센트는 220v을 사용한다.
        외국을 가게되면 변압기를 사용해 우리나라의 220v 콘센트를 외국에서 110v 콘센트에 사용한다.
        여기서 변압기가 adapter pattern의 역할을 한다.
 */

protocol SearchProtocol {
    func serach()
}

protocol FindAlgorithm {
    func find(global: Bool)
}

// 다른 회사에서 작성한 검색하는 기능을
// 우리회사의 검색하는 기능에서 동작하도록 하기 위해
// Adapter pattern을 사용하여 변환해줌.
class GlobalSearch: SearchProtocol {
    
    private findAlgorithm: FindAlgorithm
    
    init(findAlgorithm: FindAlgorithm) {
        self.findAlgorithm = findAlgorithm
    }

    // search라는 기능을 findAlgorithm을 통해 find라는 기능이 되도록 만듬.
    func search() {
        
        findAlgorithm.find(true)
    }
}
