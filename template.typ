// ============================================================
//  报刊 / 杂志风格中文简历模板 (两栏排版)
//
//  版式参考: 编辑设计风格的文档排版
//    · 页眉左上角为标识, 右上角为浅灰色块, 色块下方为右对齐的日期
//    · 中部为超大无衬线粗体标题 + 小字号字距拉开的副标题
//    · 标题下方一条加粗的黑色通栏分隔线
//    · 导语之后, 正文为三栏排版的衬线字体, 栏目标题为无衬线粗体
//    · 页脚为一条细分隔线 + 居中显示的名称与页码
// ============================================================

// 字体
#let font = (
  // 无衬线: 用于姓名/大标题/栏目标题
  sans: (
    "Microsoft YaHei UI",
    "Microsoft YaHei",
  ),
  // 衬线: 用于正文
  serif: (
    "LXGW WenKai",
  ),
)

// 图标
#let icon(path) = box(
  baseline: 0.125em,
  height: 1.0em,
  width: 1.25em,
  align(center + horizon, image(path))
)

#let faAngleRight = icon("icons/fa-angle-right.svg")
#let faAward = icon("icons/fa-award.svg")
#let faBuildingColumns = icon("icons/fa-building-columns.svg")
#let faCode = icon("icons/fa-code.svg")
#let faEnvelope = icon("icons/fa-envelope.svg")
#let faGithub = icon("icons/fa-github.svg")
#let faGraduationCap = icon("icons/fa-graduation-cap.svg")
#let faLinux = icon("icons/fa-linux.svg")
#let faPhone = icon("icons/fa-phone.svg")
#let faWindows = icon("icons/fa-windows.svg")
#let faWrench = icon("icons/fa-wrench.svg")
#let faWork = icon("icons/fa-work.svg")
#let faUser = icon("icons/fa-user.svg")
#let faBirth = icon("icons/fa-birth.svg")
#let faLocal = icon("icons/fa-location.svg")


// 主体
#let resume(
  // 正文字号
  size: 9pt,
  // 主题色 (链接/页脚)
  themeColor: rgb("#204072"),
  // 右上角灰色块颜色
  bannerColor: rgb(193, 193, 193),
  // 粗分隔线颜色
  ruleColor: black,
  // 页边距
  marginTop: 1.1cm,
  marginBottom: 1.5cm,
  marginLeft: 1.27cm,
  marginRight: 1.27cm,
  // ---- 页眉左侧标识 ----
  brand: "",
  brandLink: "",
  brandIcon: "",
  // ---- 页眉右上角色块与日期 ----
  banner: "",
  // 灰色块内的文字 (设置 banner 图片时不显示)
  bannerText: "",
  bannerWidth: 31%,
  bannerHeight: 2.6em,
  date: "",
  // ---- 大标题与副标题 ----
  title: "",
  titleSize: 3.6em,
  titleTracking: 0.08em,
  subtitle: "",
  subtitleSize: 1.05em,
  subtitleTracking: 0.14em,
  // ---- 姓名右侧的联系信息 (置于报头空白处) ----
  headerInfo: none,
  // ---- 分隔线 ----
  ruleWidth: 100%,
  ruleThickness: 2.5pt,
  // ---- 正文分栏 ----
  columnCount: 2,
  gutter: 0.5cm,
  // ---- 页脚 ----
  footer: "",
  body,
) = {
  // 页面设置
  set page(
    paper: "a4",
    margin: (top: marginTop, bottom: marginBottom, left: marginLeft, right: marginRight),
    // 页脚: 一条细分隔线 + 居中的 名称 · 第 N 页
    footer: context {
      line(length: 100%, stroke: 0.5pt + black)
      v(0.45em)
      align(center, text(font: font.sans, size: 0.8em, {
        if footer != "" {
          text(fill: themeColor, footer)
          box(width: 0.6em)
          "·"
          box(width: 0.6em)
        }
        text(fill: rgb(110, 110, 110))[第 #counter(page).display() 页]
      }))
    },
  )

  // 基础字体设定
  set text(font: font.serif, size: size, lang: "zh")

  // 段落设定
  set par(justify: true, spacing: 0.6em)

  // 栏目标题: 无衬线加粗, 字号略大, 字距拉开
  show heading: set text(
    font: font.sans,
    weight: "bold",
    size: 1.25em,
    tracking: 0.06em,
    fill: black,
  )
  show heading.where(level: 2): it => {
    v(0.68em)
    it
    v(0.26em)
  }

  // 链接颜色
  show link: set text(fill: themeColor)

  // 粗体强调: LXGW WenKai 等字体没有 Bold(700) 字重, 加粗会映射到
  // Medium; 这里叠加同色系细描边, 使 *强调* 的粗体效果更明显
  // (描边画笔默认跟随文字颜色, 不影响链接等彩色文字)
  show strong: set text(weight: "bold", stroke: 0.03em)

  // 项目符号改为小圆点 (同 Markdown 的 -)
  set list(indent: 0.4em, body-indent: 0.4em)
  show list: it => stack(spacing: 0.36em, ..it.children.map(item => grid(
    columns: (1em, 1fr),
    gutter: (0em),
    box(h(0.25em) + [•]),
    pad(top: 0.15em, item.body),
  )))

  // ---------- 页眉 ----------
  // 左: 标识; 右: 灰色色块 (可与图片互换), 色块下方右对齐的日期
  let brandContent = if brandLink != "" { link(brandLink, brand) } else { brand }
  layout(avail => {
    let bannerW = avail.width * bannerWidth
    block({
      grid(
        columns: (1fr, auto),
        gutter: 1em,
        align(left + bottom, {
          if brandIcon != "" { icon(brandIcon) }
          text(font: font.sans, weight: "bold", size: 1.15em, fill: black, brandContent)
        }),
        align(right + bottom, {
          block(width: bannerW, height: bannerHeight, {
            if banner != "" {
              image(banner, width: 100%, height: 100%, fit: "cover")
            } else {
              rect(width: 100%, height: 100%, fill: bannerColor, stroke: none)
              // if bannerText != "" {
              //   place(center + horizon, text(
              //     font: font.sans, weight: "bold", size: 0.95em, fill: black,
              //     bannerText
              //   ))
              // }
            }
          })
        }),
      )
      v(0.35em)
      align(right, text(font: font.sans, size: 0.95em, date))
    })
  })

  // ---------- 报头: 左侧大标题与副标题, 右侧联系信息 ----------
  v(1.8em)
  grid(
    columns: (1fr, auto),
    gutter: 2em,
    align(left + bottom, {
      text(font: font.sans, weight: "bold", size: titleSize, tracking: titleTracking, fill: black, title)
      if subtitle != "" {
        v(0.4em)
        text(font: font.sans, weight: "bold", size: subtitleSize, tracking: subtitleTracking, fill: rgb(30, 30, 30), subtitle)
      }
    }),
    align(right + bottom, headerInfo),
  )

  // ---------- 粗分隔线 ----------
  v(0.9em)
  line(length: ruleWidth, stroke: ruleThickness + ruleColor)
  v(0.9em)

  // ---------- 正文分栏 ----------
  columns(columnCount, gutter: gutter, body)
}


// 栏目标题 (亦可直接使用 `== 标题` 语法)
#let section(title) = heading(level: 2, title)


// 联系信息: 竖向排列, 每项为 图标 + 内容
#let info(
  color: black,
  // 对齐方式: left (左对齐) / right (右对齐)
  // (注意不能命名为 align, 会与内置 align 函数冲突)
  alignment: left,
  // 字号
  size: 0.95em,
  ..infos
) = {
  set text(font: font.sans, fill: color, size: size)
  // 用 set align 统一对齐: 覆盖报头单元格继承来的对齐方式.
  // (行内 grid 使用 auto 列宽, 仅靠单元格内的 align 元素不起作用)
  set align(alignment)
  stack(spacing: 0.45em, ..infos.pos().map(dir => {
    grid(
      columns: (1.6em, auto),
      gutter: (0em),
      {
        if "icon" in dir {
          if (type(dir.icon) == str) {
            icon(dir.icon)
          } else {
            dir.icon
          }
        }
      },
      {
        if "link" in dir {
          link(dir.link, dir.content)
        } else {
          dir.content
        }
      },
    )
  }))
}


// 日期: 颜色变灰, 字号略小
#let date(body) = text(
  fill: rgb(110, 110, 110),
  size: 0.9em,
  body
)


// 技术栈: 字体变细
#let tech(body) = block({
  set text(weight: "extralight")
  body
})


// 条目: 第一行为 标题 + 右侧日期, 其后为描述内容
#let item(
  title,
  desc,
  endnote,
) = {
  v(0.26em)
  grid(
    columns: (1fr, auto),
    gutter: 0.4em,
    title,
    endnote,
  )
  v(0.1em)
  desc
}
