//
//  SearchTarget.swift
//  Omos
//
//  Created by sangheon on 2022/03/06.
//

import Alamofire
import Foundation

enum SearchTarget {
    case searchAlbum(MusicRequest)
    case searchArtist(MusicRequest)
    case searchTrack(MusicRequest)
    case searchAlbumDetail(albumId: String)
    case searchTrackDetail(trackId: String)
    case searchArtistTrack(artistId: String)
    case searchArtistAlbum(artistId: String, ArtistRequest)
}

extension SearchTarget: TargetType {
    var baseURL: String {
       RestApiUrl.restUrl + "/search"
    }

    var method: HTTPMethod {
        switch self {
        case .searchAlbum: return .get
        case .searchArtist: return .get
        case .searchTrack: return .get
        case .searchAlbumDetail: return .get
        case .searchTrackDetail: return .get
        case .searchArtistTrack: return .get
        case .searchArtistAlbum: return .get
        }
    }

    var path: String {
        switch self {
        case .searchAlbum: return "/album"
        case .searchArtist: return "/artist"
        case .searchTrack: return "/track"
        case .searchAlbumDetail(let id): return "/album/\(id)"
        case .searchTrackDetail(let id): return "track/\(id)"
        case .searchArtistTrack(let id): return "/artist/\(id)/hot-tracks"
        case .searchArtistAlbum(let id, _): return "/artist/\(id)/albums"
        }
    }

    var parameters: RequestParams? {
        switch self {
        case .searchAlbum(let request): return .query(request)
        case .searchArtist(let request): return .query(request)
        case .searchTrack(let request): return .query(request)
        case .searchAlbumDetail: return nil
        case .searchTrackDetail: return nil
        case .searchArtistTrack: return nil
        case .searchArtistAlbum(_, let request): return .query(request)
        }
    }
}
