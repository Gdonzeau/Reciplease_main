//
//  StackViewInfo.swift
//  Reciplease
//
//  Created by Guillaume Donzeau on 16/09/2021.
//

import UIKit

class StackViewInfo: UIStackView {
    
    var duration: Float? {
        didSet {
            guard let duration = duration, duration != 0 else {
                codeInfoTimeView.isHidden = true
                return
            }
            
            codeInfoTimeView.image = UIImage(systemName: "clock")
            codeInfoPersonView.title = dateComponentsFormatter.string(from: Double(duration * 60))
        }
    }
    
    var persons: Float? {
        didSet {
            guard let persons = persons else { return }
            
            codeInfoPersonView.image = UIImage(systemName: "person")
            codeInfoPersonView.title = "\(persons) pers"
        }
    }

    private let codeInfoTimeView = InfoTimeView()
    private let codeInfoPersonView = InfoTimeView()
    
    //private let codeInfoPersonView = InfoPersonView()
    
    private var dateComponentsFormatter: DateComponentsFormatter {
        let dtc = DateComponentsFormatter()
        dtc.unitsStyle = .brief
        dtc.allowedUnits = [.hour, .minute]
        return dtc
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
       // subViewsConstraints()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        alignment = .fill
        axis = .vertical
        distribution = .fill
        translatesAutoresizingMaskIntoConstraints = false
        
        addArrangedSubview(codeInfoTimeView)
        addArrangedSubview(codeInfoPersonView)
        
    }
    //TODELETE
    func subViewsConstraints() {
        codeInfoTimeView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive  = true
        codeInfoTimeView.bottomAnchor.constraint(equalTo: codeInfoPersonView.topAnchor, constant: 0).isActive = true
        
        codeInfoTimeView.widthAnchor.constraint(equalTo: codeInfoPersonView.widthAnchor).isActive = true
        codeInfoPersonView.widthAnchor.constraint(equalTo: codeInfoTimeView.widthAnchor).isActive = true
            
        
        codeInfoPersonView.topAnchor.constraint(equalTo: codeInfoTimeView.bottomAnchor, constant: 0).isActive = true
        codeInfoPersonView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
}
