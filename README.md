[![Platform](https://img.shields.io/cocoapods/p/LFAlertController.svg?style=flat)](http://cocoapods.org/pods/LFAlertController)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg?style=flat-square)](http://makeapullrequest.com)
 ### >>> [APP STORE LINK](https://apps.apple.com/kr/app/omos/id1615388062?l=ko, "APPSTORE link") <<<

[- 🔴 omos에 대한 소개](#omos에-대한-소개)  
[- 🛠 기술 스택](#기술-스택)  
[- 🕋 설계 및 모듈화](#설계-및-모듈화)  
[- 💡 주요 기능들](#주요-기능)  

# omos에 대한 소개
## omos_New

기존 omos의 기술부채를 해결하기 위해 새롭게 만들게 된 omos-New입니다.
🎧 **음악을 통해 자신만의 기록을 담고, 함께 감성을 공유하는 서비스**
- 음악을 매개로 기록하고 창작하는 감성 기록 SNS 서비스
- 사용자의 하루 일과에 따른 기록이나, 단어 혹은 문장으로 글감을 주던 기존의 다이어리 형식이 아닌, ‘음악’이라는 보다 더 감각적인 소재를 통해 다채로운 창작 및 기록
- 누적된 자신만의 음악 기록을 통해 당시 자신의 생각, 감정 등을 생생히 추억
- 공개 기능을 바탕으로 다른 사용자들과 감성을 나누고, 서로 공감
### >>>>> [omos 소개 페이지로 이동](https://melodious-passbook-4b9.notion.site/omos-488a3f87b45e49f5bdc458d77c25cb39) <<<<<

# 기술 스택

Ribs + ReactorKit + tuist + RxSwift + Needle 

# 설계 및 모듈화

## Micro Feature

<img src="https://user-images.githubusercontent.com/74440939/210211725-5ac7c9fe-bf25-4707-9775-4f46f1c0c522.png" width="600">

##### 참조: https://docs.tuist.io/building-at-scale/microfeatures/#product

# 주요 기능

| 로그인 | 회원가입 1 | 회원가입 2 | 비밀번호 찾기 | 
|:--------:|:--------:|:--------:|:--------:|
| <img src=https://user-images.githubusercontent.com/66512239/165897165-b7a7b1e4-38e7-4609-95a5-b4e78759a66b.png width=200> | <img src=https://user-images.githubusercontent.com/66512239/165897176-feaf224c-ddb4-4d65-8f0d-0b39d7dc5a0e.png width=200> | <img src=https://user-images.githubusercontent.com/66512239/165897187-e144c793-588e-49e6-a82b-28ea1156b669.png width=200> | <img src=https://user-images.githubusercontent.com/66512239/165897183-fa400241-a00a-4444-a82b-4e9f17609381.png width=200> |

| 홈화면 | 마이 레코드 | 전체 레코드 | my DJ | 
|:--------:|:--------:|:--------:|:--------:|
| <img src=https://user-images.githubusercontent.com/66512239/165903162-f4b3d619-3bcd-4c6b-a021-6269dd662759.gif width=200>|<img src=https://user-images.githubusercontent.com/66512239/165896288-468ca20d-1040-4b77-b262-f86d431a4bf3.gif width=200>|<img src=https://user-images.githubusercontent.com/66512239/165903893-680baa09-ba08-4f63-af5f-5ff0700fcafd.gif width=200>|<img src=https://user-images.githubusercontent.com/66512239/165904848-ddc46825-d45d-4f9b-ac51-4f8cf6e551c1.gif width=200>|

| 글 작성 노래검색 | 검색결과 뷰 1 | 검색결과 뷰 2 | 카테코리 뷰 | 
|:--------:|:--------:|:--------:|:--------:|
|<img src=https://user-images.githubusercontent.com/66512239/165905222-e0646254-15f1-4331-9649-b72cacf1cd5e.gif width=200>|<img src=https://user-images.githubusercontent.com/66512239/165905579-2fe933a7-325c-45b2-b6c0-27ae309221de.gif width=200>|<img src=https://user-images.githubusercontent.com/66512239/165906147-923a3b22-31f9-47ac-add8-0d7ad7503e52.gif width=200>|<img src=https://user-images.githubusercontent.com/66512239/165906813-2a37fa6a-9be8-482a-8670-af7a96866e46.gif width=200>|

| 한줄 작성 | 여러줄 작성 | 가사 해석 작성 | 음악별 레코드 리스트 |
|:--------:|:--------:|:--------:|:--------:|
|<img src=https://user-images.githubusercontent.com/66512239/165909178-ec60836d-79cb-4c2a-bda6-d33aaacd9502.gif width=200>|<img src=https://user-images.githubusercontent.com/66512239/165909667-da7788d1-693d-4a4f-958a-81a571773780.gif width=200>|<img src=https://user-images.githubusercontent.com/66512239/165910048-f39d338b-441d-4baa-9435-2efa95e596d1.gif width=200>|<img src=https://user-images.githubusercontent.com/66512239/165910806-3b176e5b-1545-40a3-aa43-4e6b932005f0.gif width=200>|

| 카데코리별 리스트 | 리스트 필터 | my DJ 프로필 | 유저 신고 차단 |
|:--------:|:--------:|:--------:|:--------:|
|<img src=https://user-images.githubusercontent.com/66512239/165912018-3d2f3c06-51e8-4dbf-ad18-95af7d6d818f.gif width=200>|<img src=https://user-images.githubusercontent.com/66512239/165912165-a79ef25d-ab79-4f42-8b55-37443e31987c.gif width=200>|<img src=https://user-images.githubusercontent.com/66512239/165912335-12dd3cd0-7f4d-4605-9452-07c06cc226ae.gif width=200>|<img src=https://user-images.githubusercontent.com/66512239/165912385-ef09bcea-cd5d-4e7e-b4c7-b9f49dc4570d.png width=200>|

| 마이프로필 | 좋아요&스크랩 리스트 | 프로필변경 | 비밀번호 변경 |
|:--------:|:--------:|:--------:|:--------:|
|<img src=https://user-images.githubusercontent.com/66512239/165915061-8c5f0fe8-0465-4461-8d5a-323bddac076f.gif width=200>|<img src=https://user-images.githubusercontent.com/66512239/165915214-2f8c9ea3-3789-473b-b138-807d952a8a04.gif width=200>|<img src=https://user-images.githubusercontent.com/66512239/165915252-2b306dc8-23c3-4218-8bbc-2f7e2861e443.png width=200>|<img src=https://user-images.githubusercontent.com/66512239/165915263-caaa4c71-6182-4e26-a9ab-61d9ebc38dd3.png width=200>|

| 레코드 신고 | 레코드 디테일 뷰 A |  레코드 디테일 뷰 B |  레코드 디테일 뷰 C | 인스타그램 공유 |
|:--------:|:--------:|:--------:|:--------:|:--------:|
|<img src=https://user-images.githubusercontent.com/66512239/165915770-9933ae62-4d78-4dff-b1a1-5001ffb2413b.png width=200>|<img src=https://user-images.githubusercontent.com/66512239/165915781-11a846c6-c3ec-4f27-88a0-0c50bd811835.png width=200>|<img src=https://user-images.githubusercontent.com/66512239/165921607-633ee32d-8600-4338-ac8e-43242f28be04.png width=200>|<img src=https://user-images.githubusercontent.com/66512239/165921617-a725fd90-1136-4ac3-a4ce-0ee518c27dfc.png width=200>|<img src=https://user-images.githubusercontent.com/66512239/165915787-626727b7-13e9-45da-af49-acdd89e99205.png width=200>|
