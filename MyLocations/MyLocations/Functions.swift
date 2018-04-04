//
//  Functions.swift
//  MyLocations
//
//  Created by Fernanda Araújo on 04/04/18.
//  Copyright © 2018 thoughtworks. All rights reserved.
//

import Foundation

func afterDelay(_ seconds: Double, run: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + seconds,
                                  execute: run)
}
