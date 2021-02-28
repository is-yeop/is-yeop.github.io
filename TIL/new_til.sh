# get time
now=`LC_ALL=C date "+%B %d, %Y"`
year=`LC_ALL=C date "+%Y"`
month=`LC_ALL=C date "+%B"`

mkdir -p TIL/${year}/${month}

cat <<EOF > TIL/${year}/${month}/${now}.md
# ${now} TIL


EOF

code "TIL/${year}/${month}/${now}.md"