//
//  ArticleListCell.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 17/01/24.
//

import Foundation
import UIKit

class ArticleListCell: UITableViewCell {
    static let identifier = "ArticleListCell"
    
    private lazy var newsImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = .gray.withAlphaComponent(0.1)
        return $0
    }(UIImageView())
    
    private lazy var calendarIcon: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.image = UIImage(systemName: "calendar")
        return $0
    }(UIImageView())
    
    private lazy var labelStack: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.spacing = 8
        $0.axis = .vertical
        return $0
    }(UIStackView())
    
    private lazy var dateStack: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.spacing = 4
        $0.axis = .horizontal
        return $0
    }(UIStackView())
    
    private lazy var titleLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        $0.numberOfLines = 2
        return $0
    }(UILabel())
    
    private lazy var dateLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 9, weight: .thin)
        $0.setContentHuggingPriority(.defaultHigh, for: .vertical)
        $0.numberOfLines = 1
        return $0
    }(UILabel())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(_ data: Article?) {
        titleLabel.text = data?.title
        dateLabel.text = data?.publishedAt
    }
}

extension ArticleListCell {
    func setupView() {
        setupStackView()
        
        [newsImage, labelStack].forEach { contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            newsImage.widthAnchor.constraint(equalToConstant: 50),
            newsImage.heightAnchor.constraint(equalToConstant: 50),
            newsImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            newsImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            
            labelStack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            labelStack.leadingAnchor.constraint(equalTo: newsImage.trailingAnchor, constant: 16),
            labelStack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            labelStack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)
        ])
    }
    
    func setupStackView() {
        [titleLabel, dateLabel].forEach { labelStack.addArrangedSubview($0) }
    }
}
