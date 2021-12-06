// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class LaunchesPastQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query launchesPast($limit: Int, $offset: Int) {
      launchesPast(limit: $limit, offset: $offset) {
        __typename
        details
        id
        launch_date_unix
        launch_site {
          __typename
          site_name
          site_name_long
          site_id
        }
        launch_year
        launch_success
        links {
          __typename
          flickr_images
          article_link
          video_link
          wikipedia
          mission_patch
        }
        mission_id
        mission_name
        rocket {
          __typename
          rocket {
            __typename
            company
            cost_per_launch
            country
            description
            name
            type
            wikipedia
          }
          rocket_type
          rocket_name
        }
      }
    }
    """

  public let operationName: String = "launchesPast"

  public var limit: Int?
  public var offset: Int?

  public init(limit: Int? = nil, offset: Int? = nil) {
    self.limit = limit
    self.offset = offset
  }

  public var variables: GraphQLMap? {
    return ["limit": limit, "offset": offset]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("launchesPast", arguments: ["limit": GraphQLVariable("limit"), "offset": GraphQLVariable("offset")], type: .list(.object(LaunchesPast.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(launchesPast: [LaunchesPast?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "launchesPast": launchesPast.flatMap { (value: [LaunchesPast?]) -> [ResultMap?] in value.map { (value: LaunchesPast?) -> ResultMap? in value.flatMap { (value: LaunchesPast) -> ResultMap in value.resultMap } } }])
    }

    public var launchesPast: [LaunchesPast?]? {
      get {
        return (resultMap["launchesPast"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [LaunchesPast?] in value.map { (value: ResultMap?) -> LaunchesPast? in value.flatMap { (value: ResultMap) -> LaunchesPast in LaunchesPast(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [LaunchesPast?]) -> [ResultMap?] in value.map { (value: LaunchesPast?) -> ResultMap? in value.flatMap { (value: LaunchesPast) -> ResultMap in value.resultMap } } }, forKey: "launchesPast")
      }
    }

    public struct LaunchesPast: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Launch"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("details", type: .scalar(String.self)),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("launch_date_unix", type: .scalar(String.self)),
          GraphQLField("launch_site", type: .object(LaunchSite.selections)),
          GraphQLField("launch_year", type: .scalar(String.self)),
          GraphQLField("launch_success", type: .scalar(Bool.self)),
          GraphQLField("links", type: .object(Link.selections)),
          GraphQLField("mission_id", type: .list(.scalar(String.self))),
          GraphQLField("mission_name", type: .scalar(String.self)),
          GraphQLField("rocket", type: .object(Rocket.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(details: String? = nil, id: GraphQLID? = nil, launchDateUnix: String? = nil, launchSite: LaunchSite? = nil, launchYear: String? = nil, launchSuccess: Bool? = nil, links: Link? = nil, missionId: [String?]? = nil, missionName: String? = nil, rocket: Rocket? = nil) {
        self.init(unsafeResultMap: ["__typename": "Launch", "details": details, "id": id, "launch_date_unix": launchDateUnix, "launch_site": launchSite.flatMap { (value: LaunchSite) -> ResultMap in value.resultMap }, "launch_year": launchYear, "launch_success": launchSuccess, "links": links.flatMap { (value: Link) -> ResultMap in value.resultMap }, "mission_id": missionId, "mission_name": missionName, "rocket": rocket.flatMap { (value: Rocket) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var details: String? {
        get {
          return resultMap["details"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "details")
        }
      }

      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var launchDateUnix: String? {
        get {
          return resultMap["launch_date_unix"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "launch_date_unix")
        }
      }

      public var launchSite: LaunchSite? {
        get {
          return (resultMap["launch_site"] as? ResultMap).flatMap { LaunchSite(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "launch_site")
        }
      }

      public var launchYear: String? {
        get {
          return resultMap["launch_year"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "launch_year")
        }
      }

      public var launchSuccess: Bool? {
        get {
          return resultMap["launch_success"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "launch_success")
        }
      }

      public var links: Link? {
        get {
          return (resultMap["links"] as? ResultMap).flatMap { Link(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "links")
        }
      }

      public var missionId: [String?]? {
        get {
          return resultMap["mission_id"] as? [String?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "mission_id")
        }
      }

      public var missionName: String? {
        get {
          return resultMap["mission_name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "mission_name")
        }
      }

      public var rocket: Rocket? {
        get {
          return (resultMap["rocket"] as? ResultMap).flatMap { Rocket(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "rocket")
        }
      }

      public struct LaunchSite: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["LaunchSite"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("site_name", type: .scalar(String.self)),
            GraphQLField("site_name_long", type: .scalar(String.self)),
            GraphQLField("site_id", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(siteName: String? = nil, siteNameLong: String? = nil, siteId: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "LaunchSite", "site_name": siteName, "site_name_long": siteNameLong, "site_id": siteId])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var siteName: String? {
          get {
            return resultMap["site_name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "site_name")
          }
        }

        public var siteNameLong: String? {
          get {
            return resultMap["site_name_long"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "site_name_long")
          }
        }

        public var siteId: String? {
          get {
            return resultMap["site_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "site_id")
          }
        }
      }

      public struct Link: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["LaunchLinks"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("flickr_images", type: .list(.scalar(String.self))),
            GraphQLField("article_link", type: .scalar(String.self)),
            GraphQLField("video_link", type: .scalar(String.self)),
            GraphQLField("wikipedia", type: .scalar(String.self)),
            GraphQLField("mission_patch", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(flickrImages: [String?]? = nil, articleLink: String? = nil, videoLink: String? = nil, wikipedia: String? = nil, missionPatch: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "LaunchLinks", "flickr_images": flickrImages, "article_link": articleLink, "video_link": videoLink, "wikipedia": wikipedia, "mission_patch": missionPatch])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var flickrImages: [String?]? {
          get {
            return resultMap["flickr_images"] as? [String?]
          }
          set {
            resultMap.updateValue(newValue, forKey: "flickr_images")
          }
        }

        public var articleLink: String? {
          get {
            return resultMap["article_link"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "article_link")
          }
        }

        public var videoLink: String? {
          get {
            return resultMap["video_link"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "video_link")
          }
        }

        public var wikipedia: String? {
          get {
            return resultMap["wikipedia"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "wikipedia")
          }
        }

        public var missionPatch: String? {
          get {
            return resultMap["mission_patch"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "mission_patch")
          }
        }
      }

      public struct Rocket: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["LaunchRocket"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("rocket", type: .object(Rocket.selections)),
            GraphQLField("rocket_type", type: .scalar(String.self)),
            GraphQLField("rocket_name", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(rocket: Rocket? = nil, rocketType: String? = nil, rocketName: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "LaunchRocket", "rocket": rocket.flatMap { (value: Rocket) -> ResultMap in value.resultMap }, "rocket_type": rocketType, "rocket_name": rocketName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var rocket: Rocket? {
          get {
            return (resultMap["rocket"] as? ResultMap).flatMap { Rocket(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "rocket")
          }
        }

        public var rocketType: String? {
          get {
            return resultMap["rocket_type"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "rocket_type")
          }
        }

        public var rocketName: String? {
          get {
            return resultMap["rocket_name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "rocket_name")
          }
        }

        public struct Rocket: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Rocket"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("company", type: .scalar(String.self)),
              GraphQLField("cost_per_launch", type: .scalar(Int.self)),
              GraphQLField("country", type: .scalar(String.self)),
              GraphQLField("description", type: .scalar(String.self)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("type", type: .scalar(String.self)),
              GraphQLField("wikipedia", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(company: String? = nil, costPerLaunch: Int? = nil, country: String? = nil, description: String? = nil, name: String? = nil, type: String? = nil, wikipedia: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Rocket", "company": company, "cost_per_launch": costPerLaunch, "country": country, "description": description, "name": name, "type": type, "wikipedia": wikipedia])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var company: String? {
            get {
              return resultMap["company"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "company")
            }
          }

          public var costPerLaunch: Int? {
            get {
              return resultMap["cost_per_launch"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "cost_per_launch")
            }
          }

          public var country: String? {
            get {
              return resultMap["country"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "country")
            }
          }

          public var description: String? {
            get {
              return resultMap["description"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "description")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var type: String? {
            get {
              return resultMap["type"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "type")
            }
          }

          public var wikipedia: String? {
            get {
              return resultMap["wikipedia"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "wikipedia")
            }
          }
        }
      }
    }
  }
}

public final class LaunchQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query launch($launchId: ID!) {
      launch(id: $launchId) {
        __typename
        details
        id
        launch_date_unix
        launch_site {
          __typename
          site_name
          site_name_long
          site_id
        }
        launch_year
        launch_success
        links {
          __typename
          flickr_images
          article_link
          video_link
          wikipedia
          mission_patch
        }
        mission_id
        mission_name
        rocket {
          __typename
          rocket {
            __typename
            company
            cost_per_launch
            country
            description
            name
            type
            wikipedia
          }
          rocket_type
          rocket_name
        }
      }
    }
    """

  public let operationName: String = "launch"

  public var launchId: GraphQLID

  public init(launchId: GraphQLID) {
    self.launchId = launchId
  }

  public var variables: GraphQLMap? {
    return ["launchId": launchId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("launch", arguments: ["id": GraphQLVariable("launchId")], type: .object(Launch.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(launch: Launch? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "launch": launch.flatMap { (value: Launch) -> ResultMap in value.resultMap }])
    }

    public var launch: Launch? {
      get {
        return (resultMap["launch"] as? ResultMap).flatMap { Launch(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "launch")
      }
    }

    public struct Launch: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Launch"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("details", type: .scalar(String.self)),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("launch_date_unix", type: .scalar(String.self)),
          GraphQLField("launch_site", type: .object(LaunchSite.selections)),
          GraphQLField("launch_year", type: .scalar(String.self)),
          GraphQLField("launch_success", type: .scalar(Bool.self)),
          GraphQLField("links", type: .object(Link.selections)),
          GraphQLField("mission_id", type: .list(.scalar(String.self))),
          GraphQLField("mission_name", type: .scalar(String.self)),
          GraphQLField("rocket", type: .object(Rocket.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(details: String? = nil, id: GraphQLID? = nil, launchDateUnix: String? = nil, launchSite: LaunchSite? = nil, launchYear: String? = nil, launchSuccess: Bool? = nil, links: Link? = nil, missionId: [String?]? = nil, missionName: String? = nil, rocket: Rocket? = nil) {
        self.init(unsafeResultMap: ["__typename": "Launch", "details": details, "id": id, "launch_date_unix": launchDateUnix, "launch_site": launchSite.flatMap { (value: LaunchSite) -> ResultMap in value.resultMap }, "launch_year": launchYear, "launch_success": launchSuccess, "links": links.flatMap { (value: Link) -> ResultMap in value.resultMap }, "mission_id": missionId, "mission_name": missionName, "rocket": rocket.flatMap { (value: Rocket) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var details: String? {
        get {
          return resultMap["details"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "details")
        }
      }

      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var launchDateUnix: String? {
        get {
          return resultMap["launch_date_unix"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "launch_date_unix")
        }
      }

      public var launchSite: LaunchSite? {
        get {
          return (resultMap["launch_site"] as? ResultMap).flatMap { LaunchSite(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "launch_site")
        }
      }

      public var launchYear: String? {
        get {
          return resultMap["launch_year"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "launch_year")
        }
      }

      public var launchSuccess: Bool? {
        get {
          return resultMap["launch_success"] as? Bool
        }
        set {
          resultMap.updateValue(newValue, forKey: "launch_success")
        }
      }

      public var links: Link? {
        get {
          return (resultMap["links"] as? ResultMap).flatMap { Link(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "links")
        }
      }

      public var missionId: [String?]? {
        get {
          return resultMap["mission_id"] as? [String?]
        }
        set {
          resultMap.updateValue(newValue, forKey: "mission_id")
        }
      }

      public var missionName: String? {
        get {
          return resultMap["mission_name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "mission_name")
        }
      }

      public var rocket: Rocket? {
        get {
          return (resultMap["rocket"] as? ResultMap).flatMap { Rocket(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "rocket")
        }
      }

      public struct LaunchSite: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["LaunchSite"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("site_name", type: .scalar(String.self)),
            GraphQLField("site_name_long", type: .scalar(String.self)),
            GraphQLField("site_id", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(siteName: String? = nil, siteNameLong: String? = nil, siteId: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "LaunchSite", "site_name": siteName, "site_name_long": siteNameLong, "site_id": siteId])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var siteName: String? {
          get {
            return resultMap["site_name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "site_name")
          }
        }

        public var siteNameLong: String? {
          get {
            return resultMap["site_name_long"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "site_name_long")
          }
        }

        public var siteId: String? {
          get {
            return resultMap["site_id"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "site_id")
          }
        }
      }

      public struct Link: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["LaunchLinks"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("flickr_images", type: .list(.scalar(String.self))),
            GraphQLField("article_link", type: .scalar(String.self)),
            GraphQLField("video_link", type: .scalar(String.self)),
            GraphQLField("wikipedia", type: .scalar(String.self)),
            GraphQLField("mission_patch", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(flickrImages: [String?]? = nil, articleLink: String? = nil, videoLink: String? = nil, wikipedia: String? = nil, missionPatch: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "LaunchLinks", "flickr_images": flickrImages, "article_link": articleLink, "video_link": videoLink, "wikipedia": wikipedia, "mission_patch": missionPatch])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var flickrImages: [String?]? {
          get {
            return resultMap["flickr_images"] as? [String?]
          }
          set {
            resultMap.updateValue(newValue, forKey: "flickr_images")
          }
        }

        public var articleLink: String? {
          get {
            return resultMap["article_link"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "article_link")
          }
        }

        public var videoLink: String? {
          get {
            return resultMap["video_link"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "video_link")
          }
        }

        public var wikipedia: String? {
          get {
            return resultMap["wikipedia"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "wikipedia")
          }
        }

        public var missionPatch: String? {
          get {
            return resultMap["mission_patch"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "mission_patch")
          }
        }
      }

      public struct Rocket: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["LaunchRocket"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("rocket", type: .object(Rocket.selections)),
            GraphQLField("rocket_type", type: .scalar(String.self)),
            GraphQLField("rocket_name", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(rocket: Rocket? = nil, rocketType: String? = nil, rocketName: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "LaunchRocket", "rocket": rocket.flatMap { (value: Rocket) -> ResultMap in value.resultMap }, "rocket_type": rocketType, "rocket_name": rocketName])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var rocket: Rocket? {
          get {
            return (resultMap["rocket"] as? ResultMap).flatMap { Rocket(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "rocket")
          }
        }

        public var rocketType: String? {
          get {
            return resultMap["rocket_type"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "rocket_type")
          }
        }

        public var rocketName: String? {
          get {
            return resultMap["rocket_name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "rocket_name")
          }
        }

        public struct Rocket: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Rocket"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("company", type: .scalar(String.self)),
              GraphQLField("cost_per_launch", type: .scalar(Int.self)),
              GraphQLField("country", type: .scalar(String.self)),
              GraphQLField("description", type: .scalar(String.self)),
              GraphQLField("name", type: .scalar(String.self)),
              GraphQLField("type", type: .scalar(String.self)),
              GraphQLField("wikipedia", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(company: String? = nil, costPerLaunch: Int? = nil, country: String? = nil, description: String? = nil, name: String? = nil, type: String? = nil, wikipedia: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Rocket", "company": company, "cost_per_launch": costPerLaunch, "country": country, "description": description, "name": name, "type": type, "wikipedia": wikipedia])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var company: String? {
            get {
              return resultMap["company"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "company")
            }
          }

          public var costPerLaunch: Int? {
            get {
              return resultMap["cost_per_launch"] as? Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "cost_per_launch")
            }
          }

          public var country: String? {
            get {
              return resultMap["country"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "country")
            }
          }

          public var description: String? {
            get {
              return resultMap["description"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "description")
            }
          }

          public var name: String? {
            get {
              return resultMap["name"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          public var type: String? {
            get {
              return resultMap["type"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "type")
            }
          }

          public var wikipedia: String? {
            get {
              return resultMap["wikipedia"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "wikipedia")
            }
          }
        }
      }
    }
  }
}
