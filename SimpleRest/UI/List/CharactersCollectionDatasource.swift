//
//  CharactersCollectionDatasource.swift
//  SimpleRest
//
//  Created by extdev on 18.07.2021.
//

import UIKit

extension CharactersVC: UICollectionViewDataSource, UICollectionViewDelegate {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return vm?.list.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let item = vm?.list[indexPath.item]
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    cell.backgroundColor = UIColor.blue
    let imageView = UIImageView()
    imageView.image = ImageLoader.load(url: item?.image)
    cell.autoresizesSubviews = true
    cell.addSubview(imageView)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
      imageView.trailingAnchor.constraint(equalTo: cell.trailingAnchor),
      imageView.bottomAnchor.constraint(equalTo: cell.bottomAnchor),
      imageView.topAnchor.constraint(equalTo: cell.topAnchor),
      imageView.leftAnchor.constraint(equalTo: cell.leftAnchor)
    ])
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    let item = vm?.list[indexPath.item]
    showFullScreen(item!)
  }
}
