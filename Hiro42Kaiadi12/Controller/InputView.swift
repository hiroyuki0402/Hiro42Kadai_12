//
//  InputView.swift
//  Hiro42Kaiadi12
//
//  Created by 白石裕幸 on 2021/10/27.
//

import UIKit

public enum UserDefaultKey: String {
    case tax
    case val
}

class InputView: UIView {
    @IBOutlet private weak var amountTextField: UITextField!
    @IBOutlet private weak var taxTextField: UITextField!
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var customView: UIView!
    override func awakeFromNib() {
        if let loadingData = UserDefaults.standard.loading(key: .tax) {
            taxTextField.text = loadingData
        }
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        Bundle.main.loadNibNamed("InputView", owner: self, options: nil)
        addSubview(customView)
        customView.frame = self.bounds
    }
    @IBAction private func calculationButton(_ sender: Any) {
        guard let amount = Double(amountTextField.text ?? "") else {return}
        guard let tax = Double(taxTextField.text ?? "") else {return}
        let result = CalculationSource().calculate(amount: Double(amount), tax: Double(tax))
        resultLabel.text = Utils.stringFormatter(number: result)
        UserDefaults.standard.save(value: tax, key: .tax)
    }
}

// Fixme: セッターゲッターに変更？Foilの使用?
extension UserDefaults {
    func save(value: Any, key: UserDefaultKey) {
        set(value, forKey: key.rawValue)
    }
    func loading(key: UserDefaultKey) -> String? {
        return string(forKey: key.rawValue)
    }
}
