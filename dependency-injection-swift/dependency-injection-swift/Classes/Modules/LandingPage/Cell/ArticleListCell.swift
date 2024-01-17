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
        $0.contentMode = .scaleAspectFill
        $0.rounded(12)
        return $0
    }(UIImageView())
    
    private lazy var calendarIcon: UIImageView = {
        $0.image = UIImage(systemName: "calendar")
        $0.tintColor = .gray.withAlphaComponent(0.4)
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
        $0.spacing = 8
        $0.axis = .horizontal
        $0.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return $0
    }(UIStackView())
    
    private lazy var titleLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        $0.numberOfLines = 2
        return $0
    }(UILabel())
    
    private lazy var dateLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 10, weight: .thin)
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
    
    override func prepareForReuse() {
        super.prepareForReuse()
        newsImage.image = nil
        newsImage.af.cancelImageRequest()
    }
    
    func configure(_ data: Article?) {
        titleLabel.text = data?.title
        dateLabel.text = data?.publishedAt?.formatedStringDate()
        
        if let url = URL(string: data?.urlToImage ?? "") {
            newsImage.af.setImage(withURL: url, cacheKey: data?.urlToImage, imageTransition: .crossDissolve(0.5), runImageTransitionIfCached: false, completion: nil)
        } else {
            newsImage.image = nil
        }
    }
}

extension ArticleListCell {
    func setupView() {
        setupStackView()
        
        [newsImage, labelStack].forEach { contentView.addSubview($0) }
        
        NSLayoutConstraint.activate([
            calendarIcon.widthAnchor.constraint(equalToConstant: 18),
            calendarIcon.heightAnchor.constraint(equalToConstant: 18),
            
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
        [calendarIcon, dateLabel].forEach { dateStack.addArrangedSubview($0) }
        [titleLabel, dateStack].forEach { labelStack.addArrangedSubview($0) }
    }
}
