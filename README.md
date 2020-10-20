Let's say you have a new MacBook Pro and you want to restore your stuff without using backups, Time Machine or other dirty stuff.

And let's also say you have a Synology NAS with your files, scripts, repos managed through Cloud Station Drive.

Well ... run **Bash Cloud Station Automator** for Synology Cloud Station and you'll have all back on your Mac.

**Disclaimer**
This script shouldn't be public as I am not a developer and, most important, I am NOT a bash developer. I like coding, I did it for fun and it's useful for me to quick download it when needed. Please inspect the code before run because **probably it's not stable**! I don't know if I'll update this script in the future.

## Getting Started

### Prerequisites

- A Mac with MacOs (I tested only on Catalina 10.15.7)
- `curl` should be installed
- `git` should be installed

### Installation

Quick and dirty.

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/gorino/macos-config/main/install.sh"
```

The script will do the followings.

1) Download Synology Cloud Station 4.3.3-4469
2) Install the package and open the UI
3) Wait for Cloud Station sync to complete
4) Remove all temporary files
5) Run the script at `~/Files/Code/TerminalSettings/install` (can be customized)

### Configuration

You can tweak the install behavior by setting one of the following variables before running the script.

| Variable        | Description                                                            |
|:----------------|:-----------------------------------------------------------------------|
| `MY_CUSTOM_CMD` | Path to commannd to run once Cloud Station sync has completed.         |

## Wishlist

Something I would like to dev in the future.

* Add colors to prompts

## Contributors

I don't maintain this repository regulary so feel free to grab it, change it, rename it, reinvent it or whatever you want to do.

## License

Cloud Station Automator is released under the [MIT license](LICENSE.txt).
