---
layout: post
title: MemorizeApp Local Server Board&Blog Service Project Prereport
date: 2025-06-30 23:22
category: 
author: Shiene
tags: []
summary: 
---

# 메모라이즈앱 로컬서버 게시판 현황블로그 서비스 프로젝트 기획전 조사보고서

지금까지의 대화 내용을 바탕으로 **메모라이즈앱 로컬서버 기획전 조사보고서**를 작성했습니다. 이 보고서는 프로젝트의 기술적 근거와 선택 과정을 상세히 문서화한 전문적인 기획 자료입니다.

## 보고서 주요 내용

### 🎯 **프로젝트 개요**
- Swift iOS 메모라이즈 앱과 연동되는 로컬 서버 구축
- Mac Mini M1 + 1TB 외장 SSD 환경에서의 개발
- 동적 웹서비스 (게시판, 블로그, API) 제공

### 📊 **기술 분석 결과**

**Vapor 선정 이유**[1][2][3]:
- **성능 우위**: Express.js 대비 더 높은 요청 처리량과 낮은 레이턴시
- **Swift 생태계 통합**: iOS 앱과 동일 언어로 타입 안전성 확보
- **현대적 아키텍처**: async/await, SwiftNIO 기반 비동기 I/O

**Jekyll 대비 Vapor의 결정적 차이점**[4][5][6]:
- Jekyll: 정적 사이트 생성기, 동적 기능 제한, iOS 앱 연동 불가
- Vapor: 동적 웹서버, 완전한 데이터베이스 연동, REST API 지원

### 🏗️ **시스템 아키텍처**
```
iPhone 8 (메모라이즈 앱) → HTTP/JSON API → Vapor 서버 → 데이터베이스
```

### 💡 **핵심 기능 구현 계획**
1. **게임 데이터 저장**: 점수, 카드 뒤집기 횟수, 세션 ID
2. **REST API**: iOS 앱과의 실시간 데이터 통신[7][8]
3. **웹 인터페이스**: 게시판, 순위표, 관리자 페이지
4. **Fluent ORM**: 타입 안전한 데이터베이스 연동[9][10]

### 📈 **Mac Mini M1 서버 성능**[11][12]
- **전력 효율**: 유휴 시 9-19W 저전력 소비
- **처리 성능**: Intel i9 Mac 대비 30% 향상
- **네트워크**: 최대 17 Gbps 처리량
- **한계**: 메모리 확장 불가, Docker 파일 I/O 이슈

## 파일 구성

보고서는 다음과 같은 상세 섹션으로 구성되어 있습니다:

1. **로컬 호스팅 환경 분석**[13][14] - 하드웨어 요구사항 및 성능 분석
2. **서버 프레임워크 비교표** - Vapor vs Express vs Django vs PHP 비교
3. **Jekyll vs Vapor 상세 비교** - 정적 vs 동적 웹서버 차이점
4. **데이터 모델 설계** - User, GameSession, ScoreBoard 엔티티
5. **API 엔드포인트 설계** - RESTful API 구조
6. **단계별 개발 계획** - 5단계 구현 로드맵
7. **기술적 고려사항** - 성능, 보안, 확장성

이 보고서는 **기획 단계의 기술적 근거 자료**로 활용할 수 있으며, 개발 진행 시 참조 문서로 사용하실 수 있습니다. 모든 기술 선택의 근거와 대안 분석이 포함되어 있어 프로젝트의 방향성을 명확히 제시합니다.

Sources
[1] Vapor (web framework) - Wikipedia https://en.wikipedia.org/wiki/Vapor_(web_framework)
[2] ExpressJS vs Vapor | What are the differences? - StackShare https://stackshare.io/stackups/expressjs-vs-vapor
[3] Benchmarking Express vs Vapor - Joe Blau https://blog.joeblau.com/benchmarking-vapor-vs-express
[4] Jekyll vs Other Static Site Generators A Comparison - MoldStud https://moldstud.com/articles/p-jekyll-vs-other-static-site-generators-a-comparison
[5] Limits to Blogging Using Jekyll - Hani Sarji https://hanisarji.com/zine-hs/2020/09/28/jekyll-blog-limits/
[6] About GitHub Pages and Jekyll https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll/about-github-pages-and-jekyll
[7] Build a Web Service with Vapor - Swift.org https://swift.org/getting-started/vapor-web-server/
[8] Building Modern REST APIs with Vapor and Fluent in Swift - Radu Dan https://www.radude89.com/blog/vapor.html
[9] Fluent → Overview - Vapor Docs https://docs.vapor.codes/fluent/overview/
[10] Getting Started with Fluent - Vapor Docs https://legacy.docs.vapor.codes/3.0/fluent/getting-started/
[11] Tech Info 192: Apple M1 Mac mini testing for server use - HELIOS https://www.helios.de/viewart-fr.html?id=1869
[12] M1 Mac mini as server : r/selfhosted - Reddit https://www.reddit.com/r/selfhosted/comments/15qf89z/m1_mac_mini_as_server/
[13] How to Create Your Own Server at Home for Web Hosting https://host4geeks.com/blog/how-to-create-your-own-server-at-home-for-web-hosting/
[14] Local Hosting: How to Host a Website on a Local Server - Vodien https://www.vodien.com/learn/local-hosting-how-to-host-a-website-on-a-local-server/
[15] Getting Started → Hello, world - Vapor Docs https://docs.vapor.codes/getting-started/hello-world/
[16] Server-Side Swift with Vapor, Chapter 1: Introduction - Kodeco https://www.kodeco.com/books/server-side-swift-with-vapor/v3.0/chapters/1-introduction
[17] Basics → Environment - Vapor Docs https://docs.vapor.codes/basics/environment/
[18] Vapor https://vapor.codes
[19] Node.js vs Vapor | What are the differences? - StackShare https://stackshare.io/stackups/nodejs-vs-vapor
[20] Setting up a GitHub Pages site with Jekyll https://docs.github.com/en/pages/setting-up-a-github-pages-site-with-jekyll
[21] Jekyll vs. Hyde - A Comparison Of Two Static Site Generators https://philipm.at/2011/jekyll_vs_hyde.html
[22] Is a static site gen right for me? - Help - Jekyll Talk https://talk.jekyllrb.com/t/is-a-static-site-gen-right-for-me/476
[23] Framework comparison - Jekyll vs Gatsby vs Astro vs Zola : r/webdev https://www.reddit.com/r/webdev/comments/1iks8j5/framework_comparison_jekyll_vs_gatsby_vs_astro_vs/
[24] Bypassing GitHub's Jekyll limitations - nicolabs https://www.nicolabs.net/2020/Bypassing-GitHub-Jekyll-limitations
[25] Illustrated guide to build a tiny Homelab - GitHub https://github.com/h8pewou/homelab
[26] Hardware requirements for home server : r/homelab - Reddit https://www.reddit.com/r/homelab/comments/15qyqhe/hardware_requirements_for_home_server/
[27] How to get started building a Homelab server in 2025 - Joe Karlsson https://www.joekarlsson.com/2023/09/how-to-get-started-building-a-homelab-server-in-2024/
[28] I Tried Using my M1 Mac as a Server (It did not go well) - YouTube https://www.youtube.com/watch?v=y2CpEEjrG3Q
[29] Deployments - Laravel Vapor docs https://docs.vapor.build/projects/deployments
[30] Deep Dive Guide into Setup and Deployment for Heroku and Ubuntu https://brightdigit.com/tutorials/vapor-heroku-ubuntu-setup-deploy
[31] [Vapor/Server] Fluent란? - 성일노트 - 티스토리 https://yeoseongil.tistory.com/91
[32] Build APIs with Swift and Vapor with Tim Condon - YouTube https://www.youtube.com/watch?v=8R4csUq1u6A
[33] Vapor: Setup, Installation and Introduction - Server Side Swift https://www.youtube.com/watch?v=QCiIlp7okKE
[34] Swift and Vapor: Server-Side Solutions - Alibaba Cloud https://www.alibabacloud.com/tech-news/a/swift/4ooqsae0dig-swift-and-vapor-server-side-solutions
[35] Questions about Jekyll and GitHub Pages (folder structure and other ... https://talk.jekyllrb.com/t/questions-about-jekyll-and-github-pages-folder-structure-and-other-questions/6850
[36] Hugo vs. Jekyll: Which is Right for Your Blog? - Draft.dev https://draft.dev/learn/hugo-vs-jekyll
[37] Home Lab Setup for Beginners - Everything You Need To Get Started https://www.youtube.com/watch?v=RqZSwEDXg_A
[38] Server Minimum Requirements https://docs.oracle.com/cd/E28385_01/en/E28377/html/STA102_Planning_Install_PreInst.5.5.htm
[39] Deploy → DigitalOcean - Vapor Docs https://docs.vapor.codes/deploy/digital-ocean/
[40] [Vapor] Swift로 서버 만들기 04 - Fluent 설치 및 개념 (Models, Field ... https://malchafrappuccino.tistory.com/153
