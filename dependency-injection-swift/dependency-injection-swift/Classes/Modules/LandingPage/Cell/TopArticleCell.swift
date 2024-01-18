//
//  TopArticleCell.swift
//  dependency-injection-swift
//
//  Created by Leo Laia on 17/01/24.
//

import Foundation
import UIKit

class TopArticleCell: UITableViewCell {
    static let identifier = "TopArticleCell"
    
    private lazy var viewContainer: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.rounded(12)
        return $0
    }(UIView())
    
    private lazy var headlineImage: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.clipsToBounds = true
        $0.contentMode = .scaleAspectFill
        $0.rounded(12)
        return $0
    }(UIImageView())
    
    private lazy var titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        $0.numberOfLines = 2
        return $0
    }(UILabel())
    
    private lazy var dateLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 10, weight: .thin)
        $0.numberOfLines = 1
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return $0
    }(UILabel())
    
    private lazy var authorLabel: UILabel = {
        $0.font = UIFont.systemFont(ofSize: 10, weight: .thin)
        $0.numberOfLines = 1
        return $0
    }(UILabel())
    
    private lazy var authorIcon: UIImageView = {
        $0.image = UIImage(systemName: "person.crop.circle")
        $0.tintColor = .gray.withAlphaComponent(0.4)
        $0.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        return $0
    }(UIImageView())
    
    private lazy var bottomStack: UIStackView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.spacing = 8
        $0.axis = .horizontal
        $0.setContentHuggingPriority(.defaultHigh, for: .vertical)
        return $0
    }(UIStackView())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        headlineImage.image = nil
    }
    
    func configure(_ data: Article?) {
        titleLabel.text = data?.title
        dateLabel.text = data?.publishedAt?.formatedStringDate()
        authorLabel.text = data?.author
        
        if let url = URL(string: data?.urlToImage ?? "") {
            headlineImage.af.setImage(withURL: url, cacheKey: data?.urlToImage, imageTransition: .crossDissolve(0.5), runImageTransitionIfCached: false, completion: nil)
        } else {
            headlineImage.image = nil
        }
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(false, animated: true)
    }
}

private extension TopArticleCell {
    func setupView() {
        attachViews()
        setupStack()
        setupConstraint()
    }
    
    func attachViews() {
        contentView.addSubview(viewContainer)
        [headlineImage, titleLabel, bottomStack].forEach { contentView.addSubview($0) }
    }
    
    func setupConstraint() {
        NSLayoutConstraint.activate([
            viewContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            viewContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            viewContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            viewContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            headlineImage.topAnchor.constraint(equalTo: viewContainer.topAnchor),
            headlineImage.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor),
            headlineImage.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor),
            headlineImage.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.height * 0.2),
            
            titleLabel.topAnchor.constraint(equalTo: headlineImage.bottomAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: -16),
            
            bottomStack.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            bottomStack.leadingAnchor.constraint(equalTo: viewContainer.leadingAnchor, constant: 16),
            bottomStack.trailingAnchor.constraint(equalTo: viewContainer.trailingAnchor, constant: -16),
            bottomStack.bottomAnchor.constraint(equalTo: viewContainer.bottomAnchor, constant: -16)
        ])
    }
    
    func setupStack() {
        [authorIcon, authorLabel, dateLabel].forEach { bottomStack.addArrangedSubview($0) }
    }
}
