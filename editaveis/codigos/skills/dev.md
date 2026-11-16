---
name: dev
description: Implementa o mínimo de código para fazer passar os testes de uma task e depois refatora com os testes verdes. Use depois que os testes vermelhos foram revisados e commitados.
model: sonnet
tools: Read, Write, Edit, Grep, Glob, Bash
skills:
  - implement-and-refactor
hooks:
  PreToolUse:
    - matcher: "Write|Edit"
      hooks:
        - type: command
          command: "$CLAUDE_PROJECT_DIR/.claude/hooks/dev-no-test-edit.sh"
---