import Foundation
import Vapor

// Taken from: https://github.com/mattdonnelly/Swifter/blob/master/Swifter/Swifter.swift
// MARK: - Twitter URL
public enum TwitterURL {
    case api
    case upload
    case stream
    case userStream
    case siteStream
    case oauth

    var url: URL {
        switch self {
        case .api:          return URL(string: "https://api.twitter.com/1.1/")!
        case .upload:       return URL(string: "https://upload.twitter.com/1.1/")!
        case .stream:       return URL(string: "https://stream.twitter.com/1.1/")!
        case .userStream:   return URL(string: "https://userstream.twitter.com/1.1/")!
        case .siteStream:   return URL(string: "https://sitestream.twitter.com/1.1/")!
        case .oauth:        return URL(string: "https://api.twitter.com/")!
        }
    }
}


public class Twitter {
  let bot_handle: String = "HANDLE"
  let consumer_key: String = "KEY"
  let consumer_secret: String = "SECRET"
  let access_token: String = "TOKEN"
  let access_token_secret: String = "TOKEN-SECRET"

  public init(){

  }

  // FIXME: auth not working: getting
  // {"errors":[{"code":215,"message":"Bad Authentication data."}]}
  
  func queryForTweet(q: String, drop: Droplet) throws -> String {
    // let headers =
    let response = try drop.client.get("\(TwitterURL.api.url.absoluteString)search/tweets.json?q=\(q)"
, headers: [
  "authorization": "OAuth oauth_consumer_key=\(consumer_key),oauth_token=\(access_token),oauth_signature_method=HMAC-SHA1,oauth_version=1.0",
  "cache-control": "no-cache"
])
    print("\(response)")
    return ""
  }
}
