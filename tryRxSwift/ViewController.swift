//
//  ViewController.swift
//  tryRxSwift
//
//  Created by Hiroo Kusaba on 2019/05/06.
//  Copyright © 2019年 Hiroo Kusaba. All rights reserved.
//

import RxSwift
import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let observable = Observable.of(
            "R",
            "Rx",
            "RxS",
            "RxSw",
            "RxSwi",
            "RxSwif",
            "RxSwift"
        )
        
        _ = observable
            .filter { $0.count >= 2 }
            .map { $0.lowercased() }
            .subscribe(onNext: {
                print("onNext: ", $0)
            },
                       onCompleted: {
                print("Done")
            })
    }
}
