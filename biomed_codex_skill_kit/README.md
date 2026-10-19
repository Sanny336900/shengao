# Codex 医学 SCI 论文七项 Skills 安装包（macOS）

## 这个压缩包包含什么
- `biomed-manuscript-workflow/SKILL.md`：专门为医学 SCI 论文配置的统一调度 Skill。
- `AGENTS.md`：放在你某个论文项目根目录中的项目级默认要求。
- `ONE_PROMPT.txt`：直接粘贴到 Codex 的统一指令。
- `install_macos.sh`：逐个安装 7 项，安装过程保留 CLI 提示，不擅自覆盖源稿。

## 前提
安装 Node.js LTS，使 `node -v` 和 `npx -v` 成功；先安装 Codex CLI 或 Codex App，并登录。建议先查看第三方 GitHub 仓库的 `SKILL.md`、脚本与许可条款。

## 运行安装脚本
解压后，在“终端”中切换到本文件所在文件夹，然后运行 `bash install_macos.sh`。如果你想逐行执行和检查，可直接打开脚本复制相应命令。

## 安装后检查
`npx skills list -g -a codex`

打开 Codex，运行 `/skills` 或输入 `$` 查看技能；找不到时重启 Codex。验证 `biomed-manuscript-workflow` 是否出现。如果 `skills list` 未显示手工放入 `.agents/skills` 的总控 Skill，可直接检查 `~/.agents/skills/biomed-manuscript-workflow/SKILL.md` 并在 Codex 的 `/skills` 中查看。

## 使用
1. 建立一个论文项目文件夹，把 Word、Figures、Supplementary、References、必要原始数据放进去（避免不必要的隐私或患者数据）。
2. 将本压缩包的 `AGENTS.md` 放在该论文项目根目录；如果已有 AGENTS.md，请先合并，不要覆盖。
3. 在 Codex App 打开项目文件夹，或在终端 `cd 你的论文文件夹` 后运行 `codex`。
4. 粘贴 `ONE_PROMPT.txt` 的内容，或在对话开头写 `$biomed-manuscript-workflow` 后描述本次任务。
5. 日常单段润色无需七项全开，直接说“用 biomed-manuscript-workflow 修改 Discussion 第 2 段”。

## 关键限制
- 第 1 项原项目 `Leey21/awesome-ai-research-writing` 是提示词合集，不是 Codex 原生 Skill；此包安装其第三方 Codex 适配版。
- 第 2 项 `find-skills` 是搜索工具，不是审稿引擎。
- 其余五项是不同的审查框架，不需要每次全部运行；`scholar-evaluation` 不应用于录用决定或论文 accept/reject 概率判断。
- 第三方安装命令基于 2026-10-19 所查 GitHub 仓库结构与 skills CLI 文档，尚未在你的电脑实际运行。若上游改名，请运行 `npx skills add <repo> --list` 再选择正确目录。
