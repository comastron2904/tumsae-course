# 틈새연수 신청 시스템

Supabase + Vercel 기반 수강신청 사이트입니다.

---

## 배포 순서

### 1단계 — Supabase 설정

1. [supabase.com](https://supabase.com) 접속 → **New Project** 생성
2. 프로젝트 생성 후 **SQL Editor** 탭 클릭
3. `supabase_schema.sql` 파일 내용을 복사해서 실행 (▶ Run)
4. **Settings → API** 탭에서 아래 두 값을 복사해둡니다:
   - `Project URL` → `SUPABASE_URL`
   - `anon public` key → `SUPABASE_ANON_KEY`

---

### 2단계 — GitHub 업로드

```bash
# 이 폴더에서 실행
git init
git add .
git commit -m "초기 커밋: 틈새연수 신청 시스템"

# GitHub에서 새 Repository 만든 후:
git remote add origin https://github.com/YOUR_ID/tumsae-course.git
git branch -M main
git push -u origin main
```

---

### 3단계 — Vercel 배포

1. [vercel.com](https://vercel.com) 접속 → GitHub 로그인
2. **Add New → Project** → GitHub 저장소 선택
3. **Environment Variables** 섹션에서 아래 두 변수 추가:

   | 이름 | 값 |
   |------|-----|
   | `SUPABASE_URL` | Supabase Project URL |
   | `SUPABASE_ANON_KEY` | Supabase anon public key |

4. **Deploy** 클릭 → 완료되면 사이트 링크 생성됨 🎉

---

## 파일 구조

```
tumsae-course/
├── api/
│   └── inject.js          # 환경변수 주입 서버리스 함수
├── public/
│   └── index.html         # 메인 사이트 (Supabase 연동)
├── supabase_schema.sql    # DB 테이블 생성 SQL
├── vercel.json            # Vercel 라우팅 설정
├── package.json
└── .gitignore
```

---

## 주요 기능

- 강의 추가 / 수정 / 삭제 (강사 비밀번호 보호)
- 수강신청 (이름 기반, 중복 방지)
- 수강신청 시작 시간 카운트다운
- 정원 초과 시 자동 마감
- 실시간 DB 저장 (Supabase)
