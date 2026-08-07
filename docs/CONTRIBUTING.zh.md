# 贡献指南

## 多智能体工作流

本项目使用 **Orca 智能体开发环境（ADE）** 进行并行开发。

### 开始一个新功能

1. **在 Orca 中创建工作树**：
   ```
   /orchestrate feature/user-auth
   ```

2. **为工作树分配智能体**：
   - 智能体获得代码库的隔离副本
   - 它独立工作，不会影响 `main` 分支

3. **在工作树中开发和测试**

4. **准备好后创建拉取请求**：
   ```
   /pr create --title "feat: user authentication"
   ```

### 智能体职责

| 智能体前缀 | 范围 |
|-----------|------|
| `gitx-core` | Git 操作、存储、协议实现 |
| `gitx-api` | 后端 API、数据库 schema、业务逻辑 |
| `gitx-web` | 前端、UI/UX、客户端状态管理 |
| `gitx-ops` | 基础设施、Docker、CI/CD、文档 |

### 提交规范

我们遵循 [Conventional Commits](https://www.conventionalcommits.org/)：

```
feat: 添加 OAuth2 登录支持
fix: 修复 PR 合并逻辑中的竞态条件
docs: 更新 API 端点文档
refactor: 简化仓库权限检查
test: 为 git push 钩子添加集成测试
chore: 更新依赖版本
```

### 代码风格

- **Go**: `gofmt`、`golint`、`go vet`
- **TypeScript**: ESLint + Prettier
- **文档**: 美式英语，清晰简洁
