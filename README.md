# Ollama Pull All Models

This project provides a Bash script designed to automate the process of pulling all available models listed by the `ollama ls` command. It includes error handling to skip models that fail to download, ensuring a smooth batch operation. The script also features an ASCII art banner and a help command to guide users through its usage.

## Versions

**Current version**: Initial release of the model pull script `0.1.0`

## Table of Contents

- [Versions](#versions)
- [Badges](#badges)
- [Installation](#installation)
- [Usage](#usage)
- [License](#license)
- [Contributing](#contributing)

## Badges

![Language](https://img.shields.io/badge/language-bash-red)
![Version](https://img.shields.io/badge/version-0.1.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)

## Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/beecave-homelab/ollama-pull-all-models.git
   cd ollama-pull-all-models
   ```
2. Make the script executable:
   ```bash
   chmod +x ollama-pull-all.sh
   ```
3. (Optional) To allow global access, move the script to `/usr/local/bin`:
   ```bash
   sudo cp ollama-pull-all.sh /usr/local/bin/ollama-pull-all
   ```

## Usage

Run the script by executing:
```bash
./ollama-pull-all.sh
```

For global access, if you've moved the script to `/usr/local/bin`, use:
```bash
ollama-pull-all
```

### Options

- `-h`, `--help`: Display the help message.

This script pulls all models available via `ollama ls`. If any model fails to pull, an error message is displayed, and the script proceeds to the next model.

## License

This project is licensed under the MIT license. See [LICENSE](LICENSE) for more information.

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss proposed changes.
