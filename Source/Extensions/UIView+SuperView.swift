//
//  UIView+SuperView.swift
//  TapGestureToHideKeyboard
//
//  Created by Bondar Yaroslav on 01.12.16.
//  Copyright © 2016 Bondar Yaroslav. All rights reserved.
//

import UIKit

extension UIView {
    public var topSuperview: UIView? {
        var view = superview
        while view?.superview != nil {
            view = view!.superview
        }
        return view
    }
}
