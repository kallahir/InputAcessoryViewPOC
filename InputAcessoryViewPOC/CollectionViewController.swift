//
//  CollectionViewController.swift
//  InputAccessoryViewPOC
//
//  Created by Itallo Rossi Lucas on 09/08/17.
//  Copyright © 2017 kallahir. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Collection View"
        
        self.collectionView?.backgroundColor = UIColor.white
        self.collectionView?.keyboardDismissMode = .interactive
        self.collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell01")
        self.collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell02")
    }
    
    lazy var inputContainerView: InputAccessoryView = {
        let view = InputAccessoryView()
        view.collectionViewController = self
        return view
    }()
    
    override var inputAccessoryView: UIView? {
        get {
            return inputContainerView
        }
    }
    
    override var canBecomeFirstResponder: Bool {
        get {
            return true
        }
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        self.collectionView?.collectionViewLayout.invalidateLayout()
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item % 2 == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell01", for: indexPath)
            cell.backgroundColor = UIColor.red
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell02", for: indexPath)
        cell.backgroundColor = UIColor.blue
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: 50)
    }
    
    func send() {
        print(self.inputContainerView.inputTextArea.text)
        self.inputContainerView.inputTextArea.text = nil
        self.inputContainerView.invalidateIntrinsicContentSize()
    }

}
