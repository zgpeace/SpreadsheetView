//
//  ViewController.swift
//  SpreadsheetView
//
//  Created by zgpeace on 2021/3/4.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var spreadsheetView: SpreadSheetView = {
        let viewModel: [[String]] = [
            ["index", "name", "hobby"],
            ["1", "John", "Reading"],
            ["2", "Lee", "Play Guitar"]
        ]
        
        let view = SpreadSheetView(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    private lazy var spreadsheetView1: SpreadSheetView = {
        let viewModel: [[String]] = [
            ["index", "name", "hobby", "quotes\ndetail"],
            ["1", "John", "Reading", "The fool doth think he is wise, but the wise man knows himself to be a fool."],
            ["2", "Lee", "Play Guitar", "Love all, trust a few, do wrong to none."],
            ["3", "Elsa", "Create ice", "Be not afraid of greatness. ..."]
        ]
        
        let view = SpreadSheetView(viewModel: viewModel)
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(spreadsheetView)
        view.addSubview(spreadsheetView1)
        
        NSLayoutConstraint.activate([
            spreadsheetView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            spreadsheetView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            spreadsheetView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 16),
            spreadsheetView.heightAnchor.constraint(equalToConstant: 250.0),
            
            spreadsheetView1.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            spreadsheetView1.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            spreadsheetView1.topAnchor.constraint(equalTo: spreadsheetView.bottomAnchor, constant: 16),
            spreadsheetView1.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
            
        ])
    }


}
