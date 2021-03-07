//
//  SpreadsheetItemViewModel.swift
//  SpreadsheetView
//
//  Created by zgpeace on 2021/3/7.
//

import Foundation
import UIKit

struct SpreadsheetItemViewModel {
    let items: [String]
    let isFirstLine: Bool
    let isLastLine: Bool
}

struct BorderViews {
    let topBorder: UIView
    let bottomBorder: UIView
    let leftBorder: UIView
    let rightBorder: UIView
}
