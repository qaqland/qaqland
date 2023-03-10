# Codebrowser

项目能为 C/C++ 项目生成带有 clangd 智能提示与跳转效果的静态网页

项目地址：<https://github.com/KDAB/codebrowser>  
修改主题：<https://github.com/moodyhunter/codebrowser>  
修改编译：<https://github.com/KDAB/codebrowser/issues/107> (AlpineLinux)

编译后用到的东西：

1. codebrowser/generator/codebrowser_generator
2. codebrowser/indexgenerator/codebrowser_indexgenerator
3. codebrowser/data

## codebrowser_generator

```sh
codebrowser_generator \
        -a \
        -o <output_dir> \
        -b <buld_dir> \
        -p <projectname>:<source_dir>[:<revision>] \
        [-d <data_url>] \
        [-e <remote_path>:<source_dir>:<remote_url>]
```

将源码编译解析为（包含 LSP 特效的） HTML

- -a 处理 compile_commands.json 包含的所有文件
- -o 生成 HTML 的输出文件夹，每个项目都会在此创建文件夹
- -b 指定包含有 compile_commands.json 的目录，一般源码目录相同，生成教程参考项目说明[^1]
- -p 指定项目名称、源码的绝对路径、版本号（可无可有）
- -d 指定生成 HTML 的资源文件夹 data 的路径，默认为 `<output_dir>/data`（需要手动复制）
- -e 不懂，不管

## codebrowser_indexgenerator

```sh
codebrowser_indexgenerator <output_dir> [-d data_url] [-p project_definition]
```

用来给上一步的 HTML 生成 index.html。

参数都是上一步设置过的，此处只接上一步 -o 的 `<output_dir>` 即可

## Example

```sh
{{#include demo/codebrowser.sh}}
```

[^1]: https://github.com/KDAB/codebrowser#compilation-database-compile_commandsjson
