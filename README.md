# PhotorySDK

### 개발 환경
* iOS 15.0 이상
* framework방식으로 사용할 수 있도록 제작

## 🍀 구현해야 하는 것들 🍀
 - ✅: SDK에서 올바르게 구현을 완료하고 테스트 코드까지 통과한 부분 <br>
 - 🌙: SDK에서 구현했으나, 테스트 코드를 통과하지 못한 부분 <br>
 
```
 - Photory (App단과 연결하여 사용하기 위한 부분) 
 - PhotoryMain (SDK 내부와 관련한 부분)
 - AppStorageManager (a.k.a UserDefaultManager, 디바이스 로컬 저장 데이터) 
 - APICleint (APIRequest와 관련한 부분)
  - RoomManager (RoomManger를 통해 Room의 APIRequest 부분을 별도 관리)
  - FeedManager (FeedManager를 통해 Feed의 APIRequest 부분을 별도 관리)
 - Common
  - Request 
  - Respone
 
 - Auth
  - SignUp
    - EmailValidation (이메일 중복 확인) ✅
    - SendVerificationMail (이메일 인증번호 전송) ✅
    - AuthKeyValidation (이메일 인증번호 확인) ✅
   - SignIn
    - SignIn (로그인) ✅
    - SignInToken (로그인 유지) ✅
    
 - Room
  - RoomDetail (해당 방 정보 상세보기) ✅
  - RoomList (방 리스트 가져오기) ✅
  - RoomCreate (방 생성) ✅
  - RoomEnter (방 입장) ✅
  - RoomPassword (방 비밀번호 변경) ✅
  - RoomDisable (방 삭제) ✅
  - RoomLeave (방 나가기) ✅
  - RoomOwner (방 오너 변경) ✅
  - RoomKick (방 강퇴) ✅
   
 - Feed
  - FeedDelete (피드 삭제) 🌙
  - FeedCreate (피드 생성) 🌙
  - FeedUpdate (피드 수정) 🌙
  - FeedDetail (피드 읽기) 🌙
  - FeedList (피드 리스트) 🌙
    
```
 
 ## 🚨 프로젝트 ISSUE
 ```
  - Feed 구현 이슈
  : feed의 이미지 전송을 위해 multipart/form-data를 사용해야 하나, 외부 라이브러리 없이 구현하는 방법에 대해 학습중
 ```
 
 ## 🆙 SDK 개선방향
 ```
  - 클로저를 async await로 대체
  - 테스트 코드 작성에 Quick, Nimble 적극 활용해보기
  - RoomListQuery를 활용하기
 ```
