[preamble.sty](https://github.com/wei2912/obsidian-latex) is in the root. Requires `Extended Mathjax` community plugin for the obsidian notebook to work with all my math notations. Or you can set commands right in the source code too I think, it's just not gonna be globally set. For example: $\newcommand{\p}{\widehat{\mathbf{p}}}\p$ (please check the sources yeah). The `preamble.sty` should be under the root directory of this file. Here is a backup on the content of the preamble file

```latex 
\newcommand{\R}{\mathbb{R}}
\newcommand{\Z}{\mathbb{Z}}
\newcommand{\N}{\mathbb{N}}
\newcommand{\Q}{\mathbb{Q}}
\newcommand{\e}{\mathbf{\vec{e}}}
\newcommand{\mse}[1]{\text{MSE}\left[#1\right]}
\newcommand{\expect}[1]{\mathbb E\left[#1\right]}
\newcommand{\cov}{\text{Cov}}
\newcommand{\var}[1]{\text{Var}\left[#1\right]}
\newcommand{\bias}[1]{\text{Bias}\left[#1\right]}
\newcommand{\pr}{\text{Pr}}
\newcommand{\argmin}[1]{\underset{#1}{\text{argmin}}}
```

Yeah. That is all you need to read this obsidian notebook. I have some global macros like: 

$$
\e, \R,\Z, 
$$

and that is for now. If you also use [Markdown all in one](https://marketplace.visualstudio.com/items?itemName=yzhang.markdown-all-in-one) for vs code, then copied the following so that things appear the same in the obsidian notebook and in vs code: 

```json
	// Katex Macros for Markdown all in one
	"\\e": "\\mathbf{\\vec{e}}",
	"\\Q": "\\mathbb{Q}",
	"\\R": "\\mathbb{R}",
	"\\Z": "\\mathbb{Z}",
	"\\uvec": "\\boldsymbol{\\hat{\\textbf{#1}}}",
	"\\expect": "\\mathbb E\\left[#1\\right]",
	"\\var": "\\text{Var} \\left[#1\\right]",
	"\\pr": "\\mathbb P",
	"\\cov": "\\text{Cov}",
	"\bias": "\\text{Bias}\\left[#1\\right]",
	"\\mse": "\\text{MSE}\\left[#1\\right]",
	"\\argmin": "\\text{argmin}_{#1}"
},
```

for the `settings.json` file for your VS Code client, or add this as a project settings. The latest VS-Code update points to the setting ID`markdown.extension.katex.macros`. 

Other Community Plugins Used: 
- `highlightr`. 
- Dynamic Background. 
- Obsidian Link Converter