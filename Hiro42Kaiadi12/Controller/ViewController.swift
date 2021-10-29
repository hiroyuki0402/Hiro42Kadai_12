//
//  ViewController.swift
//  Hiro42Kaiadi12
//
//  Created by 白石裕幸 on 2021/10/27.
//

import UIKit

private enum UserDefaultKey: String {
    case tax
    case val
}

class ViewController: UIViewController {
    @IBOutlet private weak var customView: InputView!

    override func viewDidLoad() {
        super.viewDidLoad()

        customView.delegate = self

        if let loadingData = UserDefaults.standard.loading(key: .tax) {
            customView.taxTextField.text = loadingData
        }
    }
}

extension ViewController: InputViewDelegate {
    func didTapCalculationButton() {
        guard let amount = Double(customView.amountTextField.text ?? "") else {return}
        guard let tax = Double(customView.taxTextField.text ?? "") else {return}
        let result = CalculationSource().calculate(amount: Double(amount), tax: Double(tax))
        customView.resultLabel.text = CustomNumberFormatter.floor(number: result)
        UserDefaults.standard.save(value: tax, key: .tax)
    }
}

// Fixme: セッターゲッターに変更？Foilの使用?
private extension UserDefaults {
    func save(value: Any, key: UserDefaultKey) {
        set(value, forKey: key.rawValue)
    }
    func loading(key: UserDefaultKey) -> String? {
        return string(forKey: key.rawValue)
    }
}
