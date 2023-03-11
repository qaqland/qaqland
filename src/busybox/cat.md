# cat

```sh
$ cat [-nbvteA] [FILE]...
```

Print FILEs to stdout

- 打印 FILE 文件到 stdout 标准输出

```sh
-n      Number output lines         显示行号
-b      Number nonempty lines       跳过空行显示行号
-v      Show nonprinting characters as ^x or M-x
-t      ...and tabs as ^I
-e      ...and end lines with $
-A      Same as -vte                显示不可打印字符
```

## Example

可以同时查看两个文件

```sh
localhost:~$ echo 111 > 1
localhost:~$ echo 222 > 2
localhost:~$ cat 1 2
111
222
```

`-n` 显示行号

```sh
localhost:~$ cat -n .ash_history
# *** 略
   302  man busybox
   303  ls -al
   304  cat -n 5 .ash_history
   305  cat -n  .ash_history
   306
   307
   308  cat  .ash_history
   309  nano .ash_history
   310  cat -n  .ash_history
```

`-b` 显示行号但是跳过空行

```sh
localhost:~$ cat -b .ash_history
# ***
   302  man busybox
   303  ls -al
   304  cat -n 5 .ash_history
   305  cat -n  .ash_history


   306  cat  .ash_history
   307  nano .ash_history
   308  cat -n  .ash_history
   309  cat -b  .ash_history
```

`-e` 显示换行符

```sh
localhost:~$ cat -e  .ash_history
man busybox$
ls -al$
cat -n 5 .ash_history $
cat -n  .ash_history $
$
$
cat  .ash_history $
nano .ash_history $
cat -n  .ash_history $
cat -b  .ash_history $
cat -e  .ash_history $
```

其它不可打印字符，暂无示例

## Example 2

交互式地写入文件

```sh
lab:~$ cat > 123
```

回车之后开始编辑，完成后 CTRL+`d` 结束退出

```sh
lab:~$ cat > 123
test1:123
test2:456
lab:~$ ls
lab:~$ cat 123
test1:123
test2:456
lab:~$
```

## See also

[sharkdp/bat: A cat(1) clone with wings.](https://github.com/sharkdp/bat)
