//
//  Storage.swift
//  MFramework
//
//  Created by Mac on 01.11.2020.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import Firebase
//import FirebaseStorageSwift

//lazy var storage = Storage.storage()

// upload
//let filePath = Auth.auth().currentUser!.uid +
//  "/\(Int(Date.timeIntervalSinceReferenceDate * 1000))/\(imageFile!.lastPathComponent)"
//let storageRef = self.storage.reference(withPath: filePath)
//storageRef.putFile(from: imageFile!) { result in
//  switch result {
//  case .success:
//    self.uploadSuccess(storageRef, storagePath: filePath)
//  case let .failure(error):
//    print("Error uploading: \(error)")
//    self.urlTextView.text = "Upload Failed"
//  }
//}

// download
//storageRef = Storage.storage().reference()
//let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
//let documentsDirectory = paths[0]
//let filePath = "file:\(documentsDirectory)/myimage.jpg"
//guard let fileURL = URL(string: filePath) else { return }
//guard let storagePath = UserDefaults.standard.object(forKey: "storagePath") as? String else {
//  return
//}
//storageRef.child(storagePath).write(toFile: fileURL) { result in
//  switch result {
//  case let .success(url):
//    self.statusTextView.text = "Download Succeeded!"
//    self.imageView.image = UIImage(contentsOfFile: url.path)
//  case let .failure(error):
//    print("Error downloading:\(error)")
//    self.statusTextView.text = "Download Failed"
//  }
//}
