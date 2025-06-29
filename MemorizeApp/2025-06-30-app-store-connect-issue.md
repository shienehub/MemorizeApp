---
layout: post
title: App Store Connect Issue
date: 2025-06-30 02:44
category: 
author: Shiene
tags: []
summary: 
---

# 앱스토어 커넥터 이슈 정리

## 1. **iPad 스크린샷 업로드 요구**

- **문제:**  
  - App Store Connect에서 "You must upload a screenshot for 13-inch iPad displays." 에러
- **원인:**  
  - 앱이 Universal 또는 iPad 지원으로 빌드/업로드된 경우
- **해결:**  
  - Xcode에서 `TARGETED_DEVICE_FAMILY`를 "1"로 설정하여 iPhone 전용 앱으로 빌드/업로드
  - Info.plist에서 `UIDeviceFamily` 삭제
  - App Store Connect에서 새 빌드 선택

## 2. **App Privacy(앱 개인정보 처리방침) 입력 요구**

- **문제:**  
  - "Before you can submit this app for review, an Admin must provide information about the app’s privacy practices in the App Privacy section."
- **원인:**  
  - 앱 개인정보 처리방침 정보 미입력
- **해결:**  
  - App Store Connect → [앱 선택] → "App Privacy" → "No, we do not collect data from this app." 선택 후 "Publish"
  - Admin 권한 필요

## 3. **Primary Category(주요 카테고리) 선택 요구**

- **문제:**  
  - "You must select a primary category for your app."
- **원인:**  
  - 카테고리 미선택
- **해결:**  
  - App Store Connect → [앱 선택] → "App Information" → "Primary Category" 선택 후 저장

## 4. **Content Rights Information(콘텐츠 권한 정보) 입력 요구**

- **문제:**  
  - "You must set up Content Rights Information in App Information."
- **원인:**  
  - 콘텐츠 권한 정보 미입력
- **해결:**  
  - App Store Connect → [앱 선택] → "App Information" → "Content Rights" → 서드파티 콘텐츠 사용 여부 답변 후 저장

## 5. **전화번호 입력 에러**

- **문제:**  
  - "Phone number - This field is invalid. Please ensure your phone number is formatted correctly, including a '+' in front of the country code."
- **원인:**  
  - 국가 코드 앞에 "+" 미기입
- **해결:**  
  - "+82 10 1234 5678" 또는 "+821012345678" 형식으로 입력

## 6. **Info.plist 및 빌드 설정 경고**

- **문제:**  
  - "User supplied UIDeviceFamily key in the Info.plist will be overwritten. Please use the build setting TARGETED_DEVICE_FAMILY and remove UIDeviceFamily from your Info.plist."
- **원인:**  
  - Info.plist에 `UIDeviceFamily` 키 사용
- **해결:**  
  - Info.plist에서 `UIDeviceFamily` 삭제
  - Xcode 빌드 설정에서 `TARGETED_DEVICE_FAMILY`를 "1"로 설정

## 7. **방향(orientation) 관련 경고**

- **문제:**  
  - "All interface orientations must be supported unless the app requires full screen."
- **원인:**  
  - iPad 지원 시 방향 제한이 있음
- **해결:**  
  - iPhone 전용 앱이라면 무시 가능
  - iPad 앱이라면 Info.plist에 `UIRequiresFullScreen` 추가

# 결론

- **앱스토어 배포 과정에서 다양한 정보 입력 및 설정이 필요합니다.**
- **누락된 정보는 App Store Connect에서 경고로 안내되며,  
  - 각 항목을 차례로 입력/설정하면 해결됩니다.**
- **iPhone 전용 앱으로 빌드/업로드하면 iPad 스크린샷 업로드가 필요 없습니다.**
- **Info.plist와 빌드 설정을 꼼꼼히 확인하면 경고/에러를 피할 수 있습니다.**