# basename

```sh
$ basename FILE [SUFFIX] | -a FILE... | -s SUFFIX FILE...
```

Strip directory path and SUFFIX from FILE

- 去除 FILE 文件的目录路径和 SUFFIX 后缀

```sh
-a              All arguments are FILEs
-s SUFFIX       Remove SUFFIX (implies -a)
```

## Example

示例 FILE 及路径：

```sh
localhost:~$ ls -l /etc/apk/keys/
total 20
-rw-r--r--    alpine-devel@lists.alpinelinux.org-4a6a0840.rsa.pub
-rw-r--r--    alpine-devel@lists.alpinelinux.org-5243ef4b.rsa.pub
-rw-r--r--    alpine-devel@lists.alpinelinux.org-5261cecb.rsa.pub
-rw-r--r--    alpine-devel@lists.alpinelinux.org-6165ee59.rsa.pub
-rw-r--r--    alpine-devel@lists.alpinelinux.org-61666e3f.rsa.pub
```

不加额外参数，去除 FILE 路径中的目录：

```sh
localhost:~$ basename /etc/apk/keys/alpine-devel@lists.alpinelinux.org-4a6a0840.rsa.pub
alpine-devel@lists.alpinelinux.org-4a6a0840.rsa.pub
```

如果有第二个参数，即视为需要去除的 SUFFIX 后缀：

```sh
localhost:~$ basename /etc/apk/keys/alpine-devel@lists.alpinelinux.org-4a6a0840.rsa.pub .rsa.pub
alpine-devel@lists.alpinelinux.org-4a6a0840
```

`-a` 指定后续参数均为需要操作的 FILE：

```sh
localhost:~$ basename -a /etc/apk/keys/*
alpine-devel@lists.alpinelinux.org-4a6a0840.rsa.pub
alpine-devel@lists.alpinelinux.org-5243ef4b.rsa.pub
alpine-devel@lists.alpinelinux.org-5261cecb.rsa.pub
alpine-devel@lists.alpinelinux.org-6165ee59.rsa.pub
alpine-devel@lists.alpinelinux.org-61666e3f.rsa.pub
```

`-s` 指定下一参数为需要去除的后缀，并默认其它参数都是 FILE：

```sh
localhost:~$ basename -s .rsa.pub /etc/apk/keys/*
alpine-devel@lists.alpinelinux.org-4a6a0840
alpine-devel@lists.alpinelinux.org-5243ef4b
alpine-devel@lists.alpinelinux.org-5261cecb
alpine-devel@lists.alpinelinux.org-6165ee59
alpine-devel@lists.alpinelinux.org-61666e3f
```
