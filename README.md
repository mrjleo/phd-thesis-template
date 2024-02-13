# Template: PhD Thesis (Computer Science, LUH)
This is the template I made for [my PhD thesis](https://doi.org/10.15488/15769) (Computer Science, [Leibniz University Hannover](https://www.uni-hannover.de/en/)).

This repository contains the corresponding LaTeX class (`phdthesis.cls`) and a short example how to use it (`main.tex`).

__Important__: Make sure to double check the [official regulations](https://www.fei.uni-hannover.de/en/research/doctoral-study) before you submit. I take no responsibility for the correctness of this template!

## Usage
You can use `main.tex` as a starting point for your thesis. The commands are documented within that file.

For the initial submission, make sure you load the class __without__ the `accepted` option:
```latex
\documentclass[
    % some options ...
]{phdthesis}
```

For the publication of the final accepted version, load the class __with__ the `accepted` option:
```latex
\documentclass[
    accepted,
    % some options ...
]{phdthesis}
```
