//
//  VWelcomeView.swift
//  PBox
//
//  Created by Carlos Uribe on 07/04/18.
//  Copyright © 2018 Axcan. All rights reserved.
//

import UIKit

class VWelcomeView:UIView{
    weak var controller:CWelcomeController!
    weak var blackJammerButton:UIButton!
    weak var whiteJammerButton:UIButton!
    weak var blackBlockerButton:UIButton!
    weak var whiteBlockerButton:UIButton!
    weak var blackSecondBlockerButton:UIButton!
    weak var whiteSecondBlockerButton:UIButton!
    weak var timerBlackJammer:Timer?
    weak var timerWhiteJammer:Timer?
    weak var timerFirstBlackBlocker:Timer?
    weak var timerFirstWhiteBlocker:Timer?
    weak var timerSecondBlackBlocker:Timer?
    weak var timerSecondWhiteBlocker:Timer?

    private var kCornerRadius:CGFloat = 50
    private var startTime: Double = 0
    private var time: Double = 0
    private var elapsed: Double = 0
    private var status: Bool = false

    convenience init(controller:CWelcomeController){
        self.init()
        self.controller = controller

        let blackStackView:UIStackView = UIFactory.shared.getHorizontalStackView(backgroundColor: .clear)
        let whiteStackView:UIStackView = UIFactory.shared.getHorizontalStackView(backgroundColor: .clear)

        let blackJammerButton:UIButton = UIFactory.shared.getButton(
            withText: "J",
            bordered: true,
            borderColor: UIColor(red:0.07, green:0.49, blue:0.34, alpha:1.0),
            backgroundColor: UIColor(red:0.29, green:0.90, blue:0.68, alpha:1.0),
            cornerRadius: kCornerRadius,
            titleColor: UIColor.white,
            textSize: 20)
        blackJammerButton.addTarget(self,
                              action: #selector(blackJammerAction(sender:)),
                              for: .touchUpInside)
        self.blackJammerButton = blackJammerButton

        let whiteJammerButton:UIButton = UIFactory.shared.getButton(
            withText: "J",
            bordered: true,
            borderColor: UIColor(red:0.07, green:0.49, blue:0.34, alpha:1.0),
            backgroundColor: UIColor(red:0.29, green:0.90, blue:0.68, alpha:1.0),
            cornerRadius: kCornerRadius,
            titleColor: UIColor.white,
            textSize: 20)
        whiteJammerButton.addTarget(self,
                              action: #selector(whiteJammerAction(sender:)),
                              for: .touchUpInside)
        self.whiteJammerButton = whiteJammerButton

        let whiteBlockerButton:UIButton = UIFactory.shared.getButton(
            withText: "B",
            bordered: true,
            borderColor: UIColor(red:0.16, green:0.24, blue:0.73, alpha:1.0),
            backgroundColor: UIColor(red:0.37, green:0.47, blue:1.00, alpha:1.0),
            cornerRadius: kCornerRadius,
            titleColor: UIColor.white,
            textSize: 20)
        whiteBlockerButton.addTarget(self,
                              action: #selector(firstWhiteBlockerAction(sender:)),
                              for: .touchUpInside)
        self.whiteBlockerButton = whiteBlockerButton

        let whiteSecondBlockerButton:UIButton = UIFactory.shared.getButton(
            withText: "B",
            bordered: true,
            borderColor: UIColor(red:0.16, green:0.24, blue:0.73, alpha:1.0),
            backgroundColor: UIColor(red:0.37, green:0.47, blue:1.00, alpha:1.0),
            cornerRadius: kCornerRadius,
            titleColor: UIColor.white,
            textSize: 20)
        whiteSecondBlockerButton.addTarget(self,
                              action: #selector(secondWhiteBlockerAction(sender:)),
                              for: .touchUpInside)
        self.whiteSecondBlockerButton = whiteSecondBlockerButton

        let blackBlockerButton:UIButton = UIFactory.shared.getButton(
            withText: "B",
            bordered: true,
            borderColor: UIColor(red:0.16, green:0.24, blue:0.73, alpha:1.0),
            backgroundColor: UIColor(red:0.37, green:0.47, blue:1.00, alpha:1.0),
            cornerRadius: kCornerRadius,
            titleColor: UIColor.white,
            textSize: 20)
        blackBlockerButton.addTarget(self,
                              action: #selector(firstBlackBlockerAction(sender:)),
                              for: .touchUpInside)
        self.blackBlockerButton = blackBlockerButton

        let blackSecondBlockerButton:UIButton = UIFactory.shared.getButton(
            withText: "B",
            bordered: true,
            borderColor: UIColor(red:0.16, green:0.24, blue:0.73, alpha:1.0),
            backgroundColor: UIColor(red:0.37, green:0.47, blue:1.00, alpha:1.0),
            cornerRadius: kCornerRadius,
            titleColor: UIColor.white,
            textSize: 20)
        blackSecondBlockerButton.addTarget(self,
                              action: #selector(secondBlackBlockerAction(sender:)),
                              for: .touchUpInside)
        self.blackSecondBlockerButton = blackSecondBlockerButton

        blackStackView.addArrangedSubview(blackJammerButton)
        whiteStackView.addArrangedSubview(whiteJammerButton)
        blackStackView.addArrangedSubview(blackSecondBlockerButton)
        blackStackView.addArrangedSubview(blackBlockerButton)
        whiteStackView.addArrangedSubview(whiteSecondBlockerButton)
        whiteStackView.addArrangedSubview(whiteBlockerButton)
        addSubview(whiteStackView)
        addSubview(blackStackView)

        let views:[String:UIView] = [
            "blackJammerButton":blackJammerButton,
            "whiteJammerButton":whiteJammerButton,
            "blackSecondBlockerButton":blackSecondBlockerButton,
            "blackBlockerButton":blackBlockerButton,
            "whiteSecondBlockerButton":whiteSecondBlockerButton,
            "whiteBlockerButton":whiteBlockerButton,
            "whiteStackView":whiteStackView,
            "blackStackView":blackStackView]

        let height:CGFloat = UIScreen.main.bounds.height / 2
        let metrics:[String:CGFloat] = [
            "height":height]

        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat:"H:|-50-[whiteStackView]-50-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat:"V:|-0-[whiteStackView(height)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat:"H:|-50-[blackStackView]-50-|",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat:"V:[whiteStackView]-0-[blackStackView(height)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat:"H:[blackJammerButton(100)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat:"V:[blackJammerButton(100)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat:"H:[whiteJammerButton(100)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat:"V:[whiteJammerButton(100)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat:"H:[blackSecondBlockerButton(100)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat:"V:[blackSecondBlockerButton(100)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat:"H:[blackBlockerButton(100)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat:"V:[blackBlockerButton(100)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat:"H:[whiteSecondBlockerButton(100)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat:"V:[whiteSecondBlockerButton(100)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat:"H:[whiteBlockerButton(100)]",
            options:[],
            metrics:metrics,
            views:views))
        addConstraints(NSLayoutConstraint.constraints(
            withVisualFormat:"V:[whiteBlockerButton(100)]",
            options:[],
            metrics:metrics,
            views:views))
    }

    @objc func blackJammerAction(sender button:UIButton){
        var startTime = TimeInterval()
        timerBlackJammer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(updateCounter), userInfo: nil, repeats: true)
    }

    @objc func whiteJammerAction(sender button:UIButton){

    }

    @objc func firstBlackBlockerAction(sender button:UIButton){

    }

    @objc func firstWhiteBlockerAction(sender button:UIButton){

    }

    @objc func secondBlackBlockerAction(sender button:UIButton){

    }

    @objc func secondWhiteBlockerAction(sender button:UIButton){

    }

    func start() {
        startTime = Date().timeIntervalSinceReferenceDate - elapsed
    }

    func stop() {
        elapsed = Date().timeIntervalSinceReferenceDate - startTime
        timer?.invalidate()
        // Set Start/Stop button to false
        status = false
    }

    @objc func updateCounter() {
        // Calculate total time since timer started in seconds
        time = Date().timeIntervalSinceReferenceDate - startTime

        // Calculate minutes
        let minutes = UInt8(time / 60.0)
        time -= (TimeInterval(minutes) * 60)

        // Calculate seconds
        let seconds = UInt8(time)
        time -= TimeInterval(seconds)

        // Calculate milliseconds
        let milliseconds = UInt8(time * 100)

        // Format time vars with leading zero
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        let strMilliseconds = String(format: "%02d", milliseconds)

        // Add time vars to relevant labels
        labelMinute.text = strMinutes
        labelSecond.text = strSeconds
        labelMillisecond.text = strMilliseconds

    }
    
}
