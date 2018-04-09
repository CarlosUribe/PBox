//
//  CWelcomeController.swift
//  PBox
//
//  Created by Carlos Uribe on 07/04/18.
//  Copyright © 2018 Axcan. All rights reserved.
//

import UIKit

class CWelcomeController:CBaseController{

    weak var welcomeView:VWelcomeView!
    weak var controller:CMain!

    init(controller:CMain){
        self.controller = controller
        super.init(nibName:nil, bundle:nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        let welcomeView:VWelcomeView = VWelcomeView(controller:self)
        self.welcomeView = welcomeView
        view = welcomeView
    }
}
