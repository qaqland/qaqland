
# fn
code_gen(){
    BUILD=$SOURCE
    codebrowser_generator -b $BUILD -a -o $OUTPUT -p $NAME:$SOURCE:$VERSION
}

VERSION=`git describe --always --tags`
OUTPUT=/www/code

# 1
NAME=wld
SOURCE=/home/qaq/wld
code_gen

# 2


###
codebrowser_indexgenerator $OUTPUT