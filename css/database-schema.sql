-- PostgreSQL 数据库结构设计
-- 攀岩社区网站数据库

-- 岩馆表
CREATE TABLE gyms (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    location VARCHAR(255) NOT NULL,
    address TEXT,
    facilities TEXT[], -- 设施数组
    hours VARCHAR(255), -- 营业时间
    price_info TEXT, -- 价格信息
    rating DECIMAL(3,2) DEFAULT 0, -- 评分
    review_count INTEGER DEFAULT 0, -- 评价数量
    latitude DECIMAL(10,8), -- 纬度
    longitude DECIMAL(11,8), -- 经度
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 岩馆评价表
CREATE TABLE gym_reviews (
    id SERIAL PRIMARY KEY,
    gym_id INTEGER REFERENCES gyms(id) ON DELETE CASCADE,
    user_name VARCHAR(100), -- 由于不需要登录，使用用户名
    rating INTEGER CHECK (rating >= 1 AND rating <= 5),
    review_text TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 课程表
CREATE TABLE courses (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    level VARCHAR(50) NOT NULL, -- 初级、中级、高级
    instructor_id INTEGER REFERENCES instructors(id),
    duration VARCHAR(100), -- 课程时长
    price VARCHAR(100),
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 教练表
CREATE TABLE instructors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    gender VARCHAR(10), -- 男、女
    experience VARCHAR(100), -- 经验年限
    rating DECIMAL(3,2) DEFAULT 0,
    bio TEXT, -- 简介
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 活动表
CREATE TABLE events (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    type VARCHAR(50), -- 比赛、训练营、社交聚会、女性专属等
    date DATE,
    location VARCHAR(255),
    description TEXT,
    registration_info TEXT, -- 报名信息
    is_women_only BOOLEAN DEFAULT FALSE, -- 是否女性专属
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 社区帖子表
CREATE TABLE posts (
    id SERIAL PRIMARY KEY,
    type VARCHAR(50), -- activity, experience, tip
    title VARCHAR(255) NOT NULL,
    content TEXT NOT NULL,
    author_name VARCHAR(100), -- 由于不需要登录，使用用户名
    location VARCHAR(255),
    event_date DATE,
    likes INTEGER DEFAULT 0,
    comments_count INTEGER DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 用户进度表（使用localStorage，但也可以存储在数据库中）
CREATE TABLE user_progress (
    id SERIAL PRIMARY KEY,
    user_identifier VARCHAR(255), -- 可以是设备ID或其他标识
    route_name VARCHAR(255),
    route_level VARCHAR(50), -- V0, V1, V2等
    completion_date DATE,
    climbing_hours DECIMAL(5,2),
    notes TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 用户目标表
CREATE TABLE user_goals (
    id SERIAL PRIMARY KEY,
    user_identifier VARCHAR(255),
    description TEXT NOT NULL,
    target_date DATE,
    completed BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 装备表
CREATE TABLE equipment (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    category VARCHAR(50), -- shoes, harness, chalk, rope, other
    price VARCHAR(100),
    description TEXT,
    features TEXT[], -- 特点数组
    purchase_link TEXT,
    image_url TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 新闻表
CREATE TABLE news (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    category VARCHAR(50), -- news, story, event
    content TEXT,
    excerpt TEXT,
    image_url TEXT,
    published_date DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 安全知识/文章表
CREATE TABLE articles (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    category VARCHAR(50), -- safety, technique, mental, confidence
    content TEXT,
    description TEXT,
    type VARCHAR(50), -- article, video
    video_url TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 创建索引以提高查询性能
CREATE INDEX idx_gyms_location ON gyms(location);
CREATE INDEX idx_gyms_rating ON gyms(rating);
CREATE INDEX idx_gym_reviews_gym_id ON gym_reviews(gym_id);
CREATE INDEX idx_courses_level ON courses(level);
CREATE INDEX idx_instructors_gender ON instructors(gender);
CREATE INDEX idx_events_type ON events(type);
CREATE INDEX idx_events_date ON events(date);
CREATE INDEX idx_events_women_only ON events(is_women_only);
CREATE INDEX idx_posts_type ON posts(type);
CREATE INDEX idx_posts_created_at ON posts(created_at);
CREATE INDEX idx_news_category ON news(category);
CREATE INDEX idx_articles_category ON articles(category);

-- 插入示例数据（可选）
INSERT INTO gyms (name, location, facilities, hours, price_info, rating, review_count) VALUES
('巅峰攀岩馆', '北京市朝阳区', ARRAY['更衣室', '淋浴', '咖啡厅', '装备租赁', '停车场'], '周一至周日 10:00-22:00', '单次票：80元，月卡：500元', 4.8, 156),
('岩壁攀岩俱乐部', '上海市徐汇区', ARRAY['更衣室', '淋浴', '休息区', '装备店', 'WiFi'], '周一至周五 14:00-22:00，周末 10:00-22:00', '单次票：90元，月卡：600元', 4.6, 203),
('极限攀岩中心', '广州市天河区', ARRAY['更衣室', '淋浴', '餐厅', '装备租赁', '停车场', '儿童区'], '周一至周日 9:00-21:00', '单次票：75元，月卡：450元', 4.7, 189);

INSERT INTO instructors (name, gender, experience, rating) VALUES
('张教练', '女', '5年', 4.9),
('李教练', '女', '8年', 4.8),
('王教练', '男', '10年', 4.9);

INSERT INTO courses (title, level, instructor_id, duration, price, description) VALUES
('初级攀岩入门', '初级', 1, '8周', '1200元', '适合零基础学员，学习基本攀岩技巧和安全知识'),
('中级攀岩提升', '中级', 2, '10周', '1500元', '提升攀岩技巧，学习更复杂的路线'),
('高级攀岩训练', '高级', 3, '12周', '2000元', '专业训练，备战比赛');

