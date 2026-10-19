#!/usr/bin/env bash
set -euo pipefail
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

if ! command -v npx >/dev/null 2>&1; then
  echo "缺少 npx。请先安装 Node.js LTS，然后重新运行。" >&2
  exit 1
fi

cat <<'MSG'
准备将 7 项第三方 Skills 安装到当前用户的 Codex（全局）。
安装会连接 GitHub 并可能显示权限与确认提示。
请先检查这些第三方仓库中的 SKILL.md、脚本和许可证，
尤其不要把未发表稿件或敏感数据交给未经审查的服务。
按 Ctrl+C 可以随时中止。
MSG

# 1: Codex-ready adaptation of Leey21's prompt collection
npx skills add zengrong233/awesome-ai-research-writing-skill --skill awesome-ai-research-writing -g -a codex
# 2: discovery
npx skills add vercel-labs/skills --skill find-skills -g -a codex
# 3, 4, 6: 3 skills hosted in one repository
npx skills add K-Dense-AI/scientific-agent-skills --skill scientific-critical-thinking --skill peer-review --skill scholar-evaluation -g -a codex
# 5: simulated multi-reviewer panel
npx skills add nosugr/claude-code-skills --skill academic-paper-reviewer -g -a codex
# 7: high-bar stress-test
npx skills add Yuan1z0825/nature-skills --skill nature-reviewer -g -a codex

# The local eighth item is an orchestration skill, not another external source.
TARGET="${HOME}/.agents/skills/biomed-manuscript-workflow"
mkdir -p "$TARGET"
cp "$HERE/biomed-manuscript-workflow/SKILL.md" "$TARGET/SKILL.md"
echo ""
echo "安装命令已完成；已复制统一调度 Skill 到：$TARGET"
echo "请运行：npx skills list -g -a codex"
echo "然后重启 Codex，在 /skills 中检查。"
