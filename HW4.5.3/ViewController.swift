//
//  ViewController.swift
//  Lesson4.5.8.1.2022
//
//  Created by Azamat Sarinzhiev on 8/1/22.
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    private lazy var tableView: UITableView = {
        let view = UITableView()
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    private lazy var button: UIButton = {
        let view = UIButton(type: .system)
        view.backgroundColor = .yellow
        view.setTitle("Remove", for: .normal)
        view.addTarget(nil, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        view.setTitleColor(.black, for: .normal)
        return view
    }()
    
    private lazy var textField: UITextField = {
        let view = UITextField()
        view.placeholder = "Enter a name to remove"
        return view
    }()
    
    override func viewDidLoad() {
        setupSubView()
    }
    
    private var names = ["Azef", "Joker", "Porto", "Julia", "Seraph", "Romeo", "Neo", "David", "Kim", "Toulou"]
    
    private func setupSubView() {
        
        view.addSubview(textField)
        textField.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.height.equalTo(75)
            make.top.equalToSuperview().offset(view.frame.height / 20)
        }
        
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(textField.snp.bottom)
            make.height.equalTo(60)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.left.bottom.right.equalToSuperview()
            make.top.equalTo(button.snp.bottom)
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = TestCell()
        
        cell.titleName.text = names[index]
        cell.titleIndex.text = String(index)
        cell.titleName.textColor = UIColor(red: 234/255, green: 147/255, blue: 211/255, alpha: 1)
        cell.backgroundColor = UIColor(red: 87/255, green: 32/255, blue: 67/255, alpha: 1)
        return cell
    }
    
    @objc func buttonTapped(sender: UIButton) {
        let textName = self.textField.text!
        
        if self.names.contains(textName) == true{
            self.names.remove(at: self.names.firstIndex(of: textName)!)
        }
        self.tableView.reloadData()
    }
    
}

