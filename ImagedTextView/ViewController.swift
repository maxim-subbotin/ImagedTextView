//
//  ViewController.swift
//  ImagedTextView
//
//  Created by Snappii on 1/5/20.
//  Copyright © 2020 Max Subbotin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var segmentButton = UISegmentedControl(items: ["Cards", "Text"])
    private var scrollView = UIScrollView()
    private var articleView = ArticleView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        applyUI()
    }

    func applyUI() {
        self.view.addSubview(segmentButton)
        segmentButton.selectedSegmentIndex = 0
        segmentButton.addTarget(self, action: #selector(onSegmentControl), for: .valueChanged)
        segmentButton.translatesAutoresizingMaskIntoConstraints = false
        let tC = segmentButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 40)
        let wC = segmentButton.widthAnchor.constraint(equalToConstant: 300)
        let cxC = segmentButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let hC = segmentButton.heightAnchor.constraint(equalToConstant: 40)
        NSLayoutConstraint.activate([tC, wC, cxC, hC])
        
        self.view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        let tC1 = scrollView.topAnchor.constraint(equalTo: segmentButton.bottomAnchor, constant: 10)
        let wC1 = scrollView.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        let lC1 = scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        let bC1 = scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        NSLayoutConstraint.activate([tC1, wC1, lC1, bC1])
        
        let cards = [Card(withImage: UIImage(named: "winter_light")!, maskImage: UIImage(named: "winter_dark")!, andText: "WINTER"),
                     Card(withImage: UIImage(named: "winter_dark")!, maskImage: UIImage(named: "winter_light")!, andText: "INVIERNO"),
                     Card(withImage: UIImage(named: "spring_dark")!, maskImage: UIImage(named: "spring_light")!, andText: "SPRING"),
                     Card(withImage: UIImage(named: "spring_light")!, maskImage: UIImage(named: "spring_dark")!, andText: "PRIMAVERA"),
                     Card(withImage: UIImage(named: "summer_dark")!, maskImage: UIImage(named: "summer_light")!, andText: "SUMMER"),
                     Card(withImage: UIImage(named: "summer_light")!, maskImage: UIImage(named: "summer_dark")!, andText: "VERANO"),
                     Card(withImage: UIImage(named: "autumn_dark")!, maskImage: UIImage(named: "autumn_light")!, andText: "AUTUMN"),
                     Card(withImage: UIImage(named: "autumn_light")!, maskImage: UIImage(named: "autumn_dark")!, andText: "OTOÑO")]
        
        var prevView: UIView?
        var maxY = 0
        for card in cards {
            let cardView = CardView(frame: .zero)
            cardView.image = card.image
            cardView.maskImage = card.maskImage
            cardView.text = card.text
            cardView.layer.cornerRadius = 5
            
            scrollView.addSubview(cardView)
            cardView.translatesAutoresizingMaskIntoConstraints = false
            let tC = (prevView == nil) ? cardView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 10) :
                                         cardView.topAnchor.constraint(equalTo: prevView!.bottomAnchor, constant: 20)
            let lC = cardView.leftAnchor.constraint(equalTo: scrollView.leftAnchor, constant: 20)
            let wC = cardView.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -40)
            let hC = cardView.heightAnchor.constraint(equalToConstant: 100)
            NSLayoutConstraint.activate([tC, lC, wC, hC])
            
            prevView = cardView
            maxY += (20 + 100)
        }
        scrollView.contentSize = CGSize(width: self.view.bounds.width, height: CGFloat(maxY + 20))
        
        self.view.addSubview(articleView)
        articleView.backgroundColor = .black
        articleView.backgroundImage = UIImage(named: "stars")
        articleView.translatesAutoresizingMaskIntoConstraints = false
        let tC2 = articleView.topAnchor.constraint(equalTo: segmentButton.bottomAnchor, constant: 10)
        let wC2 = articleView.widthAnchor.constraint(equalTo: self.view.widthAnchor)
        let lC2 = articleView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        let bC2 = articleView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        NSLayoutConstraint.activate([tC2, wC2, lC2, bC2])
        articleView.isHidden = true
    }

    @objc func onSegmentControl() {
        if segmentButton.selectedSegmentIndex == 0 {
            scrollView.isHidden = false
            articleView.isHidden = true
            
            UIView.animate(withDuration: 1.0, animations: {
                self.view.backgroundColor = UIColor.white
            })
        }
        if segmentButton.selectedSegmentIndex == 1 {
            scrollView.isHidden = true
            articleView.isHidden = false

            UIView.animate(withDuration: 0.5, animations: {
                self.view.backgroundColor = UIColor(red: 0.058, green: 0.047, blue: 0.051, alpha: 1.0)
            })
        }
    }
}

class Card {
    public var image: UIImage
    public var maskImage: UIImage
    public var text: String
    
    init(withImage img: UIImage, maskImage: UIImage, andText t: String) {
        self.image = img
        self.maskImage = maskImage
        self.text = t
    }
}

class CardView: UIImageView {
    private var label = ImagedTextLabel(frame: .zero)
    public var maskImage: UIImage? {
        get {
            return label.image
        }
        set {
            label.image = newValue
        }
    }
    public var text: String? {
        get {
            return label.text
        }
        set {
            label.text = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        applyUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        applyUI()
    }
    
    func applyUI() {
        self.contentMode = .scaleAspectFill
        self.clipsToBounds = true
        
        self.addSubview(label)
        label.font = UIFont.boldSystemFont(ofSize: 60)
        label.textAlignment = .center
        
        label.translatesAutoresizingMaskIntoConstraints = false
        let cxC = label.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let cyC = label.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        let wC = label.widthAnchor.constraint(equalTo: self.widthAnchor)
        let hC = label.heightAnchor.constraint(equalTo: self.heightAnchor)
        NSLayoutConstraint.activate([cxC, cyC, wC, hC])
    }
}

class ArticleView: UIView {
    private var backgroundImageView = UIImageView()
    private var headerLabel = ImagedTextLabel(frame: .zero)
    private var textLabel = ImagedTextLabel(frame: .zero)
    public var backgroundImage: UIImage? {
        get {
            return backgroundImageView.image
        }
        set {
            backgroundImageView.image = newValue
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        applyUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        applyUI()
    }
    
    func applyUI() {
        self.addSubview(backgroundImageView)
        backgroundImageView.alpha = 0.5
        backgroundImageView.contentMode = .scaleAspectFill
        backgroundImageView.translatesAutoresizingMaskIntoConstraints = false
        let cxC = backgroundImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        let cyC = backgroundImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        let wC = backgroundImageView.widthAnchor.constraint(equalTo: self.widthAnchor)
        let hC = backgroundImageView.heightAnchor.constraint(equalTo: self.heightAnchor)
        NSLayoutConstraint.activate([cxC, cyC, wC, hC])
        
        self.addSubview(headerLabel)
        headerLabel.text = "CHROMOSPHERE"
        headerLabel.textAlignment = .left
        headerLabel.font = UIFont.boldSystemFont(ofSize: 35)
        headerLabel.image = UIImage(named: "sun_texture")
        headerLabel.contentMode = .scaleAspectFill
        headerLabel.translatesAutoresizingMaskIntoConstraints = false
        let tC1 = headerLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10)
        let lC1 = headerLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10)
        let wC1 = headerLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20)
        let hC1 = headerLabel.heightAnchor.constraint(equalToConstant: 40)
        NSLayoutConstraint.activate([tC1, lC1, wC1, hC1])
        
        let text = "The chromosphere (literally, \"sphere of color\") is the second of the three main layers in the Sun's atmosphere and is roughly 3,000 to 5,000 kilometers deep. The chromosphere's rosy red color is only apparent during eclipses. The chromosphere sits just above the photosphere and below the solar transition region. The layer of the chromosphere atop the photosphere is homogeneous. A forest of hairy-appearing spicules rise from the homogeneous layer, some of which extend 10,000 km into the corona above."
        
        let textFont = UIFont.boldSystemFont(ofSize: 20)
        let estimateHeight = (text as NSString).boundingRect(with: CGSize(width: UIScreen.main.bounds.width - 20, height: .greatestFiniteMagnitude), options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: textFont], context: nil).height + 10
        
        self.addSubview(textLabel)
        textLabel.numberOfLines = 0
        textLabel.text = text
        textLabel.textAlignment = .left
        textLabel.font = textFont
        textLabel.image = UIImage(named: "moon_texture")
        textLabel.contentMode = .scaleAspectFill
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        let tC2 = textLabel.topAnchor.constraint(equalTo: headerLabel.bottomAnchor, constant: 5)
        let lC2 = textLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10)
        let wC2 = textLabel.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -20)
        let hC2 = textLabel.heightAnchor.constraint(equalToConstant: estimateHeight)
        NSLayoutConstraint.activate([tC2, lC2, wC2, hC2])
        
        //The chromosphere (literally, "sphere of color") is the second of the three main layers in the Sun's atmosphere and is roughly 3,000 to 5,000 kilometers deep. The chromosphere's rosy red color is only apparent during eclipses. The chromosphere sits just above the photosphere and below the solar transition region. The layer of the chromosphere atop the photosphere is homogeneous. A forest of hairy-appearing spicules rise from the homogeneous layer, some of which extend 10,000 km into the corona above.
    }
}
