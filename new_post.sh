# get post informations
TITLE=$1
CATEGORY=$2
TAG=$3
if [[ $TAG == "" ]]; then
    TAG=$2
fi


# get time
now=$(date "+%Y-%m-%d")

# make file names
# bash에서는 띄어쓰기도 중요하다
file_name="./_posts/${now}-${TITLE}.md"

# echo "${file_name}"

# 이미지 디렉토리 생성
# 여기도 마찬가지
mkdir -p "./images/${now}/${TITLE}"

# 파일 생성
cat <<EOF > ${file_name}
---
title: "${TITLE}"
image:
    path: /images/${now}/${TITLE}/ 
categories:
    - ${CATEGORY}
tags:
    - ${TAG}
last_modified: $(date "+%Y-%m-%dT%H:%M:%S")
comment: true
---
<head>
    <base href="/images/${now}/${TITLE}/"/>
</head>

EOF

# 열기
# 띄어쓰기 입력시 여러 파일 여는 것으로 인식
# 따옴표로 묶어줘야만함
code "${file_name}"
