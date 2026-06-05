# Taylor Swift 专辑评分排名 🎵

一个交互式网页，可以为 Taylor Swift 的 16 张专辑（含 4 张重录版）逐首打分，生成个人排名 & 全体统计。

## 使用流程

1. 打开 `index.html`
2. 在评分区为每首歌打分（1-10 颗星）
3. 点击 **"📋 填表完成，查看结果"**
4. 系统显示三部分：
   - 📊 你的个人专辑排名（含 FLIP 切换动画）
   - 📊 你的折线图（平均分 + 方差）
   - 🌍 全体统计（所有用户的汇总排名 + 柱状图）

## ⚙️ 部署步骤（让全世界都能用）

### 第一步：配置 Supabase 数据库

1. 打开 [supabase.com/dashboard](https://supabase.com/dashboard) 登录
2. 进入你的项目（`tbyzwckixsfbeifmxjwr`）
3. 点击左侧 **SQL Editor** → **New query**
4. 复制 `supabase-setup.sql` 的全部内容，粘贴进去
5. 点击右下角 **Run**（绿色按钮）
6. 看到 "Success" 即完成

### 第二步：部署网站到 GitHub Pages

1. 在 GitHub 创建新仓库，比如 `ts-album-ranker`
2. 将整个 `ts-album-ranker` 文件夹推送到仓库：

```bash
cd C:\Users\dei23\Desktop\ts-album-ranker
git init
git add .
git commit -m "Taylor Swift Album Ranker"
git branch -M main
git remote add origin https://github.com/你的用户名/ts-album-ranker.git
git push -u origin main
```

3. 在 GitHub 仓库页面，点击 **Settings** → **Pages**
4. Source 选择 **Deploy from a branch**，Branch 选 **main**，文件夹选 **/ (root)**
5. 点击 **Save**
6. 等 1-2 分钟后访问 `https://你的用户名.github.io/ts-album-ranker`

### 第三步：补充专辑封面

以下封面图片需要放入 `images/` 目录（Wikipedia 封了脚本下载，需手动浏览器打开保存）：

| 文件 | Wikipedia URL |
|------|--------------|
| `fearless_2008.jpg` | https://en.wikipedia.org/wiki/File:Taylor_Swift_-_Fearless.png |
| `speak_now_2010.jpg` | https://en.wikipedia.org/wiki/File:Taylor_Swift_-_Speak_Now_cover.png |
| `reputation_2017.jpg` | https://en.wikipedia.org/wiki/File:Taylor_Swift_-_Reputation.png |
| `folklore_2020.jpg` | https://en.wikipedia.org/wiki/File:Taylor_Swift_-_Folklore.png |
| `midnights_2022.jpg` | https://en.wikipedia.org/wiki/File:Midnights_-_Taylor_Swift.png |
| `red_tv_2021.jpg` | https://en.wikipedia.org/wiki/File:Taylor_Swift_-_Red_(Taylor%27s_Version).png |
| `speak_now_tv_2023.jpg` | https://en.wikipedia.org/wiki/File:Speak_Now_(Taylor%27s_Version).png |
| `1989_tv_2023.jpg` | https://en.wikipedia.org/wiki/File:1989_(Taylor%27s_Version).png |

已有封面：`taylor_swift_2006.jpg`, `1989_2014.jpg`, `red_2012.jpg`, `lover_2019.jpg`, `evermore_2020.jpg`, `fearless_tv_2021.jpg`, `showgirl_2025.jpg`, `ttpd_2024.jpg`

## ⚠️ 重要

- 评分数据通过本地 localStorage 保存，提交时上传到 Supabase（匿名）
- Supabase 免费额度：500MB 数据库 + 每月 2GB 传输，足够数十万条评分
- GitHub Pages 免费且无限流量