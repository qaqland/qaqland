# addgroup

```sh
$ addgroup [-g GID] [-S] [USER] GROUP
```

Add a group or add a user to a group

- 创建一个新组
- 添加用户到组

```sh
-g GID  Group id
-S      Create a system group
```

## System Groups

There is no inherent difference between system groups and 'normal' groups...  
[_- What is a "system" group, as opposed to a normal group?_](https://askubuntu.com/questions/523949/what-is-a-system-group-as-opposed-to-a-normal-group)

除了创建时 GID 的取值范围不同，系统组和常规用户组没有区别

## See also

[groupadd(8) — Linux manual page](https://man7.org/linux/man-pages/man8/groupadd.8.html),
[delgroup](./delgroup.md)
