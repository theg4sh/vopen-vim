### Description

VOpen Vim Plugin is a small plugin to open selected text in a browser (by default) according
to a format string and preprocessing functions.

### Placeholders

Supported naive placeholder's replace implemetation to format command argument
* `{selection}` - selected text by visual mode

### Config variables

* `g:vopen_command` - command which called with formatted argument (default: `xdg-open`)

### Usage samples

To search selected text in browser:
```
com! -range YaSearch '<,'> call VOpenLinkEscaped("https://ya.ru/search/?text={selection}")
```

Open custom documentation:
```
com! -range DocOpen '<,'> call vopen#VOpenLink("https://docs.your-company.shop/#{selection}", ['tolower', 'vopen#url_encode#UrlEncode'])
```
