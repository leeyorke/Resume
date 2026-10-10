#import "template.typ": *

// 主题颜色
#let themeColor = rgb(20, 69, 148)

// 设置简历选项与页眉
#show: resume.with(
  // 字体基准大小
  size: 10pt,
  // 主题色 (链接 / 标识 / 页脚)
  themeColor: themeColor,
  // 右上角灰色块颜色
  bannerColor: rgb(193, 193, 193),
  // 控制纸张的边距
  marginTop: 1.1cm,
  marginBottom: 1.5cm,
  marginLeft: 1.27cm,
  marginRight: 1.27cm,

  // ---- 页眉左侧标识 ----
  // brand: "简历",
  // brandIcon: "icons/fa-user.svg",
  // 若希望标识可点击, 取消下一行注释
  // brandLink: "https://github.com/zhangwei-example",

  // ---- 页眉右上角: 灰色色块 (可换成图片) 与日期 ----
  // 若不需要色块, 把 bannerHeight 设为 0em 即可
  // 灰色块内的文字 (不需要则删掉此行)
  bannerText: "测试开发工程师",
  bannerWidth: 100%,
  bannerHeight: 2.6em,
  // date: "2025 年 11 月",

  // ---- 大标题与副标题 ----
  title: "张伟",
  titleSize: 4em,
  titleTracking: 0.08em,
  subtitle: "测试开发工程师",
  subtitleSize: 1.05em,
  subtitleTracking: 0.14em,

  // ---- 标题下方的粗分隔线 ----
  ruleWidth: 100%,
  ruleThickness: 2.5pt,

  // ---- 正文分栏 ----
  columnCount: 2,
  gutter: 0.6cm,

  // ---- 页脚 ----
  // footer: "张伟",

  // ---- 姓名右侧的联系信息 ----
  headerInfo: info(
    color: themeColor,
    alignment: left,
    size: 1em,
    (
      icon: faPhone,
      content: "(+86) 138-0000-0000"
    ),
    (
      icon: faEnvelope,
      content: "zhangwei@example.com",
      link: "mailto:zhangwei@example.com"
    ),
    (
      icon: faGithub,
      content: "github.com/zhangwei-example",
      link: "https://github.com/zhangwei-example",
    ),
    (
      icon: faBuildingColumns,
      content: "江州大学",
    ),
    (
      icon: faBirth,
      content: "20 岁",
    ),
    (
      icon: faUser,
      content: "男",
    ),
    (
      icon: faLocal,
      content: "广东 • 深圳",
    ),
  ),
)

// ---- 导语: 一段话概括个人定位 ----
=== 个人简介

- *具备良好的用例设计能力*，能根据需求文档快速拆解需求，提炼测试点，输出测试用例文档；
- 擅长 Python，具备测试框架、命令行工具、FastApi 接口及其他效能工具开发能力；
- 熟悉 Linux 、docker，熟练编写 Shell 脚本将各类环境部署流水线化；
- 熟悉典型关系型数据库，诸如 MySQL、PostgreSQL，掌握常用的增删改查语句、内建函数、连接
- 询；
- 自学能力强，平时会将学习过程记录成个人笔记，收录到个人知识库；
- 喜欢直面挑战性的工作，从过程中积累经验、技术及成就感；
- 愿意主动承担任务，乐观面对难题。

=== 教育背景

#item(
  [ *江州大学* ],
  [ 软件工程学院 · 软件工程专业 ],
  date[ 2020.07 毕业 ]
)

=== 专业技能

- 熟悉 Linux 操作系统, 具备 Shell 脚本编写与自动化部署能力;
- 熟悉 Python、C, 能独立完成测试框架、命令行工具及 FastAPI 接口的开发;
- 熟悉 JMeter、Postman、Requests、Pytest、Selenium 等测试工具链;
- 具备用例设计能力, 能根据需求文档快速拆解需求、提炼测试点并输出用例文档.

=== 工作经历

#item(
  [ *星航半导体有限公司* ],
  [ 研发部 / 测试开发工程师 ],
  date[ 2023.05 – 2025.09 ]
)

#tech[ 半导体 · 功能测试 · SDK 开发 ]

- 负责芯片的功能测试与图像质量测试, 搭建自动化测试流程;
- 编写并维护测试代码, 参与芯片配套 SDK 的开发与迭代;
- 沉淀测试工具与脚本, 提升回归测试的覆盖率与执行效率.

#item(
  [ *云联科技有限公司* ],
  [ 研发部 / 测试开发工程师 ],
  date[ 2021.10 – 2023.05 ]
)

#tech[ 接口测试 · 测试框架 · 效能工具 ]

- 负责所有产品线的功能测试及接口测试;
- 维护日常迭代测试脚本, 持续维护并升级测试框架;
- 编写测试效能工具, 减少重复人工操作.

#item(
  [ *华讯数据技术有限公司* ],
  [ 研发部 / 测试开发工程师 ],
  date[ 2020.08 – 2021.09 ]
)

#tech[ 接口测试 · 测试框架 · 效能工具 ]

- 负责所有产品线的功能测试及接口测试;
- 维护日常迭代测试脚本, 维护测试框架;
- 编写测试效能工具.

=== 项目经历

#item(
  link(
    "https://github.com/example/latex-sympy-calculator",
    [ *Python* ]
  ),
  [ *个人项目* ],
  date[ 2021.02 – 2021.04 ]
)

#tech[ NodeJS, Python, VS Code ]

一个用于在 VS Code 中使用 LaTeX 数学公式进行「科学计算」的插件

- 使用 ANTLR 将 LaTeX 语句编译为 Sympy 语句
- 通过 Flask 搭建本地 HTTP 服务器与 VS Code 插件进行通信
- 支持积分求导、矩阵计算、无穷级数计算等多种科学计算

#item(
  link(
    "https://github.com/example/reversi",
    [ *黑白棋 Reversi* ]
  ),
  [ *课程项目* ],
  date[ 2021.02 – 2021.04 ]
)

#tech[ React, Python, AI ]

基于 React 与 Antd 的黑白棋前端, 与基于 Python 的黑白棋 AI 后端

- 使用基于评估函数的 BFS 实现黑白棋 AI, 并加入 Alpha-Beta 剪枝
- 基于 React 搭建黑白棋平台前端, 支持玩家对战、人机对战与 AI 对战
- 在后端使用 Flask 及 Socket.io, 实现玩家之间的联机对战
