//
//  KeyboardAnchorManager.swift
//  TestiOS2
//
//  Created by Rafael Bonini de Souza on 23/04/20.
//  Copyright © 2020 Rafael Bonini de Souza. All rights reserved.
//

import UIKit

final class KeyboardAnchorManager {

    private let notificationCenter: NotificationCenter

    private let textFieldContainerView: UIView
    private let buttonContainerView: UIView
    private let commonParentView: UIView
    private let topMostConstraint: NSLayoutConstraint
    private let bottomMostConstraint: NSLayoutConstraint
    private let minOffset: CGFloat

    var distanceToOffset: CGFloat = 0.0
    var isKeyboardVisible: Bool = false

    var keyboardAdditionalHeight: CGFloat = 0.0
    var textViewAddedTopConstant: CGFloat = 0.0
    private var didShowKeyboard: (() -> Void)?

    private var bottomSafeArea: CGFloat {
        if #available(iOS 11.0, *) {
            return UIApplication.shared.keyWindow?.safeAreaInsets.bottom ?? 0
        }
        return 0
    }
    
    init(textFieldContainerView: UIView,
         buttonContainerView: UIView,
         commonParentView: UIView,
         topMostConstraint: NSLayoutConstraint,
         bottomMostConstraint: NSLayoutConstraint,
         minOffset: CGFloat = 16.0,
         notificationCenter: NotificationCenter = NotificationCenter.default,
         didShowKeyboardCallback: (() -> Void)? = nil) {
        self.textFieldContainerView = textFieldContainerView
        self.buttonContainerView = buttonContainerView
        self.topMostConstraint = topMostConstraint
        self.bottomMostConstraint = bottomMostConstraint
        self.commonParentView = commonParentView
        self.minOffset = minOffset
        self.notificationCenter = notificationCenter
        self.didShowKeyboard = didShowKeyboardCallback
    }

    func start() {
        hideKeyboard()
        addKeyboardObservers()
    }

    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder),
                                        to: nil,
                                        from: nil,
                                        for: nil)
        isKeyboardVisible = false
    }

    func distanceBetweenViews() -> CGFloat {
        let textFieldFrame = commonParentView.convert(
            textFieldContainerView.bounds,
            from: textFieldContainerView
        )
        let buttonFrame = commonParentView.convert(
            buttonContainerView.bounds,
            from: buttonContainerView
        )
        return textFieldFrame.maxY - buttonFrame.minY
    }

    func updateTextViewOffsetIfNeeded(distanceBetweenViews: CGFloat) {
        let isButtonOverTextView = distanceBetweenViews >= 0
        let isAbsoluteDistanceLessThanMinOffset = abs(distanceBetweenViews) < minOffset
        let shouldIncreaseTopMostConstraint = abs(
            distanceBetweenViews
            ) > minOffset && textViewAddedTopConstant != 0

        if isButtonOverTextView {
            let distanceToFixOffset = distanceBetweenViews + minOffset
            textViewAddedTopConstant += distanceToFixOffset
            topMostConstraint.constant -= distanceToFixOffset
        } else if isAbsoluteDistanceLessThanMinOffset {
            let distanceToFixOffset = minOffset - abs(distanceBetweenViews)
            textViewAddedTopConstant += distanceToFixOffset
            topMostConstraint.constant -= distanceToFixOffset
        } else if shouldIncreaseTopMostConstraint {
            let distanceToFixOffset = abs(distanceBetweenViews) - minOffset
            textViewAddedTopConstant -= distanceToFixOffset
            topMostConstraint.constant += distanceToFixOffset
        }
    }

    func offsetViewsIfNeeded(for distanceBetweenViews: CGFloat) {
        if distanceBetweenViews >= 0 {
            distanceToOffset = distanceBetweenViews + minOffset
            topMostConstraint.constant -= distanceToOffset
        } else if abs(distanceBetweenViews) < minOffset {
            distanceToOffset = minOffset - abs(distanceBetweenViews)
            topMostConstraint.constant -= distanceToOffset
        }
    }

    @objc func keyboardWillShow(notification: Notification) {
        if !isKeyboardVisible, let userInfo = notification.userInfo,
            let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            bottomMostConstraint.constant += keyboardSize
                .size.height + keyboardAdditionalHeight - bottomSafeArea
            commonParentView.layoutIfNeeded()

            let distance = distanceBetweenViews()
            offsetViewsIfNeeded(for: distance)

            animateKeyboard(userInfo: userInfo)
            isKeyboardVisible = true
            didShowKeyboard?()
        }
    }

    @objc func keyboardWillHide(notification: Notification) {
        if isKeyboardVisible, let userInfo = notification.userInfo,
            let keyboardSize = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            bottomMostConstraint.constant -= keyboardSize.size.height - bottomSafeArea
            topMostConstraint.constant += distanceToOffset + textViewAddedTopConstant
            textViewAddedTopConstant = 0
            animateKeyboard(userInfo: userInfo)
            isKeyboardVisible = false
        }
    }

    private func animateKeyboard(userInfo: [AnyHashable : Any]) {
        let duration: TimeInterval = (
            userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber
            )?.doubleValue ?? 0
        let animationCurveRawNSN = userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
        let animationCurveRaw = animationCurveRawNSN?
            .uintValue ?? UIView.AnimationOptions.curveEaseInOut.rawValue
        let animationCurve: UIView.AnimationOptions = UIView.AnimationOptions(rawValue: animationCurveRaw)

        UIView.animate(withDuration: duration,
                       delay: TimeInterval(0),
                       options: animationCurve,
                       animations: { self.commonParentView.layoutIfNeeded() },
                       completion: nil)
    }

    private func addKeyboardObservers() {
        notificationCenter.addObserver(self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        notificationCenter.addObserver(self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }

    deinit {
        notificationCenter.removeObserver(self)
    }
}
