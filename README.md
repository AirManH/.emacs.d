
# Table of Contents

1.  [air-emacs](#org796a53e)
    1.  [Important features](#orgd4eb250)
    2.  [Dependencies](#org2351ad9)
        1.  [Optional](#orgf1e735f)
    3.  [Keybinds](#orgc3fba55)
    4.  [Enabled plugins](#org148589c)
        1.  [Package Manage](#org8089c0b)
        2.  [Python](#orga781f5e)
        3.  [Org mode](#org33887d7)
        4.  [Markdown](#orgff73494)
        5.  [Lua](#org81a9894)
        6.  [UI](#org28b6ad3)
        7.  [Other packages](#orgab0c1d6)


<a id="org796a53e"></a>

# air-emacs

My Emacs configuration files.


<a id="orgd4eb250"></a>

## Important features

-   auto install and update required package
-   org mode live preview (*M-x + air-org-preview + RET*)
-   python support
-   markdown support
    -   *M-x + vmd-mode + RET*: live preview.

-   lua support
-   rainbow delimiters


<a id="org2351ad9"></a>

## Dependencies

-   package `vmd-mode` requires `vmd`. use `npm install -g vmd` to
    install.


<a id="orgf1e735f"></a>

### Optional

-   The plugin `format-all` requires backend formatter,
    see [this page](https://github.com/lassik/emacs-format-all-the-code#supported-languages) for more information.


<a id="orgc3fba55"></a>

## Keybinds

-   *C-M-l* : reformat code (see *format-all*)


<a id="org148589c"></a>

## Enabled plugins

Package archive: <http://elpa.emacs-china.org/gnu/>,
<http://elpa.emacs-china.org/melpa/>

Dependencies may not be included here.


<a id="org8089c0b"></a>

### Package Manage

-   auto-package-update
-   use-package


<a id="orga781f5e"></a>

### Python

-   anaconda-mode
-   company-anaconda


<a id="org33887d7"></a>

### Org mode

-   impatient-mode
-   simple-httpd


<a id="orgff73494"></a>

### Markdown

-   markdown-mode
-   vmd-mode


<a id="org81a9894"></a>

### Lua

-   lua-mode


<a id="org28b6ad3"></a>

### UI

-   rainbow-delimiters
-   smartparens
-   smooth-scrolling
-   spacemacs-theme


<a id="orgab0c1d6"></a>

### Other packages

-   company
-   counsel
-   format-all
-   hungry-delete

