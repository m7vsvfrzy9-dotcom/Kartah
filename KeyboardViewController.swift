
import UIKit

class KeyboardViewController: UIInputViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupKeyboard()
    }

    func setupKeyboard() {
        view.backgroundColor = UIColor(
            red: 0.82,
            green: 0.84,
            blue: 0.87,
            alpha: 1
        )

        let rows = [
            ["ض","ص","ث","ق","ف","غ","ع","ه","خ","ح","ج"],
            ["ش","س","ي","ب","ل","ا","ت","ن","م","ك","ط"],
            ["ظ","ز","ر","ذ","د","ئ","ء","ؤ","ى"]
        ]

        let mainStack = UIStackView()
        mainStack.axis = .vertical
        mainStack.spacing = 9
        mainStack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(mainStack)

        NSLayoutConstraint.activate([
            mainStack.leadingAnchor.constraint(
                equalTo: view.leadingAnchor, constant: 4
            ),
            mainStack.trailingAnchor.constraint(
                equalTo: view.trailingAnchor, constant: -4
            ),
            mainStack.topAnchor.constraint(
                equalTo: view.topAnchor, constant: 12
            )
        ])

        for row in rows {
            let stack = UIStackView()
            stack.axis = .horizontal
            stack.spacing = 5
            stack.distribution = .fillEqually

            for letter in row {
                let button = makeButton(letter)
                stack.addArrangedSubview(button)
            }

            mainStack.addArrangedSubview(stack)
        }

        let bottom = UIStackView()
        bottom.axis = .horizontal
        bottom.spacing = 5
        bottom.distribution = .fillEqually

        let buttons = ["123", "🌐", "،", "مسافة", "↵"]

        for item in buttons {
            bottom.addArrangedSubview(makeButton(item))
        }

        mainStack.addArrangedSubview(bottom)
    }

    func makeButton(_ title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .white
        button.layer.cornerRadius = 5
        button.titleLabel?.font = .systemFont(ofSize: 19)

        button.addAction(
            UIAction { [weak self] _ in
                self?.handleKey(title)
            },
            for: .touchUpInside
        )

        button.heightAnchor.constraint(equalToConstant: 43).isActive = true

        return button
    }

    func handleKey(_ key: String) {
        switch key {
        case "مسافة":
            textDocumentProxy.insertText(" ")
        case "↵":
            textDocumentProxy.insertText("\n")
        case "🌐":
            advanceToNextInputMode()
        case "123":
            break
        default:
            textDocumentProxy.insertText(key)
        }
    }
}
