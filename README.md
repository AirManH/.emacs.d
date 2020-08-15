# air-emacs

My Emacs configuration files.

## Important features

- auto install and update required package
- markdown support
  - <kbd>M-x</kbd> + <kbd>vmd-mode</kbd> + <kbd>RET</kbd> to open a live preview.
- lua support
- rainbow delimiters

## Dependencies

- package `vmd-mode` requires `vmd`. use `npm install -g vmd` to install.

### Optional

- The plugin `format-all` requires backend formatter, see [this page](https://github.com/lassik/emacs-format-all-the-code#supported-languages) for more information.

## Keybinds

- <kbd>C-M-l</kbd> : reformat code

## Enabled plugins

Package archive: http://elpa.emacs-china.org/gnu/, http://elpa.emacs-china.org/melpa/

Dependencies may not be included here.

- auto-package-update
- company
- counsel
- format-all
- hungry-delete
- lua-mode
- markdown-mode
- rainbow-delimiters
- smartparens
- smooth-scrolling
- spacemacs-theme
- use-package
- vmd-mode
