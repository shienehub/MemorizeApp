---
layout: post
title: Low-level Design
date: 2025-06-29 13:12
category: 
author: Shiene
tags: []
summary: 
---

# Low-level Design

## 1. 구조
- **GameViewModel:** 게임 로직, 상태 관리, 이벤트 로그 기록
- **GameView:** UI 레이아웃, 카드 그리드, 테마/난이도 Picker, 스코어/리셋 버튼
- **EventLog:** 이벤트 로그 구조체 (event_id, event_type, properties 등)

## 2. 주요 메서드
- **flipCard(at:):** 카드 뒤집기, 매칭 시도
- **resetGame():** 게임 초기화
- **addEvent(eventType:properties:):** 이벤트 로그 기록
- **endGame():** 게임 종료 시 결과 출력

## 3. 데이터 구조
- **GameState:** cards, score, isGameOver
- **EventLog:** event_id, event_type, properties, timestamp
- **EventProperties:** [String: Any] (typealias로 정의)

## 4. UI 레이아웃
- **VStack:** 전체 레이아웃
- **Picker:** 테마/난이도 선택
- **ScrollView:** 카드 그리드 스크롤
- **LazyVGrid:** 카드 배치
- **HStack:** 스코어/리셋 버튼 하단 고정
- **Spacer:** 여백 추가

## 5. 이벤트 로그
- **카드 뒤집기:** card_flipped
- **매칭 성공:** card_matched
- **매칭 실패:** card_mismatched
- **게임 시작:** game_started
- **게임 종료:** game_ended
- **게임 리셋:** game_reset
