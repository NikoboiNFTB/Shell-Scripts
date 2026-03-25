# Shell Scripts

Miscellanious shell scripts.

For utility scripts, see [UTILS.md](/UTILS.md), and for local LLM scripts, see [LLM.md](/LLM.md).

## Installation

You can install any one of the scripts into any folder by running:

```bash
wget https://shell.nikoboi.dev/path/to/script
```

> > Fill in the path to the script. [shell.nikoboi.dev](https://shell.nikoboi.dev/) resolves to this repository.

### Power User Tip

Place any script in `/usr/local/bin/` for easy access anywhere:

```bash
sudo mv script /usr/local/bin/script
```

This will allow you to easily run the script as any other Linux command:

```bash
script
```

Very much recommended for scripts you use a lot in many different folders.

#### WARNING

Make sure you don't overwrite anything in `/usr/local/bin/` or that the filename isn't a command:

1. You can easily make sure there isn't a file with the name by running;

```bash
cat /usr/local/bin/script-name
```

2. Or any such command:

```bash
script-name
```

## Contributing

Feel free to fork this repository and submit issues or pull requests if you have any suggestions or improvements. If you encounter any bugs or have feature requests, please open an issue.

## Credits

Created by [**Nikoboi**](https://github.com/NikoboiNFTB/)

## License

This project is licensed under the GNU General Public License V3. See [LICENSE](/LICENSE) for details.
