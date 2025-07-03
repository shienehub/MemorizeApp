---
layout: post
title: Entity Relationalshop Diagram
date: 2025-06-29 13:13
category: 
author: Shiene
tags: []
summary: 
---

# Entity Relationship Diagram (ERD)

## 1. 테이블/구조체

| 이름         | 설명                                  | 속성                                 |
|--------------|---------------------------------------|--------------------------------------|
| GameState    | 게임 상태                             | cards, score, isGameOver             |
| EventLog     | 이벤트 로그                           | event_id, event_type, properties, timestamp |
| Card         | 카드                                  | id, symbol, isFaceUp, isMatched      |

## 2. 관계
- **GameState**는 여러 **Card**를 가짐 (1:N)
- **GameViewModel**은 **GameState**와 **EventLog**를 관리
- **EventLog**는 이벤트별로 **properties**를 가짐

## 3. 예시
