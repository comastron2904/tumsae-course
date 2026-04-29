-- 틈새연수 신청 시스템 DB 스키마
-- Supabase SQL Editor에서 실행하세요

-- 강의 테이블
CREATE TABLE IF NOT EXISTS courses (
  id          BIGSERIAL PRIMARY KEY,
  name        TEXT NOT NULL,
  description TEXT NOT NULL,
  max_limit   INTEGER NOT NULL CHECK (max_limit > 0),
  open_date   DATE NOT NULL,
  open_time   TIME NOT NULL,
  lecture_date DATE NOT NULL,
  lecture_time TIME NOT NULL,
  pass_hash   TEXT NOT NULL,
  created_at  TIMESTAMPTZ DEFAULT NOW()
);

-- 수강신청자 테이블
CREATE TABLE IF NOT EXISTS registrants (
  id          BIGSERIAL PRIMARY KEY,
  course_id   BIGINT NOT NULL REFERENCES courses(id) ON DELETE CASCADE,
  name        TEXT NOT NULL,
  applied_at  TIMESTAMPTZ DEFAULT NOW()
);

-- 인덱스
CREATE INDEX IF NOT EXISTS registrants_course_id_idx ON registrants(course_id);

-- RLS(Row Level Security) 설정
ALTER TABLE courses ENABLE ROW LEVEL SECURITY;
ALTER TABLE registrants ENABLE ROW LEVEL SECURITY;

-- 모든 사람이 읽을 수 있음 (공개 신청 사이트)
CREATE POLICY "courses_select" ON courses FOR SELECT USING (true);
CREATE POLICY "courses_insert" ON courses FOR INSERT WITH CHECK (true);
CREATE POLICY "courses_update" ON courses FOR UPDATE USING (true);
CREATE POLICY "courses_delete" ON courses FOR DELETE USING (true);

CREATE POLICY "registrants_select" ON registrants FOR SELECT USING (true);
CREATE POLICY "registrants_insert" ON registrants FOR INSERT WITH CHECK (true);
CREATE POLICY "registrants_delete" ON registrants FOR DELETE USING (true);
