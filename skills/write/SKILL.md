---
name: write
description: Use only when explicitly asked to write or edit prose. Not for code comments, commit messages, or inline documentation. Produces natural-voice text stripped of AI writing patterns.
version: 2.3.0
disable-model-invocation: true
---

# 写作风格 / Writing Style

根据内容语言选择对应规则文件。

- 中文内容: 加载 `references/write-zh.md`
- English content: load `references/write-en.md`

执行顺序: 读取对应规则文件，严格按规则处理，输出修改后的内容。
