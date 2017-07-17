//
//  PhotoStreamViewController.swift
//  RWDevCon
//
//  Created by Mic Pringle on 26/02/2015.
//  Copyright (c) 2015 Ray Wenderlich. All rights reserved.
//

import UIKit
import AVFoundation

class PhotoStreamViewController: UICollectionViewController {
  
  var photos = Photo.allPhotos()
  var selectedPhoto: Photo!
  
  
  override var preferredStatusBarStyle: UIStatusBarStyle {
    get {
      return UIStatusBarStyle.lightContent
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    if let patternImage = UIImage(named: "Pattern") {
      view.backgroundColor = UIColor(patternImage: patternImage)
    }
    
    collectionView!.backgroundColor = .clear
    collectionView!.contentInset = UIEdgeInsets(top: 23, left: 5, bottom: 10, right: 5)
    
    if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
      layout.delegate = self
    }
  }
}

extension PhotoStreamViewController {
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return photos.count
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AnnotatedPhotoCell", for: indexPath) as! AnnotatedPhotoCell
    cell.photo = photos[indexPath.item]
    
    return cell
    
  }
  
  override func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
    selectedPhoto = photos[indexPath.item]
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    let detailVC: DetailVC = segue.destination as! DetailVC
    if let patternImage = UIImage(named: "Pattern") {
      detailVC.view.backgroundColor = UIColor(patternImage: patternImage)
    }
    detailVC.title = selectedPhoto.caption
    detailVC.image.image = selectedPhoto.image
    detailVC.label.text = selectedPhoto.comment
  }
}

extension PhotoStreamViewController : PinterestLayoutDelegate {
  
  // 1 Sends the height of the photo
  func collectionView(_ collectionView: UICollectionView, heightForPhotoAt indexPath: IndexPath, with width: CGFloat) -> CGFloat {
    let photo = photos[indexPath.item]
    let boundingRect =  CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
    let rect  = AVMakeRect(aspectRatio: photo.image.size, insideRect: boundingRect)
    return rect.size.height
  }
  
  // 2 Sends font info to calculate the height of the caption
  func collectionView(_ collectionView: UICollectionView, heightForAnnotationAt indexPath: IndexPath, with width: CGFloat) -> CGFloat {
    let annotationPadding = CGFloat(4)
    let annotationHeaderHeight = CGFloat(17)
    let photo = photos[indexPath.item]
    let font = UIFont(name: "AvenirNext-Regular", size: 10)!
    let commentHeight = photo.heightForComment(font: font, width: width)
    let height = annotationPadding + annotationHeaderHeight + commentHeight + annotationPadding
    return height
  }
}
