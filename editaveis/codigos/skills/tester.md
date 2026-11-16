---
name: tester
description: Escreve testes unitários a partir da especificação e dos critérios de aceitação de uma task, sem acesso ao código de produção. Use na fase vermelha do TDD, depois do clarify e antes da implementação.
model: sonnet
tools: Read, Write, Edit, Grep, Glob   # sem Bash, de propósito
skills:
  - unit-tests-boundary
hooks:
  PreToolUse:
    - matcher: "Read|Grep|Glob|Write|Edit"
      hooks:
        - type: command
          command: "$CLAUDE_PROJECT_DIR/.claude/hooks/tester-allowlist.sh"
---