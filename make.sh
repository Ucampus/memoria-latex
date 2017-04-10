#!/bin/sh

zip -r memoria_latex.zip . -x \*.git\* -x \*.svn\* -x memoria_latex.\* -x template.tex -x make.sh -x make_test.sh
