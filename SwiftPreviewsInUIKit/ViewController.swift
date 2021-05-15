//
//  ViewController.swift
//  SwiftPreviewsInUIKit
//
//  Created by Ramill Ibragimov on 15.05.2021.
//

import UIKit

class ViewController: UIViewController {
    
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemOrange
        button.setTitle("Button", for: .normal)
        view.addSubview(button)
        
        NSLayoutConstraint.activate([
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}

#if canImport(SwiftUI) && DEBUG
import SwiftUI
struct UIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    let viewCOntroller: ViewController
    
    init(_ builder: @escaping () -> ViewController) {
        viewCOntroller = builder()
    }
    
    func makeUIViewController(context: Context) -> some UIViewController {
        viewCOntroller
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        return
    }
}
#endif

#if canImport(SwiftUI) && DEBUG
import SwiftUI

let deviceNames: [String] = [
    "iPhone SE",
    "iPhone 11 Pro Max",
]

@available(iOS 13.0, *)
struct ViewController_Preview: PreviewProvider {
    static var previews: some View {
        ForEach(deviceNames, id: \.self) { deviceName in
            UIViewControllerPreview {
                ViewController()
            }
        }
    }
}
#endif
