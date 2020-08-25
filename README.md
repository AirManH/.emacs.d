# air-emacs

My Emacs configuration files.

## Important features

- auto install and update required package
- org mode live preview (<kbd>M-x</kbd> + <kbd>air-org-preview</kbd> + <kbd>RET</kbd>)
- python support
- markdown support
  - <kbd>M-x</kbd> + <kbd>vmd-mode</kbd> + <kbd>RET</kbd>: live preview.
- lua support
- rainbow delimiters

## Dependencies

- package `vmd-mode` requires `vmd`. use `npm install -g vmd` to install.

### Optional

- The plugin `format-all` requires backend formatter, see [this page](https://github.com/lassik/emacs-format-all-the-code#supported-languages) for more information.

## Keybinds

- <kbd>C-M-l</kbd> : reformat code (see _format-all_)

## Enabled plugins

Package archive: http://elpa.emacs-china.org/gnu/, http://elpa.emacs-china.org/melpa/

Dependencies may not be included here.

### Package Manage

- auto-package-update
- use-package

### Python

- anaconda-mode
- company-anaconda

### Org mode

- impatient-mode
- simple-httpd

### Markdown

- markdown-mode
- vmd-mode

### Lua

- lua-mode

### UI

- rainbow-delimiters
- smartparens
- smooth-scrolling
- spacemacs-theme

### Other packages

- company
- counsel
- format-all
- hungry-delete
