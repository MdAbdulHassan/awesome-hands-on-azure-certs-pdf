#!/bin/bash

# sudo apt install -y texlive-fonts-extra texlive-fonts-recommend texlive-xetex pandoc
# bash clone_MicrosoftLearning_certs_en_repositories.sh   # git clone required list of repositories
find ./* -type f -name '*.md' > md_files.txt
cat > 2_vim_regex_sort.vim << EOF
:set smartcase
:%s/\/\([^0-9]ea\(\w\|_\|-\|\s\|(\|)\)\+.md\)/\/0000_\1/g
:%s/\/\([^0-9]\(\w\|_\|-\|\s\|(\|)\)\+.md\)/\/000_\1/g
:%!sort -u
:%s/\/000_\([^0-9]\(\w\|_\|-\|\s\|(\|)\)\+.md\)/\/\1/g
:%s/\/0000_\([^0-9]\(\w\|_\|-\|\s\|(\|)\)\+.md\)/\/\1/g
:g/\.github/d
:%s/^..//
:w md_files_sorted.txt
:wq!
EOF
vim -T dumb --noplugin -n -es -S 2_vim_regex_sort.vim "md_files.txt"
cat md_files_sorted.txt |while read line; do echo "$line" >> "${line%%/*}.repo.md.txt"; done 
cat > convert_mod.vim << EOF
:%s~\v^[^\]]*\zs\]\(([^#](home.ll.*)@!(.*:\/\/)@![^)]*)\)~\=']('.expand('%:p:h').'/'.submatch(1).')'~g
:%s~\v^[^\]]*\zs(\]\([^#](.*:\/\/)@![^)]*Labs).*labs(.*README.md)~\1\3~g
:%s/\v]\(([^#][^:)]*README.md)\)/\=system('grep -o -m1 "](#module.*)" '.submatch(1))/
:wq!
EOF
cat > prepend_vim-S_md_files_sorted.txt.vim << EOF
:%s/^/vim -T dumb --noplugin -n -es -S  convert_mod.vim "/g
:%s/$/"/g
:w md_files_sorted_vim-S_convert.sh
:wq!
EOF
vim -T dumb --noplugin -n -es -S prepend_vim-S_md_files_sorted.txt.vim md_files_sorted.txt # WARN: Also updates source file md_files_sorted.txt
chmod +x md_files_sorted_vim-S_convert.sh
sh md_files_sorted_vim-S_convert.sh

echo "Render with pandoc"
args=()
args+=('--number-sections')  # add numbered sections
args+=('--toc')  # add table of contents
args+=('--toc-depth=4')  # define depth of table of contents
args+=('--from=gfm')
# args+=('--css=github.css')
args+=('--variable')
args+=('mainfont="DejaVuSans"')
args+=('--variable')
args+=('monofont="DejaVuSansMono"')
args+=('--pdf-engine=xelatex')  # use latexmk to generate pdf 
# pdf-engine must be one of wkhtmltopdf, weasyprint, prince, pdflatex, lualatex, xelatex, pdfroff, context
# args+=('--pdf-engine-opt=-xelatex')  # pass -xelatex option to latexmk
args+=('--variable')
args+=('geometry:margin=2cm')  # set margins to 2 cm
args+=('--variable')
args+=('linkcolor=blue')  # highlight links in blue
args+=('--variable')
args+=('geometry=a4paper')  # set A4 papersize

	# repo_md_input=$(cat DP-203T00-Data-Engineering-on-Microsoft-Azure.repo.md.txt | tr '\n' ' ')
find . -maxdepth 1 -type f -name '*.repo.md.txt' | while read repo_md_input_file; do 
	repo_md_cat_file="${repo_md_input_file%.*}"
	cat "${repo_md_input_file}" | xargs -d '\n' -l1 cat > "${repo_md_cat_file}"
	# pandoc "${args[@]}" "${repo_md_cat_file}" -o ${repo_md_input_file%.*}.pdf
	pandoc "${args[@]}" "${repo_md_cat_file}" -o ${repo_md_input_file/%.repo.md.txt/.pdf}
# ebook-convert, unlike pandoc, does not crash on No Such File or Directory.
	# ebook-convert  "${repo_md_cat_file}" ${repo_md_input_file/%.repo.md.txt/.ec.pdf} --paper-size a4 --pdf-add-toc --level3-toc --pdf-page-numbers --pdf-sans-family DejaVuSans
done
