# Gitx

> Gitx - 一个轻量级的、可自托管的代码仓库平台，灵感来源于 GitHub。  
> Gitx 是一个 AI 原生 Code Repository ！对于每个人来说，Gitx 都是完全开源且免费的！
> 采用现代架构和多智能体开发工作流构建。

[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

## 愿景

Gitx 是一个**简单、快速、可自托管**的 GitHub 替代方案，面向希望完全掌控源代码的团队。它专注于把核心功能做到极致：

- Git 仓库托管（创建、克隆、推送、拉取）
- 拉取请求与代码审查
- 问题追踪
- 团队协作
- 细粒度访问控制

## 架构（多智能体开发）

本项目使用 **Orca 智能体开发环境（ADE）** 进行并行多智能体工作流开发：

| 智能体 | 职责 | 工作树 |
|-------|------|--------|
| `gitx-core` | Git 后端、仓库存储、SSH/HTTP Git 协议 | `worktrees/core` |
| `gitx-api` | RESTful API、认证、业务逻辑 | `worktrees/api` |
| `gitx-web` | 前端 UI、React 单页应用、实时更新 | `worktrees/web` |
| `gitx-ops` | DevOps、CI/CD 流水线、Docker、部署 | `worktrees/ops` |

## 技术栈

| 层级 | 技术 |
|------|------|
| **后端** | Go（Gin 或 Echo）或 Rust（Axum 或 Actix） |
| **前端** | React 19 + TypeScript + Vite |
| **数据库** | PostgreSQL 16+ |
| **缓存** | Redis |
| **Git 存储** | 裸 Git 仓库 + libgit2 |
| **容器** | Docker + Docker Compose |

## 项目结构

```
gitx/
├── README.md               # 本文件（英文）
├── README.zh.md            # 中文翻译版
├── LICENSE                 # MIT 许可证
├── .gitignore              # 忽略规则
├── Makefile                # 常用开发任务
├── docker-compose.yml      # 本地开发环境栈
├── docs/                   # 文档
│   ├── ARCHITECTURE.md
│   ├── ARCHITECTURE.zh.md
│   ├── CONTRIBUTING.md
│   ├── CONTRIBUTING.zh.md
│   └── ADRs/               # 架构决策记录
├── .github/workflows/      # CI/CD 流水线
├── scripts/                # 工具脚本
└── src/                    # 源代码
    ├── backend/            # API 服务器和 Git 协议处理器
    ├── frontend/           # Web UI
    ├── cli/                # 命令行工具
    └── shared/             # 共享类型和 protobuf 定义
```

## 快速开始（本地开发）

```bash
# 1. 克隆仓库
git clone https://github.com/YOUR_USERNAME/gitx.git
cd gitx

# 2. 启动依赖（Postgres、Redis）
docker-compose up -d db redis

# 3. 运行后端
cd src/backend
go run .

# 4. 运行前端（在另一个终端）
cd src/frontend
npm install
npm run dev
```

## 贡献指南

我们使用 **Orca 多智能体工作流** 进行开发。每个主要功能由专属智能体在其隔离的工作树中构建，然后通过拉取请求合并。

详见 [docs/CONTRIBUTING.zh.md](docs/CONTRIBUTING.zh.md)。

## 许可证

[MIT](LICENSE) -- 个人和商业使用均免费。
