alias grepr='grep -r'
alias psg='ps aux | grep'

# Not alias but useful function
cpng() {
  convert \
    -density 300 \
    -trim \
     $1 \
    -set filename:base "%[base]" "%[filename:base].png"
}
