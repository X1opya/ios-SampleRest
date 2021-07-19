//
//  FullScreenImageVC.swift
//  SimpleRest
//
//  Created by extdev on 18.07.2021.
//

import UIKit

class FullScreenImageVC : BaseViewController {
  
  let imageView = UIImageView()
  private var character: CharacterDto
  private var image: UIImage
  private var isFliping = false
  
  init(character: CharacterDto) {
    self.character = character
    self.image = ImageLoader.load(url: character.image)
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func viewDidLoad() {
    self.title = character.name
    createFullCreenImage()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    let share = UIBarButtonItem(title: "Flip", style: UIBarButtonItem.Style.done, target: self, action: #selector(self.flip))
    navigationItem.rightBarButtonItem = share
  }
  
  @objc func flip() {
    isFliping = !isFliping
    if isFliping {
      let rotation : CABasicAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
      rotation.toValue = NSNumber(value: Double.pi * 2)
      rotation.duration = 1
      rotation.isCumulative = true
      rotation.repeatCount = Float.greatestFiniteMagnitude
      imageView.layer.add(rotation, forKey: "flip")
    } else {
      imageView.layer.removeAllAnimations()
    }
  }
  
  
  
  private func createFullCreenImage() {
    imageView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(imageView)
    NSLayoutConstraint.activate([
      imageView.rightAnchor.constraint(equalTo: view.rightAnchor),
      imageView.leftAnchor.constraint(equalTo: view.leftAnchor),
      imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      imageView.topAnchor.constraint(equalTo: view.topAnchor)
    ])
    imageView.sizeToFit()
    imageView.image = image
  }
}
