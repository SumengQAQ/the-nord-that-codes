# CodeCompanion Rules

## MCP Server Development

When creating MCP (Model Context Protocol) servers:

- Prefer TypeScript (good SDK support, AI-friendly)
- Use Streamable HTTP for remote servers (stateless JSON), stdio for local servers
- Balance comprehensive API coverage with specialized workflow tools
- Use clear, descriptive tool names with consistent prefixes (e.g., `github_create_issue`)
- Provide actionable error messages that guide agents toward solutions
- Use Zod (TypeScript) or Pydantic (Python) for input schemas
- Use `outputSchema` for structured data when possible
- Add annotations: `readOnlyHint`, `destructiveHint`, `idempotentHint`, `openWorldHint`
- Create 10 evaluation questions for testing: independent, read-only, complex, realistic, verifiable, stable

## Frontend Design

When creating frontend interfaces:

- Avoid generic AI aesthetics (Inter/Roboto fonts, purple-on-white gradients, predictable layouts)
- Choose a BOLD aesthetic direction before coding
- Focus on: typography (distinctive fonts), color (cohesive palette with dominant colors + accents), motion (CSS animations, staggered reveals), spatial composition (unexpected layouts, asymmetry, overlap)
- Use backgrounds with texture/depth: gradient meshes, noise textures, geometric patterns
- Match implementation complexity to the aesthetic vision

## Web Application Testing

When testing local web applications with Playwright:

- Use native Python Playwright scripts
- For dynamic apps, always wait for `page.wait_for_load_state('networkidle')` before inspection
- Follow the reconnaissance-then-action pattern: inspect rendered DOM, identify selectors, then execute actions
- Use descriptive selectors: `text=`, `role=`, CSS selectors, or IDs
- Always close the browser when done
- For server management, use helper scripts that handle server lifecycle

## Skill Creation

When creating or improving skills:

- Understand user intent first: what should the skill enable, when should it trigger, what's the output format
- Write SKILL.md with YAML frontmatter (name, description required) and markdown instructions
- Keep SKILL.md under 500 lines; use progressive disclosure with bundled resources
- Use imperative form in instructions
- Explain WHY things are important rather than heavy-handed MUSTs
- Create 2-3 test prompts and run them (with-skill + baseline)
- Draft quantitative assertions while test runs are in progress
- Launch the eval viewer for human review
- Iterate: improve, rerun, review, repeat
- Optimize skill description for better triggering accuracy using eval queries

## Document Co-Authoring

When helping users write documentation:

- Follow three stages: Context Gathering → Refinement & Structure → Reader Testing
- Stage 1: Ask meta-questions (doc type, audience, desired impact), encourage info dumping, ask clarifying questions
- Stage 2: Build section by section (clarifying → brainstorm 5-20 options → curate → draft → refine)
- Stage 3: Test with a fresh context (predict reader questions, verify the doc works for new readers)
- Use `str_replace` for edits, never reprint the whole doc
- When Reader Claude consistently answers correctly, the doc is ready
