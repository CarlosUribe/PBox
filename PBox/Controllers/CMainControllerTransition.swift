//
//  CMainControllerTransition.swift
//  Airtasker
//
//  Created by Carlos Uribe on 28/02/18.
//  Copyright © 2018 Airtasker. All rights reserved.
//

import UIKit

//Main transition Controller

class CMainControllerTransition{
    enum CMainControllerTransitionPoptype{
        case all
        case current
        case none
    }

    weak var main:CMain!
    var controller:UIViewController!
    var previousTransition:CMainControllerTransition?

    //Only provides push right and replace transitions it can be implemented to provide left transition, peek transitions form left or right 
    class func pushRight(controller:UIViewController, poptype:CMainControllerTransitionPoptype) -> CMainControllerTransitionPushRight{
        let transition:CMainControllerTransitionPushRight = CMainControllerTransitionPushRight(controller:controller, poptype:poptype)

        return transition
    }

    class func replace(controller:UIViewController) -> CMainControllerTransitionReplace{
        let transition:CMainControllerTransitionReplace = CMainControllerTransitionReplace(controller:controller)

        return transition
    }

    init(controller:UIViewController){
        self.controller = controller
    }

    //MARK: public

    func popAllPrevious(){
        previousTransition?.popAllPrevious()
        previousTransition?.popNoAnimation()
        previousTransition = nil
    }

    func popCurrentPrevious(){
        previousTransition?.popNoAnimation()
        previousTransition = previousTransition?.previousTransition
    }

    func popNoAnimation(){
        controller?.view.removeFromSuperview()
        controller?.removeFromParentViewController()
        controller?.didMove(toParentViewController:nil)
    }

    func startTransition(main:CMain){
        self.main = main
        previousTransition = main.transition
        main.transition = self
    }

    func pop(){
        main.transition = previousTransition
        popNoAnimation()
    }
}

