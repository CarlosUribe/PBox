//
//  CMainControllerTransitionReplace.swift
//  Airtasker
//
//  Created by Carlos Uribe on 01/03/18.
//  Copyright © 2018 Airtasker. All rights reserved.
//

import Foundation

class CMainControllerTransitionReplace:CMainControllerTransition
{
    override func startTransition(main:CMain){
        main.addChildViewController(controller)
        main.view.addSubview(controller.view)
        controller.view.frame = main.view.bounds
        controller.didMove(toParentViewController:main)

        super.startTransition(main:main)

        popAllPrevious()
        previousTransition = nil
    }
}
