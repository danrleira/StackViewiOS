//
//  ViewController.swift
//  StackView
//
//  Created by Danrlei Ribeiro Azevedo on 21/02/23.
//

import UIKit

class ViewController: UIViewController {
    var view1: UILabel = {
        var view = UILabel()
        view.text = "VIEW"
        view.backgroundColor = .systemRed
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var view2: UILabel = {
        var view = UILabel()
        view.backgroundColor = .systemBlue
        view.text = "V"
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var view3: UILabel = {
        var view = UILabel()
        view.text = "LAAARGE CONTENT"
        view.backgroundColor = .systemGreen
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var stackView: UIStackView = {
        var stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 4
        stack.distribution = .fill
        stack.alignment = .top
        stack.layer.masksToBounds = true
        stack.backgroundColor = .systemGray6
        return stack
    }()
    
    @IBAction func changeAxis(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        
        UIView.animate(withDuration: 0.5) {
            if index == 0 {
                self.stackView.axis = .vertical
            } else {
                self.stackView.axis = .horizontal
            }
        }
        
    }
    
    @IBAction func changeSpacing(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        if let title = sender.titleForSegment(at: index), let spacing = Float(title) {
            UIView.animate(withDuration: 0.5) {
                self.stackView.spacing = CGFloat(spacing)
            }
        }
    }

    @IBAction func changeDistribution(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        
        switch index {
        case 0:
            UIView.animate(withDuration: 0.5) {
                self.stackView.distribution = .fill
            }
        case 1:
            UIView.animate(withDuration: 0.5) {
                self.stackView.distribution = .fillEqually
            }
        case 2:
            UIView.animate(withDuration: 0.5) {
                self.stackView.distribution = .fillProportionally
            }
        case 3:
            UIView.animate(withDuration: 0.5) {
                self.stackView.distribution = .equalCentering
            }
        case 4:
            UIView.animate(withDuration: 0.5) {
                self.stackView.distribution = .equalSpacing
            }
        default:
            print("?")
        }
    }
    
    @IBAction func changeAligment(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex

        switch index {
        case 0:
            UIView.animate(withDuration: 0.5) {
                self.stackView.alignment = .top
            }
        case 1:
            UIView.animate(withDuration: 0.5) {
                self.stackView.alignment = .bottom
            }
        case 2:
            UIView.animate(withDuration: 0.5) {
                self.stackView.alignment = .center
            }
        case 3:
            UIView.animate(withDuration: 0.5) {
                self.stackView.alignment = .fill
            }
        case 4:
            UIView.animate(withDuration: 0.5) {
                self.stackView.alignment = .leading
            }
        case 5:
            UIView.animate(withDuration: 0.5) {
                self.stackView.alignment = .trailing
            }
        case 6:
            UIView.animate(withDuration: 0.5) {
                self.stackView.alignment = .firstBaseline
            }
        case 7:
            UIView.animate(withDuration: 0.5) {
                self.stackView.alignment = .lastBaseline
            }
        default:
            print("?")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(stackView)
        
        stackView.addArrangedSubview(view1)
        stackView.addArrangedSubview(view2)
        stackView.addArrangedSubview(view3)
        
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 48).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    }
}

