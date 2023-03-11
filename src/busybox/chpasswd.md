# chpasswd

```sh
$ chpasswd [-me] [-c ALG] [-R DIR]
```

Read user:password from stdin and update /etc/passwd

- 从 stdin 读取 user:password 更新 `/etc/passwd`

```
-e      Supplied passwords are in encrypted form	指定 stdin 密码是加密过的
-m      Encrypt using md5, not des					指定加密为 md5
-c ALG  des,md5,sha256/512 (default sha512)			指定加密算法
-R DIR  Directory to chroot into					修改离线系统的用户密码
```

## chpasswd vs passwd

This command is intended to be used in a large system environment where many accounts are created at a single time.
passwd is (in my experience) normally used interactively for a single user.  
[- _What's the difference between 'passwd' and 'chpasswd'?_](https://unix.stackexchange.com/questions/345459/whats-the-difference-between-passwd-and-chpasswd)

前者是命令行控制的批量修改，后者适合个人交互式设置。

## Example

:D

## See also

[passwd](./passwd.md)
