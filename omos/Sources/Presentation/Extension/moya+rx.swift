import Foundation
import RxSwift
#if !COCOAPODS
import Moya
#endif

extension MoyaProvider: ReactiveCompatible {}

public extension Reactive where Base: MoyaProviderType {

    /// Designated request-making method.
    ///
    /// - Parameters:
    ///   - token: Entity, which provides specifications necessary for a `MoyaProvider`.
    ///   - callbackQueue: Callback queue. If nil - queue from provider initializer will be used.
    /// - Returns: Single response object.
    func request(_ token: Base.Target, callbackQueue: DispatchQueue? = nil) -> Single<Response> {
        Single.create { [weak base] single in
            let cancellableToken = base?.request(token, callbackQueue: callbackQueue, progress: nil) { result in
                switch result {
                case let .success(response):
                    single(.success(response))
                case let .failure(error):
                    single(.failure(error))
                }
            }

            return Disposables.create {
                cancellableToken?.cancel()
            }
        }
    }

    /// Designated request-making method with progress.
    func requestWithProgress(_ token: Base.Target, callbackQueue: DispatchQueue? = nil) -> Observable<ProgressResponse> {

        let progressBlock = AnyObserver<ProgressResponse>.onNext
        let response: Observable<ProgressResponse> = Observable.create { [weak base] observer in
            let cancellableToken = base?.request(token, callbackQueue: callbackQueue, progress: progressBlock(observer)) { result in
                switch result {
                case .success:
                    observer.onCompleted()
                case let .failure(error):
                    observer.onError(error)
                }
            }

            return Disposables.create {
                cancellableToken?.cancel()
            }
        }

        // Accumulate all progress and combine them when the result comes
        return response.scan(ProgressResponse()) { last, progress in
            let progressObject = progress.progressObject ?? last.progressObject
            let response = progress.response ?? last.response
            return ProgressResponse(progress: progressObject, response: response)
        }
    }
}

#if canImport(UIKit)
    import UIKit.UIImage
#elseif canImport(AppKit)
    import AppKit.NSImage
#endif

/// Extension for processing raw NSData generated by network access.
public extension PrimitiveSequence where Trait == SingleTrait, Element == Response {

    /// Filters out responses that don't fall within the given closed range, generating errors when others are encountered.
    func filter<R: RangeExpression>(statusCodes: R) -> Single<Element> where R.Bound == Int {
        flatMap { .just(try $0.filter(statusCodes: statusCodes)) }
    }

    /// Filters out responses that have the specified `statusCode`.
    func filter(statusCode: Int) -> Single<Element> {
        flatMap { .just(try $0.filter(statusCode: statusCode)) }
    }

    /// Filters out responses where `statusCode` falls within the range 200 - 299.
    func filterSuccessfulStatusCodes() -> Single<Element> {
        flatMap { .just(try $0.filterSuccessfulStatusCodes()) }
    }

    /// Filters out responses where `statusCode` falls within the range 200 - 399
    func filterSuccessfulStatusAndRedirectCodes() -> Single<Element> {
        flatMap { .just(try $0.filterSuccessfulStatusAndRedirectCodes()) }
    }

    /// Maps data received from the signal into an Image. If the conversion fails, the signal errors.
    func mapImage() -> Single<Image> {
        flatMap { .just(try $0.mapImage()) }
    }

    /// Maps data received from the signal into a JSON object. If the conversion fails, the signal errors.
    func mapJSON(failsOnEmptyData: Bool = true) -> Single<Any> {
        flatMap { .just(try $0.mapJSON(failsOnEmptyData: failsOnEmptyData)) }
    }

    /// Maps received data at key path into a String. If the conversion fails, the signal errors.
    func mapString(atKeyPath keyPath: String? = nil) -> Single<String> {
        flatMap { .just(try $0.mapString(atKeyPath: keyPath)) }
    }

    /// Maps received data at key path into a Decodable object. If the conversion fails, the signal errors.
    func map<D: Decodable>(_ type: D.Type, atKeyPath keyPath: String? = nil, using decoder: JSONDecoder = JSONDecoder(), failsOnEmptyData: Bool = true) -> Single<D> {
        flatMap { .just(try $0.map(type, atKeyPath: keyPath, using: decoder, failsOnEmptyData: failsOnEmptyData)) }
    }
}
