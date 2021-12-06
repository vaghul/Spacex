//
//  Network.swift
//  SpaceX
//
//  Created by Vaghula Krishnan on 2021-12-01.
//

import Foundation
import Apollo
import ApolloSQLite

class Network {
    static let shared = Network()
    private let baseUrl = "https://api.spacex.land/graphql"
    
    private(set) lazy var apollo: ApolloClient = {
          // The cache is necessary to set up the store, which we're going to hand to the provider
      
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(
            .documentDirectory,
            .userDomainMask,
            true).first!
        let documentsURL = URL(fileURLWithPath: documentsPath)
        let sqliteFileURL = documentsURL.appendingPathComponent("spacex_launches.sqlite")

        // 2. Use that file URL to instantiate the SQLite cache:
        let sqliteCache = try! SQLiteNormalizedCache(fileURL: sqliteFileURL)

        // 3. And then instantiate an instance of `ApolloStore` with the cache you've just created:
        let store = ApolloStore(cache: sqliteCache)
        
          let client = URLSessionClient()
          let provider = NetworkInterceptorProvider(store: store, client: client)
          let url = URL(string: baseUrl)!

          let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                                   endpointURL: url)
                                                                   

          // Remember to give the store you already created to the client so it
          // doesn't create one on its own
          return ApolloClient(networkTransport: requestChainTransport,
                              store: store)
      }()
}


struct NetworkInterceptorProvider: InterceptorProvider {
    
    // These properties will remain the same throughout the life of the `InterceptorProvider`, even though they
    // will be handed to different interceptors.
    private let store: ApolloStore
    private let client: URLSessionClient
    
    init(store: ApolloStore,
         client: URLSessionClient) {
        self.store = store
        self.client = client
    }

    func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
        return [
            MaxRetryInterceptor(),
            CacheReadInterceptor(store: self.store),
            NetworkFetchInterceptor(client: self.client),
            ResponseCodeInterceptor(),
            JSONResponseParsingInterceptor(cacheKeyForObject: self.store.cacheKeyForObject),
            AutomaticPersistedQueryInterceptor(),
            CacheWriteInterceptor(store: self.store),
        ]
    }
    func additionalErrorInterceptor<Operation>(for operation: Operation) -> ApolloErrorInterceptor? where Operation : GraphQLOperation {
        return RerouteToCacheErrorInterceptor()
    }
}


/// This interceptor will reroute anything that fails with a response code error to retry hitting only the cache
    class RerouteToCacheErrorInterceptor: ApolloErrorInterceptor {
      var handledError: Error?
      
      func handleErrorAsync<Operation: GraphQLOperation>(
        error: Error,
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {
        
        self.handledError = error
        
        switch error {
        case ResponseCodeInterceptor.ResponseCodeError.invalidResponseCode:
          request.cachePolicy = .returnCacheDataDontFetch
          chain.retry(request: request, completion: completion)
        default:
            request.cachePolicy = .returnCacheDataDontFetch
            chain.retry(request: request, completion: completion)
        }
      }
    }
