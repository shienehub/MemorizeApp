---
layout: post
title: Deploy MemorizeApp
date: 2025-06-30 02:44
category: 
author: Shiene
tags: []
summary: 
---

아래는 **MemorizeApp의 배포 과정을 정리한 워크로그**와  
**앱스토어 커넥터(App Store Connect) 이슈 정리**입니다.

# MemorizeApp 배포 워크로그

## 1. **배포 준비**

- **앱 아이콘(1024x1024 PNG) 및 스크린샷(6.5인치, iPad Pro 등) 준비**
- **App Store Connect에서 앱 등록 및 정보 입력**
  - 앱 이름, 번들 ID, SKU, 카테고리, 연령 등급, 개인정보 처리방침, 지원 URL 등
- **Xcode에서 빌드 및 아카이브**
- **Info.plist 및 빌드 설정에서 iPhone 전용 앱으로 변경**
  - `TARGETED_DEVICE_FAMILY`를 "1"로 설정
  - Info.plist에서 `UIDeviceFamily` 삭제
- **App Privacy, Primary Category, Content Rights Information 등 누락 항목 입력**

## 2. **배포 과정**

- **Distribute App(App Store Connect)로 빌드 업로드**
- **App Store Connect에서 새 빌드 선택**
- **누락된 정보(앱 개인정보 처리방침, 카테고리, 콘텐츠 권한 등) 입력**
- **"Add for Review" → "Submit to App Review"로 심사 요청**
- **심사 대기 상태("Waiting for Review")로 전환**

## 3. **특이사항 및 이슈**

- **iPad 스크린샷 업로드 요구**
  - iPhone 전용 앱으로 빌드/업로드 시 해결
- **App Privacy, 카테고리, 콘텐츠 권한 등 누락 항목 입력 필요**
- **전화번호 입력 시 국가 코드 앞에 "+" 필요**
- **Info.plist에 `UIDeviceFamily` 키 사용 시 경고 발생 → 빌드 설정(`TARGETED_DEVICE_FAMILY`)으로 변경**
- **방향(orientation) 관련 경고는 iPhone 전용 앱이라면 무시 가능**



**필요하다면 각 항목별 스크린샷이나 추가 설명도 제공할 수 있습니다!**  
성공적인 앱 출시를 응원합니다 🚀

Sources
