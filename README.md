# Posh Jump (Powershell Windows)

A little utility tools for powershell windows to bookmark directory paths & jump around like charm. Easily jump around the file system by manually adding marks.

_Inspired by [oh-my-zsh jump plugin](https://github.com/robbyrussell/oh-my-zsh/tree/master/plugins/jump)_

### Prerequisites

- **Windows PowerShell 5.x or PowerShell Core 6.0**. You can check your PowerShell version by executing `$PSVersionTable.PSVersion`

- **Script execution policy** must be set to either `RemoteSigned` or `Unrestricted`. Run powershell as **_administrator_** and execute: - check current execution policy:
  `Get-ExecutionPolicy` - if policy is **_not_** `RemoteSigned` or `Unrestricted`, then set policy:
  `Set-ExecutionPolicy RemoteSigned -Scope CurrentUser -Confirm`
- Latest version of **Git**. Check that `git` is accessible from PowerShell by executing `git --version` from PowerShell.

### Installation

- Run **_Powershell as administrator_**
- Clone this repo: `git clone https://github.com/mimukit/posh-jump.git`
- Go to source directory: `cd posh-jump`
- Execute the `install.ps1`
- Enjoy 🍻🤟💕

### Using Posh Jump

Here are the list of commands available:

| Command               | Description                                                                                     |
| --------------------- | ----------------------------------------------------------------------------------------------- |
| `jump <mark-label>`   | Jump to the given mark                                                                          |
| `mark <mark-label>`   | Create a mark with the given name or with the name of the current directory if none is provided |
| `unmark <mark-label>` | Remove the given mark                                                                           |
| `marks`               | List the existing marks and the directories they point to                                       |

### TODOs:

- [ ] help menu command from terminal **_( jump -h or jump --help)_**
- [ ] colorful output on terminal
- [ ] update existing `mark`
- [ ] backup and restore `mark list`
- [ ] uninstall script

_N.B: other feature request are welcomed. Just create an issue._

### License

posh-jump is released under the [MIT](https://github.com/mimukit/posh-jump/blob/master/LICENSE)
