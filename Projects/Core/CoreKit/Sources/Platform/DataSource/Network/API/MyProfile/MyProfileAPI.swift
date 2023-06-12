//
//  MyProfileAPI.swift
//  Omos
//
//  Created by sangheon on 2022/03/20.
//

import Alamofire

class MyProfileAPI {
    private let session: SessionProtocol

    init(session: SessionProtocol) {
      self.session = session
    }
    
    func myProfile(userId: Int, completion: @escaping(Result<MyProfileResponse, Error>) -> Void) {
        session.request(MyProfileTarget.myProfile(userId: userId), interceptor: TokenInterceptor.shared.getInterceptor()).responseDecodable { (response: AFDataResponse<MyProfileResponse>) in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }

    func updatePassword(request: PWUpdateRequest, completion: @escaping(Result<StateRespone, Error>) -> Void) {
        session.request(LoginTarget.updatePassword(request), interceptor: TokenInterceptor.shared.getInterceptor()).responseDecodable { (response: AFDataResponse<StateRespone>) in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }

    func updateProfile(request: ProfileUpdateRequest, completion: @escaping(Result<StateRespone, Error>) -> Void) {
        session.request(MyProfileTarget.updateProfile(request), interceptor: TokenInterceptor.shared.getInterceptor()).responseDecodable { (response: AFDataResponse<StateRespone>) in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }

    func likeRecords(userId: Int, completion: @escaping(Result<[MyRecordResponse], Error>) -> Void) {
            session.request(RecordTarget.likeRecords(userId: userId), interceptor: TokenInterceptor.shared.getInterceptor()).responseDecodable { (response: AFDataResponse<[MyRecordResponse]>) in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            }
    }

    func scrapRecords(userId: Int, completion: @escaping(Result<[MyRecordResponse], Error>) -> Void) {
            session.request(RecordTarget.scrapRecords(userId: userId), interceptor: TokenInterceptor.shared.getInterceptor()).responseDecodable { (response: AFDataResponse<[MyRecordResponse]>) in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    print(error.localizedDescription)
                    completion(.failure(error))
                }
            }
    }

    func myProfileRecords(userId: Int, completion: @escaping(Result<MyProfileRecordResponse, Error>) -> Void) {
        session.request(RecordTarget.myProfileRecords(userId: userId), interceptor: TokenInterceptor.shared.getInterceptor()).responseDecodable { (response: AFDataResponse<MyProfileRecordResponse>) in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }

    func logOut(userId: Int, completion: @escaping(Result<StateRespone, Error>) -> Void) {
        session.request(LoginTarget.logOut(userId: userId), interceptor: TokenInterceptor.shared.getInterceptor()).responseDecodable { (response: AFDataResponse<StateRespone>) in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }

    func myDjProfile(fromId: Int, toId: Int, completion: @escaping(Result<MyDjProfileResponse, Error>) -> Void) {
        session.request(FollowTarget.myDjProfile(fromId: fromId, toId: toId), interceptor: TokenInterceptor.shared.getInterceptor()).responseDecodable { (response: AFDataResponse<MyDjProfileResponse>) in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }

    func signOut(userId: Int, completion: @escaping(Result<StateRespone, Error>) -> Void) {
        session.request(LoginTarget.signout(userId: userId), interceptor: TokenInterceptor.shared.getInterceptor()).responseDecodable { (response: AFDataResponse<StateRespone>) in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
    
    // follow
    func followerList(toId: Int, fromId: FromIdRequest, completion: @escaping(Result<[ListResponse], Error>) -> Void) {
        session.request(FollowTarget.followers(toId: toId, fromId: fromId), interceptor: TokenInterceptor.shared.getInterceptor()).responseDecodable { (response: AFDataResponse<[ListResponse]>) in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
    
    func followingList(toId: Int, fromId: FromIdRequest, completion: @escaping(Result<[ListResponse], Error>) -> Void) {
        session.request(FollowTarget.followings(toId: toId, fromId: fromId), interceptor: TokenInterceptor.shared.getInterceptor()).responseDecodable { (response: AFDataResponse<[ListResponse]>) in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
    
    // block
    func blockList(userId: Int, completion: @escaping(Result<[ListResponse], Error>) -> Void) {
        session.request(BlockTarget.blockList(userId: userId), interceptor: TokenInterceptor.shared.getInterceptor()).responseDecodable { (response: AFDataResponse<[ListResponse]>) in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
    
    func blockDelete(fromId: Int, toId: Int, completion: @escaping(Result<StateRespone, Error>) -> Void) {
        session.request(BlockTarget.blockDelete(fromId: fromId, toId: toId), interceptor: TokenInterceptor.shared.getInterceptor()).responseDecodable { (response: AFDataResponse<StateRespone>) in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
        }
    }
    
    func saveFollow(fromId: Int, toId: Int, completion: @escaping(Result<StateRespone, Error>) -> Void) {
        AF.request(FollowTarget.saveFollow(fromId: fromId, toId: toId), interceptor: TokenInterceptor.shared.getInterceptor()).responseDecodable { (response: AFDataResponse<StateRespone>) in
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

    func deleteFollow(fromId: Int, toId: Int, completion: @escaping(Result<StateRespone, Error>) -> Void) {
        AF.request(FollowTarget.deleteFollow(fromId: fromId, toId: toId), interceptor: TokenInterceptor.shared.getInterceptor()).responseDecodable { (response: AFDataResponse<StateRespone>) in
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
}
