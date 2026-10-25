---
name: tester
description: Escreve testes unitários a partir da especificação e dos critérios de aceitação de uma task, sem acesso ao código de produção. Use na fase vermelha do TDD, depois do clarify e antes da implementação.
model: sonnet
tools: Read, Write, Edit, Grep, Glob 
skills:
  - unit-tests-boundary
hooks:
  PreToolUse:
    - matcher: "Read|Grep|Glob|Write|Edit"
      hooks:
        - type: command
          command: "$CLAUDE_PROJECT_DIR/.claude/hooks/tester-allowlist.sh"
---


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

---
name: unit-tests-boundary
description: Gera testes unitários (JUnit 5 ou Jest) com partição de equivalência e valores de borda, a partir de critérios de aceitação e limites numéricos explícitos. Use ao escrever testes antes da implementação.
allowed-tools: Read, Write, Edit, Grep, Glob
---

---
name: implement-and-refactor
description: Implementa o código mínimo para passar testes existentes e refatora seguindo as camadas Controller, Service, Model e Repository. Use na fase verde e refactor do TDD.
allowed-tools: Read, Write, Edit, Grep, Glob, Bash
---