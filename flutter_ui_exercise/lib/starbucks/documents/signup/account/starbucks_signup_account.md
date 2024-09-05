## 스타벅스 회원가입 화면(2)
* 계정설정 화면

### 내맘대로 생각하는 UI 구조
* AppBar - X 버튼, 상단 아이콘
* Center - 전체 컨텐츠
  * Column - CrossAxisAlignment.start
    * Text - 안내 메세지
    * Column 
      * Stack * 3
        * TextField, Visibility Button, Check Button
    * Expanded
      * Button - 다음

### 알게된 것들
* 패스워드에 사용하는 TextField
    ```dart
    // 이 옵션을 키면 온점으로 텍스트가 표시된다.
    obscureText: true,
    ```

### 구현 화면

<img src="https://github.com/user-attachments/assets/9e54345a-6891-4ecd-a6d5-b91d71779ec9" width="250" height="520"/>