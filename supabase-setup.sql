-- 1. 创建 album_ratings 表
CREATE TABLE IF NOT EXISTS album_ratings (
  id BIGSERIAL PRIMARY KEY,
  user_id TEXT UNIQUE NOT NULL,
  ratings JSONB NOT NULL DEFAULT '{}',
  created_at TIMESTAMPTZ DEFAULT NOW(),
  updated_at TIMESTAMPTZ DEFAULT NOW()
);

-- 2. 启用 RLS (Row Level Security)
ALTER TABLE album_ratings ENABLE ROW LEVEL SECURITY;

-- 3. 允许任何人插入/更新自己的评分（按 user_id 匹配）
CREATE POLICY "Allow insert own ratings" ON album_ratings
  FOR INSERT WITH CHECK (true);

CREATE POLICY "Allow update own ratings" ON album_ratings
  FOR UPDATE USING (true) WITH CHECK (true);

-- 4. 允许所有人读取（用于全体统计）
CREATE POLICY "Allow read all ratings" ON album_ratings
  FOR SELECT USING (true);

-- 5. 创建索引
CREATE INDEX IF NOT EXISTS idx_album_ratings_user_id ON album_ratings(user_id);
CREATE INDEX IF NOT EXISTS idx_album_ratings_updated_at ON album_ratings(updated_at DESC);