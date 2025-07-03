---
layout: post
title: Deploy MemorizeApp
date: 2025-06-29 23:16
category: 
author: Shiene
tags: []
summary: 
---

아래는 **지난 커밋부터 현재까지의 배포 작업**을 정리한 `deploy_worklog.md`와  
이에 맞는 커밋 메시지 예시입니다.

# 배포 작업 워크로그 (deploy_worklog.md)

## 2025년 6월 29일 ~ 6월 30일

### 1. **앱스토어 배포 준비**

- **앱 기본 정보 확인 및 입력**
  - 앱 이름, 번들 ID, SKU, 카테고리, 연령 등급, 개인정보 처리방침, 지원 URL 등 입력
  - 번들 ID 충돌로 인해 `freelancer.shiene.MemorizeApp`로 변경
- **앱 아이콘 및 스크린샷 준비**
  - 1024x1024 PNG 앱 아이콘 제작
  - 6.5인치(1242x2688) 스크린샷 캡처 및 리사이즈
- **앱 설명, 키워드, 저작권, 테스트 계정 등 정보 입력**
- **App Store Connect에서 새 앱 등록 및 정보 입력**

### 2. **Xcode 빌드 및 아카이브**

- **Xcode에서 번들 ID 변경 및 빌드**
- **아카이브 시도**
  - Xcode 15 및 iOS 17.5 SDK로 빌드 시 App Store Connect 업로드 실패 확인
  - 에러 메시지:  
    > *This app was built with the iOS 17.5 SDK. All iOS and iPadOS apps must be built with the iOS 18 SDK or later, included in Xcode 16 or later, in order to be uploaded to App Store Connect or submitted for distribution.*
- **Xcode 16 이상, iOS 18 SDK로 빌드 필요 확인**

### 3. **배포 관련 이슈 및 해결**

- **번들 ID 충돌 문제**
  - 기존 번들 ID(`Se.MemorizeApp`) 사용 불가로 `freelancer.shiene.MemorizeApp`로 변경
  - Apple Developer 계정 및 Xcode 프로젝트에 반영
- **SDK 버전 문제**
  - App Store Connect 업로드 시 Xcode 16 이상, iOS 18 SDK로 빌드 필요 확인
  - Deployment Target은 iOS 16.4로 유지
- **User Access 설정**
  - App Store Connect에서 Limited/Full Access 중 Full Access로 선택

### 4. **다음 단계**

- **Xcode 16 이상 설치 및 iOS 18 SDK로 빌드**
- **App Store Connect에 아카이브 업로드**
- **앱 심사 요청 및 배포 준비**

필요하다면 각 항목을 더 구체적으로 수정할 수 있습니다!  
추가로 궁금한 점이 있으면 언제든 질문해 주세요.

Sources
