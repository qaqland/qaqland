# chmod

```sh
$ chmod [-Rcvf] MODE[,MODE]... FILE...
```

MODE is octal number (bit pattern sstrwxrwxrwx) or [ugoa]{+|-|=}[rwxXst]

- 修改文件及文件夹的访问权限
- MODE 可以是 0644 八进制语法，也可以是 u+x 符号语法

```sh
-R      Recurse             递归调用文件夹子文件
-c      List changed files
-v      Verbose
-f      Hide errors
```

## Example

使用 `ls` 命令的查看文件或目录的属性

```sh
localhost:~$ ls -al
total 32
drwxr-sr-x    4 qaq      qaq           4096 Jan 15 10:21 .
drwxr-xr-x    4 root     root          4096 Jan  7 15:14 ..
-rw-------    1 qaq      qaq           5342 Jan 15 10:21 .ash_history
-rw-------    1 qaq      qaq            326 Jan 11 17:00 .bash_history
drwx--S---    4 qaq      qaq           4096 Jan  7 00:23 .config
-rw-------    1 qaq      qaq             20 Jan 15 10:21 .lesshst
drwx--S---    2 qaq      qaq           4096 Jan  6 23:32 .ssh
```

### ugoa

| 谁  | 用户类型 | 说明                 |
| --- | -------- | -------------------- |
| u   | user     | 文件所有者           |
| g   | group    | 文件所有者所在组     |
| o   | others   | 所有其他用户         |
| a   | all      | 所用用户, 相当于 ugo |

### rwxXst

某一单独的文件对某一单独的用户而言，只有 rwx 三种权限

- r 可读
- w 可写
- x 可执行（如果是目录就是可访问）
- X 如果存在可执行权限（任意用户）那么等同于 x
- s setuid/gid
- t sticky

X 能避免给文本数据 `123.txt` 可执行权限，它只关注已经存在可执行权限的文件。常用于递归调用

```sh
localhost:~$ chmod u+X 123
localhost:~$ ls -l
total 4
-rw-r--r--    1 qaq      qaq              4 Jan 15 10:36 123

localhost:~$ chmod g+x 123
localhost:~$ ls -l
total 4
-rw-r-xr--    1 qaq      qaq              4 Jan 15 10:36 123

localhost:~$ chmod u+X 123
localhost:~$ ls -l
total 4
-rwxr-xr--    1 qaq      qaq              4 Jan 15 10:36 123
```

s 预设了执行该程序时的 User ID/Group ID。
例如保存用户密码的文件为 root，但是修改当前用户密码不需要 root 权限

```sh
localhost:~$ ls -l /usr/bin/passwd
lrwxrwxrwx    1 root     root            11 Jan 15 11:23 /usr/bin/passwd -> /bin/bbsuid
localhost:~$ ls -l  /bin/bbsuid
---s--x--x    1 root     root         14160 Nov 19 18:13 /bin/bbsuid
# 这里 bbsuid 作为一个 wrapper 再去调用 busybox 修改密码

# 保存用户和密码的文件需要 root
localhost:~$ ls -l /etc/passwd
-rw-r--r--    1 root     root          1355 Jan  7 15:14 /etc/passwd
localhost:~$ ls -l /etc/shadow
-rw-r-----    1 root     shadow         742 Jan  7 15:14 shadow
```

t 保护文件所有者，防止普通用户删除或移动其他用户的文件（？）

```sh
localhost:~$ ls -l / | grep tmp
drwxrwxrwt    5 root     root           100 Jan 15 11:23 tmp
```

## See also

[ls](./ls.md),
[Linux chmod 命令 - 菜鸟教程](https://www.runoob.com/linux/linux-comm-chmod.html),
[chmod(1): change file mode bits - Linux man page](https://linux.die.net/man/1/chmod),
[chmod - 维基百科](https://zh.wikipedia.org/zh-cn/Chmod),
[sstrwxrwxrwx - Unix and Linux file permissions](http://www.wellho.net/mouth/1902_sstrwxrwxrwx-Unix-and-Linux-file-permissions.html)
