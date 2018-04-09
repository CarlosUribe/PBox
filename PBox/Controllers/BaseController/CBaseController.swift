//
//  CBaseController.swift
//  PBox
//
//  Created by Carlos Uribe on 07/04/18.
//  Copyright © 2018 Axcan. All rights reserved.
//

import UIKit

class CBaseController:UIViewController{
    override func viewDidLoad(){
        super.viewDidLoad()

        edgesForExtendedLayout = UIRectEdge()
        extendedLayoutIncludesOpaqueBars = false
    }

    override var preferredStatusBarStyle:UIStatusBarStyle{
        return UIStatusBarStyle.lightContent
    }

    override var prefersStatusBarHidden:Bool{
        return false
    }
}
