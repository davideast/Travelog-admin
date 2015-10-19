//
//  ViewController.swift
//  Swipe Navigation Xcode 7
//
//  Created by PJ Vea on 7/22/15.
//  Copyright © 2015 Vea Software. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var currentUsersLabel: UILabel!
  
  var onlineUsersRef: Firebase!
  var handle: UInt!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    onlineUsersRef = Firebase(url: "https://logtravel.firebaseio.com/totalPosts")
  }
  
  override func viewDidAppear(animated: Bool) {
    handle = onlineUsersRef.observeEventType(.Value) { (snap: FDataSnapshot!) in
      let postCount = snap.value.description
      self.currentUsersLabel.text = postCount
    }
  }
  
  override func viewDidDisappear(animated: Bool) {
    super.viewDidDisappear(animated)
    onlineUsersRef.removeObserverWithHandle(handle)
  }
  
}

