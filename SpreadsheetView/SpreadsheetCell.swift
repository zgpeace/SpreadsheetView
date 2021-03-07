//
//  SpreadsheetCell.swift
//  SpreadsheetView
//
//  Created by zgpeace on 2021/3/7.
//

import UIKit

class SpreadsheetCell: UITableViewCell {
    
//    private var itemView: UIView!
    private var borderViewArray: [BorderViews?] = []
    private var labelArray: [UILabel?] = []
    private var labelContentViewArray: [UIView?] = []
    
    private lazy var mainStackView: UIStackView = {
       let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .top
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        return stack
    }()
    
    private var viewModel: SpreadsheetItemViewModel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func update(viewModel: SpreadsheetItemViewModel) {
        self.viewModel = viewModel
        if !mainStackView.isDescendant(of: self) {
            setupView()
        }
        
        applyViewModel()
        
        layoutIfNeeded()
    }
    
    func applyViewModel() {
        let lastIndex = viewModel.items.capacity - 1
        for (index, item) in viewModel.items.enumerated() {
            labelArray[index]?.text = item
            labelArray[index]?.sizeToFit()
            hideUIViewBorder(withIsLastLine: viewModel.isLastLine,
                             isLastIndex: index == lastIndex,
                             bottomBorder: borderViewArray[index]?.bottomBorder ?? UIView(),
                             rightBorder: borderViewArray[index]?.rightBorder ?? UIView())
        }
    }
    
    func setupView() {
        addSubview(mainStackView)
        for item in viewModel.items {
            let label = buildLabel(with: item)
            let view = buildLabelView(with: label)
            let topBorder = view.addBorder(.top, color: .darkGray, thickness: 1)
            let bottomBorder = view.addBorder(.bottom, color: .darkGray, thickness: 1)
            let leftBorder = view.addBorder(.left, color: .darkGray, thickness: 1)
            let rightBorder = view.addBorder(.right, color: .darkGray, thickness: 1)
            mainStackView.addArrangedSubview(view)
            
            borderViewArray.append(BorderViews(topBorder: topBorder, bottomBorder: bottomBorder, leftBorder: leftBorder, rightBorder: rightBorder))
            labelArray.append(label)
            labelContentViewArray.append(view)
            
            NSLayoutConstraint.activate([
                view.topAnchor.constraint(equalTo: mainStackView.topAnchor),
                view.bottomAnchor.constraint(equalTo: mainStackView.bottomAnchor)
            ])
        }
        
        NSLayoutConstraint.activate([
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func hideUIViewBorder(
        withIsLastLine isLastLine: Bool,
        isLastIndex: Bool,
        bottomBorder: UIView,
        rightBorder: UIView) {
        bottomBorder.isHidden = !isLastLine
        rightBorder.isHidden = !isLastIndex
    }
    
    private func buildLabel(with text: String) -> UILabel {
        let label = UILabel()
        label.text = text
        label.numberOfLines = 0
        label.textAlignment = .left
        label.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        label.setContentCompressionResistancePriority(.required, for: .horizontal)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }
    
    private func buildLabelView(with label: UILabel) -> UIView {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            label.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: 8),
            label.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -8)
        ])
        
        return view
    }

}
