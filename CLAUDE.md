# LINKER Worker - Flutter Mobile App

## Project Overview
- **App Name**: LINKER Worker (링커 워커)
- **Description**: 인력관리 플랫폼 - 출결/정산/근무관리 모바일 앱
- **Company**: 주식회사 링커 (Linker Co., Ltd.)
- **Type**: Flutter 모바일 앱 (Android / iOS)
- **SDK**: Dart ^3.9.2
- **Version**: 1.0.0+1

## Tech Stack
- Flutter (Material Design)
- Dart
- Target Platforms: Android, iOS (web/desktop 미사용)

## Project Structure
```
lib/
├── main.dart                      → 앱 진입점 (WorkerApp)
├── screens/
│   ├── splash_screen.dart         → 스플래시 화면
│   └── login_screen.dart          → 로그인 화면
assets/
└── images/
    └── logo_linker.png            → LINKER 로고 이미지 (LL 마크)
android/                           → Android 플랫폼 코드
ios/                               → iOS 플랫폼 코드
test/                              → 테스트 파일
```

## Screen Guide (화면 설명)

### 1. main.dart - 앱 진입점
- `WorkerApp` 위젯: MaterialApp 설정
- 앱 타이틀: "LINKER Worker"
- 테마 색상: `#2B5CE6` (링커 블루)
- 폰트: Pretendard (예정)
- 상태바: 투명 배경, 다크 아이콘
- 시작 화면: SplashScreen

### 2. splash_screen.dart - 스플래시 화면
- **목적**: 앱 초기 로딩 시 브랜드 노출 + 초기화 시간 확보
- **디자인**: 그라디언트 배경 (#F8F9FC → #E8EAF0)
- **구성요소**:
  - LINKER 로고 이미지 (assets/images/logo_linker.png, 120x120)
  - "LINKER." 타이틀 텍스트 (네이비 #1B2B5A)
  - 한글 슬로건: "전통적인 신뢰 위에 첨단 기술을 더하다"
  - 영문 서브타이틀: "Precision Human Scale Workforce Management"
  - 프로그레스바: 0%→100% 애니메이션 (2.5초)
  - "SYSTEM INITIALIZING" + 퍼센트 표시
- **애니메이션**:
  - 페이드인 (0.8초) → 프로그레스바 진행 (2.5초) → 로그인 화면 이동
- **네비게이션**: 완료 후 `pushReplacement`로 LoginScreen 이동 (뒤로가기 불가)

### 3. login_screen.dart - 로그인 화면
- **목적**: 사용자 인증 (아이디/비밀번호 로그인)
- **디자인**: 그라디언트 배경, 스크롤 가능
- **구성요소**:
  - 로고 카드: 흰색 배경 + 그림자, 로고 이미지 + "LINKER." 텍스트
  - 헤드라인: "일과 사람을 잇는 가장 빠른 방법" ("빠른" 밑줄 강조)
  - 서브텍스트: "정확한 출결과 투명한 정산, 링커에서 지금 시작하세요."
  - STATUS 배지: 지문 아이콘 + "현재 4,291명의 파트너가 근무 중"
  - 입력 필드: 아이디, 비밀번호 (둥근 테두리, 포커스 시 블루 보더)
  - 로그인 버튼: 블루 (#2B5CE6), 풀 너비
  - 회원가입 버튼: 아웃라인 스타일
  - 하단 링크: 아이디 찾기 • 비밀번호 재설정
  - 카피라이트: "© 2024 Linker Co., Ltd. All rights reserved."
- **TODO**: 로그인 API 연동, 회원가입 화면 이동

## Design Tokens (디자인 토큰)
| 용도 | 색상 코드 |
|------|-----------|
| Primary Blue | `#2B5CE6` |
| Navy (텍스트/로고) | `#1B2B5A` |
| Text Secondary | `#3A4A6B` |
| Text Muted | `#6B7A99` |
| Text Hint | `#B0B8CC` |
| Border | `#E0E4EC` |
| Background Top | `#F8F9FC` |
| Background Bottom | `#E8EAF0` |

## Commands
```bash
flutter run              # 앱 실행
flutter build apk        # Android APK 빌드
flutter build ios        # iOS 빌드
flutter test             # 테스트 실행
flutter analyze          # 정적 분석
flutter pub get          # 의존성 설치
```

## Conventions
- Dart/Flutter 공식 스타일 가이드 준수
- `const` 생성자 적극 활용
- `flutter_lints` 기반 정적 분석 (analysis_options.yaml)
- 화면 파일은 `lib/screens/` 디렉토리에 `_screen.dart` 접미사로 생성
- 색상값은 `Color(0xFF...)` 형태로 직접 사용 (추후 테마 분리 예정)
- 그라디언트 배경은 전체 화면 공통 패턴으로 유지
