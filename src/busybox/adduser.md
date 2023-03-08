# adduser

```sh
$ adduser [OPTIONS] USER [GROUP]
```

Create new user, or add USER to GROUP

- 创建新用户
- 添加用户到组

```sh
-h DIR          Home directory
-g GECOS        GECOS field                     个人信息备注栏
-s SHELL        Login shell
-G GRP          Group
-S              Create a system user            系统用户
-D              Don't assign a password
-H              Don't create home directory
-u UID          User id
-k SKEL         Skeleton directory (/etc/skel)  用户 Home 的模板
```

## Skeleton

Directory `/etc/skel/` (skel is derived from the “skeleton”) is used to initiate home directory when a user is first created.  
[_- Understanding the /etc/skel directory in Linux_](https://www.thegeekdiary.com/understanding-the-etc-skel-directory-in-linux/)

不过 Alpine Linux 默认没有 `/etc/skel`，文中提到的记录 SKEL 的配置文件 `/etc/default/useradd` 也不存在

## See also

[deluser](../deluser.md),
[passwd](../passwd.md)
