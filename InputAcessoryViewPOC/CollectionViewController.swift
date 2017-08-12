//
//  CollectionViewController.swift
//  InputAccessoryViewPOC
//
//  Created by Itallo Rossi Lucas on 09/08/17.
//  Copyright © 2017 kallahir. All rights reserved.
//

import UIKit

class CollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let outCell = "outCell"
    let inCell  = "inCell"
    
    var messages: [String] = ["message01, kind of small-ish",
                              "message02, small",
                              "message03, woooow such a huge message what is that for? why dont you talk a little bit less... 'cause i dont want to!",
                              "message04, small? not this time, not this time"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Collection View"
        
        self.collectionView?.backgroundColor = UIColor.white
        self.collectionView?.keyboardDismissMode = .interactive
        self.collectionView?.contentInset = UIEdgeInsets(top: 8, left: 0, bottom: 8, right: 0)
        self.collectionView?.register(InMessageCell.self, forCellWithReuseIdentifier: inCell)
        self.collectionView?.register(OutMessageCell.self, forCellWithReuseIdentifier: outCell)
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
        if indexPath.item < 4 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: outCell, for: indexPath) as! OutMessageCell
            cell.textView.text = messages[indexPath.item]
            cell.bubbleWidth?.constant = self.getFrameForText(content: messages[indexPath.item]).width + 32
            return cell
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: inCell, for: indexPath) as! InMessageCell
        cell.textView.text = messages[indexPath.item-4]
        cell.bubbleWidth?.constant = self.getFrameForText(content: messages[indexPath.item-4]).width + 32
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item < 4 {
            let height = getFrameForText(content: messages[indexPath.item]).height + 20
            return CGSize(width: self.view.frame.width, height: height)
        }
        let height = getFrameForText(content: messages[indexPath.item-4]).height + 20
        return CGSize(width: self.view.frame.width, height: height)
    }
    
    func getFrameForText(content: String) -> CGRect {
        let size = CGSize(width: 190, height: 1000)
        let options = NSStringDrawingOptions.usesFontLeading.union(.usesLineFragmentOrigin)
        return NSString(string: content).boundingRect(with: size,
                                                      options: options,
                                                      attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 16)],
                                                      context: nil)
    }
    
    func send() {
//        print(self.inputContainerView.inputTextArea.text)
        self.inputContainerView.inputTextArea.text = nil
        self.inputContainerView.invalidateIntrinsicContentSize()
    }

}
