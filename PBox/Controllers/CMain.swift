//
//  CMain.swift
//  Airtasker
//
//  Created by Carlos Uribe on 28/02/18.
//  Copyright © 2018 Airtasker. All rights reserved.
//

import UIKit

//Main app controller

class CMain:UIViewController{
    let interaction:CMainControllerInteraction
    var transition:CMainControllerTransition?
    private var statusBarStyle:UIStatusBarStyle

    init(){
        interaction = CMainControllerInteraction()
        statusBarStyle = UIStatusBarStyle.lightContent

        super.init(nibName:nil, bundle:nil)

        let mainController:CWelcomeController = CWelcomeController(controller:self)
        let transition:CMainControllerTransition = CMainControllerTransition.replace(
            controller:mainController)
        transitionTo(transition:transition)
    }

    required init?(coder:NSCoder){
        fatalError()
    }

    override var preferredStatusBarStyle:UIStatusBarStyle{
        return statusBarStyle
    }

    override var prefersStatusBarHidden:Bool{
        return false
    }

    //MARK: public

    func transitionTo(transition:CMainControllerTransition){
        UIApplication.shared.keyWindow?.endEditing(true)
        transition.startTransition(main:self)
    }

    func pop(){
        UIApplication.shared.keyWindow?.endEditing(true)
        transition?.pop()
    }

    func statusBarLight(){
        statusBarStyle = UIStatusBarStyle.lightContent
        setNeedsStatusBarAppearanceUpdate()
    }

    func statusBarDefault(){
        statusBarStyle = UIStatusBarStyle.default
        setNeedsStatusBarAppearanceUpdate()
    }
}
