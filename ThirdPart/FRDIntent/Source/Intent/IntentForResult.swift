//
//  IntentForResult.swift
//  FRDIntent
//
//  Created by GUO Lin on 8/29/16.
//  Copyright © 2016 Douban Inc. All rights reserved.
//

import Foundation

/**
 The resultCode's possible values:
 */
@objc public enum FRDResultCode: Int {

  /// Ok: For successful result.
  case ok
  /// Canceled: For the canceled operation.
  case canceled
  /// FirstUser: For the custom define operation.
  case firstUser

}

/**
 The protocol to abstract the view controller tha can send the Intent for request a result from the destination.
 */
@objc public protocol FRDIntentForResultSendable {

  /**
   When the result return, this method will be called.
   
   - parameter requestCode: The integer request code originally supplied to startControllerForResult(), allowing you to identify who this result came from.
   - parameter resultCode: The result code returned by the child conroller.
   - parameter intent: An Intent, which can return result data to the caller (various data can be attached to Intent "extras").
  */
  func onControllerResult(requestCode: Int, resultCode: FRDResultCode, data: FRDIntent)

}

/**
 The protocol to abstract the view controller tha can receive the Intent for request a result from the destination.
 */
@objc public protocol FRDIntentForResultReceivable: FRDIntentReceivable {

//  var requestCode: Int? { get set }
//  var delegate: IntentForResultSendable? { get set }

  /// The integer request code originally supplied to startControllerForResult(), allowing you to identify who this result came from.
  func setRequestCode(_ requestCode: Int)

  /// The source view controller
  func setDelegate(_ delegate: FRDIntentForResultSendable?)
}
