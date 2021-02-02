//
//  Database.swift
//  MFramework
//
//  Created by Mac on 01.11.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation

//var postRef: DatabaseReference!
//// [START post_stars_transaction]
//ref.runTransactionBlock({ (currentData: MutableData) -> TransactionResult in
//  if var post = currentData.value as? [String : AnyObject], let uid = Auth.auth().currentUser?.uid {
//    var stars: Dictionary<String, Bool>
//    stars = post["stars"] as? [String : Bool] ?? [:]
//    var starCount = post["starCount"] as? Int ?? 0
//    if let _ = stars[uid] {
//      // Unstar the post and remove self from stars
//      starCount -= 1
//      stars.removeValue(forKey: uid)
//    } else {
//      // Star the post and add self to stars
//      starCount += 1
//      stars[uid] = true
//    }
//    post["starCount"] = starCount as AnyObject?
//    post["stars"] = stars as AnyObject?
//
//    // Set value and report transaction success
//    currentData.value = post
//
//    return TransactionResult.success(withValue: currentData)
//  }
//  return TransactionResult.success(withValue: currentData)
//}) { (error, committed, snapshot) in
//  if let error = error {
//    print(error.localizedDescription)
//  }
//}
//// [END post_stars_transaction]
//
//// [START basic_write]
//self.ref.child("users").child(user.uid).setValue(["username": username])
//// [END basic_write]
//
//
//// [START create_database_reference]
//self.ref = Database.database().reference()
//// [END create_database_reference]
//
//
//// [START single_value_read]
//let userID = Auth.auth().currentUser?.uid
//ref.child("users").child(userID!).observeSingleEvent(of: .value, with: { (snapshot) in
//  // Get user value
//  let value = snapshot.value as? NSDictionary
//  let username = value?["username"] as? String ?? ""
//  let user = User(username: username)
//
//  // [START_EXCLUDE]
//  // Write new post
//  self.writeNewPost(withUserID: userID!, username: user.username, title: self.titleTextField.text!, body: self.bodyTextView.text)
//  // Finish this Activity, back to the stream
//  _ = self.navigationController?.popViewController(animated: true)
//  // [END_EXCLUDE]
//  }) { (error) in
//    print(error.localizedDescription)
//}
//// [END single_value_read]
//
//
//
//// [START write_fan_out]
//guard let key = ref.child("posts").childByAutoId().key else { return }
//let post = ["uid": userID,
//            "author": username,
//            "title": title,
//            "body": body]
//let childUpdates = ["/posts/\(key)": post,
//                    "/user-posts/\(userID)/\(key)/": post]
//ref.updateChildValues(childUpdates)
//// [END write_fan_out]
//
//
//// [START recent_posts_query]
//// Last 100 posts, these are automatically the 100 most recent
//// due to sorting by push() keys
//let recentPostsQuery = (ref?.child("posts").queryLimited(toFirst: 100))!
//// [END recent_posts_query]
//
//
//// [START my_top_posts_query]
//// My top posts by number of stars
//let myTopPostsQuery = (ref.child("user-posts").child(getUid())).queryOrdered(byChild: "starCount")
//// [END my_top_posts_query]
//
//
//
//// [START child_event_listener]
//// Listen for new comments in the Firebase database
//commentsRef.observe(.childAdded, with: { (snapshot) -> Void in
//  self.comments.append(snapshot)
//  self.tableView.insertRows(at: [IndexPath(row: self.comments.count-1, section: self.kSectionComments)], with: UITableView.RowAnimation.automatic)
//})
//// Listen for deleted comments in the Firebase database
//commentsRef.observe(.childRemoved, with: { (snapshot) -> Void in
//  let index = self.indexOfMessage(snapshot)
//  self.comments.remove(at: index)
//  self.tableView.deleteRows(at: [IndexPath(row: index, section: self.kSectionComments)], with: UITableView.RowAnimation.automatic)
//})
//// [END child_event_listener]
//
//// [START post_value_event_listener]
//refHandle = postRef.observe(DataEventType.value, with: { (snapshot) in
//  let postDict = snapshot.value as? [String : AnyObject] ?? [:]
//  // [START_EXCLUDE]
//  self.post.setValuesForKeys(postDict)
//  self.tableView.reloadData()
//  self.navigationItem.title = self.post.title
//  // [END_EXCLUDE]
//})
//// [END post_value_event_listener]



//class Post: NSObject {
//  var uid: String
//  var author: String
//  var title: String
//  var body: String
//  var starCount: AnyObject?
//  var stars: Dictionary<String, Bool>?
//
//  init(uid: String, author: String, title: String, body: String) {
//    self.uid = uid
//    self.author = author
//    self.title = title
//    self.body = body
//    self.starCount = 0 as AnyObject?
//  }
//
//  init?(snapshot: DataSnapshot) {
//    guard let dict = snapshot.value as? [String:Any] else { return nil }
//    guard let uid  = dict["uid"] as? String  else { return nil }
//    guard let author = dict["author"]  as? String else { return nil }
//    guard let title = dict["title"]  as? String else { return nil }
//    guard let body = dict["body"]  as? String else { return nil }
//    guard let starCount = dict["starCount"] else { return nil }
//
//    self.uid = uid
//    self.author = author
//    self.title = title
//    self.body = body
//    self.starCount = starCount as AnyObject?
//  }
//
//  convenience override init() {
//    self.init(uid: "", author: "", title: "", body:  "")
//  }
//}
