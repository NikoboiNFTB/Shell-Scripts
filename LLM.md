# Local LLM Scripts

## [`continue`](/local-llms/continue)

Wrapper for the `cn` command with your custom config.

### Usage

```bash
continue "Some prompt text"
```

> > `/usr/local/bin/continue`

This will execute:

```
cn --config ~/.continue/config.yaml -p "<prompt>"
```

All arguments are passed as a single string to the `-p` flag.

This is meant to bypass the stupid cloud sign-in requirement of running cn. You also don't have to type `cn -p` every time, just `cont`. Here's the idea:

```bash
user@pc:~/GitHub/NikoboiNFTB/Shell-Scripts$ cn --config ~/.continue/config.yaml -p "hi"
Hello! How can I help you today?
user@pc:~/GitHub/NikoboiNFTB/Shell-Scripts$ cont "hi"
Hello! How can I help you today?
user@pc:~/GitHub/NikoboiNFTB/Shell-Scripts$
```

The script will need to be places into `/usr/local/bin/`.

## [`prompt`](/local-llms/prompt)

Wrapper to run a remote LLM locally, with locally stored history. Reasoning is invisible by default.

### Usage

Submit a prompt:

```bash
prompt "Your prompt here."
```

Show reasoning for last prompt:

```bash
prompt -r | --reasoning     # last prompt
prompt -r <ID>              # specific timestamp
prompt -r <N>               # N prompts ago
```

Show history:

```bash
prompt -h | --history
```

Will show Nth prompt and prompt ID. ID is the file name. History is stored locally in `~/.ollama/reasoning/<ID>`
