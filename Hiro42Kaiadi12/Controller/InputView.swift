//
//  InputView.swift
//  Hiro42Kaiadi12
//
//  Created by 白石裕幸 on 2021/10/27.
//

import UIKit

protocol InputViewDelegate: AnyObject {
    func didTapCalculationButton()
}

class InputView: UIView {
    @IBOutlet private(set) weak var amountTextField: UITextField!
    @IBOutlet private(set) weak var taxTextField: UITextField!
    @IBOutlet private(set) weak var resultLabel: UILabel!
    @IBOutlet private weak var customView: UIView!

    weak var delegate: InputViewDelegate?

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        Bundle.main.loadNibNamed("InputView", owner: self, options: nil)
        addSubview(customView)
        customView.frame = self.bounds
    }

    @IBAction private func calculationButton(_ sender: Any) {
        delegate?.didTapCalculationButton()
    }
}
