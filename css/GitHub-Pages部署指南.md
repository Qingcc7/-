# GitHub Pages 部署详细指南

本指南将一步步教您如何使用 GitHub Pages 创建可分享的链接。

## 前提条件

- 一个 GitHub 账号（如果没有，访问 https://github.com 注册）
- 您的网站文件（已经在 `front` 文件夹中）

---

## 步骤1：创建 GitHub 仓库

1. **登录 GitHub**
   - 访问 https://github.com
   - 登录您的账号

2. **创建新仓库**
   - 点击右上角的 "+" 号
   - 选择 "New repository"

3. **填写仓库信息**
   - **Repository name**（仓库名）：`climbing-community`（或任意名称）
   - **Description**（描述）：可选，如 "攀岩社区网站"
   - **Visibility**（可见性）：选择 **Public**（公开）
   - **不要**勾选 "Add a README file"
   - 点击绿色的 **"Create repository"** 按钮

---

## 步骤2：上传文件到 GitHub

### 方法A：使用网页上传（最简单，推荐）

1. **进入刚创建的仓库**
   - 您会看到一个快速设置页面

2. **上传文件**
   - 点击 "uploading an existing file" 链接
   - 或直接访问：`https://github.com/你的用户名/climbing-community/upload`

3. **拖拽文件**
   - 打开您的 `front` 文件夹
   - **重要**：不要拖拽整个文件夹，而是拖拽文件夹**里面的所有文件**
   - 需要拖拽的文件包括：
     - `index.html`
     - `gyms.html`
     - `courses.html`
     - `social.html`
     - 等等所有 HTML 文件
     - `css` 文件夹（整个文件夹）
     - `js` 文件夹（整个文件夹）
     - 其他所有文件

4. **提交文件**
   - 在页面底部填写：
     - **Commit message**：`Initial commit` 或 `添加网站文件`
   - 点击绿色的 **"Commit changes"** 按钮

### 方法B：使用 Git 命令行（适合有 Git 经验的用户）

1. **打开终端**
   - 在 macOS 上打开 "终端" 应用

2. **进入项目文件夹**
   ```bash
   cd /Users/chenqing/Desktop/1227/front
   ```

3. **初始化 Git 仓库**
   ```bash
   git init
   ```

4. **添加所有文件**
   ```bash
   git add .
   ```

5. **提交文件**
   ```bash
   git commit -m "Initial commit"
   ```

6. **连接到 GitHub 仓库**
   ```bash
   git branch -M main
   git remote add origin https://github.com/你的用户名/climbing-community.git
   git push -u origin main
   ```
   
   **注意**：将 `你的用户名` 替换为您的 GitHub 用户名

---

## 步骤3：启用 GitHub Pages

1. **进入仓库设置**
   - 在仓库页面，点击顶部的 **"Settings"**（设置）标签

2. **找到 Pages 设置**
   - 在左侧菜单中，向下滚动找到 **"Pages"** 选项
   - 点击进入

3. **配置 Pages**
   - 在 **"Source"**（来源）部分：
     - 选择 **"Deploy from a branch"**
   - 在 **"Branch"**（分支）下拉菜单：
     - 选择 **"main"**（或 "master"）
   - 在 **"Folder"**（文件夹）下拉菜单：
     - 选择 **"/ (root)"**
   - 点击 **"Save"**（保存）按钮

4. **等待部署**
   - GitHub 需要几分钟时间来部署您的网站
   - 页面会显示：`Your site is live at https://你的用户名.github.io/climbing-community/`

---

## 步骤4：访问您的网站

1. **获取链接**
   - 在 Settings → Pages 页面
   - 您会看到绿色的提示，显示您的网站地址
   - 格式：`https://你的用户名.github.io/climbing-community/`

2. **访问网站**
   - 复制这个链接
   - 在浏览器中打开
   - 如果显示 "404 Not Found"，请等待几分钟后重试

3. **分享链接**
   - 这个链接可以分享给任何人
   - 他们可以在任何设备上访问您的网站

---

## 常见问题

### Q1: 上传后显示 404 错误？
**A:** 等待 5-10 分钟，GitHub Pages 需要时间部署。如果还是不行，检查：
- 确保 `index.html` 文件在根目录
- 确保文件路径正确

### Q2: 样式或图片不显示？
**A:** 检查文件路径：
- CSS 文件路径应该是：`css/style.css`（相对路径）
- JS 文件路径应该是：`js/api.js`（相对路径）
- 确保所有文件都已上传

### Q3: 如何更新网站？
**A:** 
- 方法A：在 GitHub 网页上编辑文件并提交
- 方法B：使用 Git 命令行：
  ```bash
  git add .
  git commit -m "更新内容"
  git push
  ```

### Q4: 可以自定义域名吗？
**A:** 可以！在 Settings → Pages 的 "Custom domain" 部分添加您的域名。

---

## 快速检查清单

- [ ] 创建了 GitHub 账号
- [ ] 创建了新仓库（Public）
- [ ] 上传了所有文件（包括 css 和 js 文件夹）
- [ ] 启用了 GitHub Pages
- [ ] 选择了 main 分支和 / (root) 文件夹
- [ ] 等待了几分钟让网站部署
- [ ] 访问了网站链接确认正常

---

## 完成！

一旦部署完成，您就有了一个永久可分享的链接：
```
https://你的用户名.github.io/climbing-community/
```

这个链接：
- ✅ 永久免费
- ✅ 可以分享给任何人
- ✅ 在任何设备上都能访问
- ✅ 自动使用 HTTPS（安全）

---

## 需要帮助？

如果遇到任何问题，请告诉我：
1. 您在哪一步遇到了问题？
2. 看到了什么错误信息？

我会帮您解决！

