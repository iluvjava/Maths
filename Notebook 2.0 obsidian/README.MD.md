[preamble.sty](https://github.com/wei2912/obsidian-latex) is in the root. Requires `Extended Mathjax` community plugin for the obsidian notebook to work with all my math notations. Or you can set commands right in the source code too I think, it's just not gonna be globally set. For example: $\newcommand{\p}{\widehat{\mathbf{p}}}\p$ (please check the sources yeah). 

Yeah. That is all you need to read this obsidian notebook. I have some global macros like: 

$$
\e, \R,\Z, 
$$

and that is for now. If you also use [Markdown all in one](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one) for vs code, then copied the following so that things appear the same in the obsidian notebook and in vs code: 

```json
"markdown.extension.katex.macros": {
	// Katex Macros for Markdown all in one
	"\\e": "\\mathbf{\\vec{e}}",
	"\\Q": "\\mathbb{Q}",
	"\\R": "\\mathbb{R}",
	"\\Z": "\\mathbb{Z}",
	"\\uvec": "\\boldsymbol{\\hat{\\textbf{#1}}}"
},
```

for the `settings.json` file for your VS Code client. 

Other Community Plugins Used: 
- `highlightr`. 
- Dynamic Background. 