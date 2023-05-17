//
//  SearchAPI.swift
//  Omos
//
//  Created by sangheon on 2022/03/06.
//

import Alamofire
import Foundation
import RxSwift

class SearchAPI {
    func albumFetch(request: MusicRequest, completion:@escaping(Result<[AlbumRespone], Error>) -> Void) {
        AF.request(SearchTarget.searchAlbum(request), interceptor: TokenInterceptor.shared.getInterceptor()).responseDecodable { (response: AFDataResponse<[AlbumRespone]>) in
            switch response.result {
            case .success(let data):
                print(data)
                completion(.success(data))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }

    func artistFetch(request: MusicRequest, completion:@escaping(Result<[ArtistRespone], Error>) -> Void) {
        AF.request(SearchTarget.searchArtist(request), interceptor: TokenInterceptor.shared.getInterceptor()).responseDecodable { (response: AFDataResponse<[ArtistRespone]>) in
            switch response.result {
            case .success(let data):
                print(data)
                completion(.success(data))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }

    func trackFetch(request: MusicRequest, completion:@escaping(Result<[TrackRespone], Error>) -> Void) {
        AF.request(SearchTarget.searchTrack(request), interceptor: TokenInterceptor.shared.getInterceptor()).responseDecodable { (response: AFDataResponse<[TrackRespone]>) in
            switch response.result {
            case .success(let data):
                print(data)
                completion(.success(data))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }

    func searchTrackFetch(request: MusicRequest, completion:@escaping(Result<[TrackTitleRespone], Error>) -> Void) {
        AF.request(SearchTarget.searchTrack(request), interceptor: TokenInterceptor.shared.getInterceptor()).responseDecodable { (response: AFDataResponse<[TrackTitleRespone]>) in
            switch response.result {
            case .success(let data):
                print(data)
                completion(.success(data))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }

    func albumDetailFetch(albumId: String, completion:@escaping(Result<[AlbumDetailRespone], Error>) -> Void) {
        AF.request(SearchTarget.searchAlbumDetail(albumId: albumId), interceptor: TokenInterceptor.shared.getInterceptor()).responseDecodable { (response: AFDataResponse<[AlbumDetailRespone]>) in
            switch response.result {
            case .success(let data):
                print(data)
                completion(.success(data))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }

    func trackDetailFetch(trackId: String, completion:@escaping(Result<TrackRespone, Error>) -> Void) {
        AF.request(SearchTarget.searchTrackDetail(trackId: trackId), interceptor: TokenInterceptor.shared.getInterceptor()).responseDecodable { (response: AFDataResponse<TrackRespone>) in
            switch response.result {
            case .success(let data):
                print(data)
                completion(.success(data))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }

    func artistDetailTrackFetch(artistId: String, completion:@escaping(Result<[ArtistDetailRespone], Error>) -> Void) {
        AF.request(SearchTarget.searchArtistTrack(artistId: artistId), interceptor: TokenInterceptor.shared.getInterceptor()).responseDecodable { (response: AFDataResponse<[ArtistDetailRespone]>) in
            switch response.result {
            case .success(let data):
                print(data)
                completion(.success(data))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }

    func artistDetailAlbumFetch(artistId: String, request: ArtistRequest, completion:@escaping(Result<[AlbumRespone], Error>) -> Void) {
        AF.request(SearchTarget.searchArtistAlbum(artistId: artistId, request), interceptor: TokenInterceptor.shared.getInterceptor()).responseDecodable { (response: AFDataResponse<[AlbumRespone]>) in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
}
