# base64

```sh
$ base64 [-d] [-w COL] [FILE]
```

Base64 encode or decode FILE to standard output

- Base64 编码
- 解码 FILE 到标准输出

```sh
-d      Decode data               指定为解码
-w COL  Wrap lines at COL         换行宽度
        (default 76, 0 disables)
```

## Example

查看原文件

```sh
localhost:~$ cat .lesshst
.less-history-file:
```

获取 base64 加密（编码）

```sh
localhost:~$ base64 .lesshst
Lmxlc3MtaGlzdG9yeS1maWxlOgo=
```

获取 base64 并限制宽度

```sh
localhost:~$ base64 .lesshst -w 10
Lmxlc3MtaG
lzdG9yeS1m
aWxlOgo=
```

将 base64 编码重定向到本地文件

```sh
localhost:~$ base64 .lesshst > 123
```

从 FILE 本地文件解码 base64

```sh
localhost:~$ base64 -d 123
.less-history-file:
```

## Difference

> With no FILE, or when FILE is -, read standard input.
>
> 原版 base64 可以使用 `-` 直接读取命令行参数解码

BusyBox 缩水版没有原版 base64 的此选项，但可以使用`|` 或 `<()` 完成替代操作

```sh
localhost:~$ echo Lmxlc3MtaGlzdG9yeS1maWxlOgo= | base64 -d
.less-history-file:

localhost:~$ base64 -d  <(echo Lmxlc3MtaGlzdG9yeS1maWxlOgo=)
.less-history-file:
```

## 参见

[Process Substitution (Bash Reference Manual)](https://www.gnu.org/software/bash/manual/html_node/Process-Substitution.html#Process-Substitution)
