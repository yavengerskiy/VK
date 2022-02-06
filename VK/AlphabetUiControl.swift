//
//  AlphabetUiControl.swift
//  VK
//
//  Created by Beelab on 30/01/22.
//

import UIKit


enum Word: Int {
    case a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z
    
    static let allWords: [Word] = [a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z]
    
    var title: String {
        switch self {
        case .a: return "A"
        case .b: return "B"
        case .c: return "C"
        case .d: return "D"
        case .e: return "E"
        case .f: return "F"
        case .g: return "G"
        case .h: return "H"
        case .i: return "I"
        case .j: return "J"
        case .k: return "K"
        case .l: return "L"
        case .m: return "M"
        case .n: return "N"
        case .o: return "O"
        case .p: return "P"
        case .q: return "Q"
        case .r: return "R"
        case .s: return "S"
        case .t: return "T"
        case .u: return "U"
        case .v: return "V"
        case .w: return "W"
        case .x: return "X"
        case .y: return "Y"
        case .z: return "Z"
        }
    }
}

@IBDesignable class AlphabetUiControl: UIControl {
    
    var selectedDay: Word? = nil {
        didSet {
            self.updateSelectedDay()
            self.sendActions(for: .valueChanged)
        }
    }
    
    private var buttons: [UIButton] = []
    private var stackView: UIStackView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    private func setupView() {
        for day in Word.allWords {
            let button = UIButton(type: .system)
            button.setTitle(day.title, for: .normal)
            button.setTitleColor(.lightGray, for: .normal)
            button.setTitleColor(.white, for: .selected)
            button.addTarget(self, action: #selector(selectWord(_:)), for: .touchUpInside)
            self.buttons.append(button)
        }
        
        stackView = UIStackView(arrangedSubviews: self.buttons)
        
        self.addSubview(stackView)
        
        stackView.spacing = 20
        stackView.axis = .vertical
        stackView.alignment = .trailing
        stackView.distribution = .fillEqually
    }
    
    private func updateSelectedDay() {
        for (index, button) in self.buttons.enumerated() {
            guard let word = Word(rawValue: index) else { continue }
            button.isSelected = word == self.selectedDay
        }
    }
    
    @objc private func selectWord(_ sender: UIButton) {
        guard let index = self.buttons.firstIndex(of: sender) else { return }
        guard let word = Word(rawValue: index) else { return }
        self.selectedDay = word
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds
    }
    
}
