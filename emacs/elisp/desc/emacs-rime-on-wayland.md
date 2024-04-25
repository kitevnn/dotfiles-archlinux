# live-in-emacs的关于输入法

# 紧急更新

我自己由于今天 20240425 由于折腾快照的原因，重新安装了一遍系统。在 20240425 21:49 左右，发现 **不知道出于什么原因(我个人实在排查不出来，也许是社区里有群佬重新打包了一遍？~~我自己猜的~~)**，现在的 `fcitx5` 已经可以在 `KDE plasma6 on Wayland(Hyprland WM)` 下的 `GNU Emacs` 应用，按下 `C-SPC` 能成功地切换到 `fcitx5` 来键入 `CJK字符` 了。

> 意思就是说。。。。。如果想要在Wayland的GNU Emacs得到fcitx5输入法的输入，**下面的笔记都不用看了**。直接在Wayland的GNU Emacs里使用fcitx5就好了。

## 1. 特别感谢

- [rime输入法作者: 佛振](https://github.com/rime)
- [狗哥的emacs-rime](https://github.com/DogLooksGood/emacs-rime)
- [emacs-china论坛](https://emacs-china.org/)
- [rime提供的自然码双拼输入方案](https://github.com/rime/rime-double-pinyin)

## 2. 问题反馈
- 在KDE on Wayland桌面环境(WM: Hyprland)下，在GNU Emacs下，通过按下默认设置的快捷键 `C-SPC` 来 **无法切换到fcitx5** 来键入CJK字符

- 即使自己已经在 `/etc/environment` 下设置了，**仍然无法切换到fcitx5**

    > # 与 `[是fcitx，还是fcitx5]` 没有关系，因为 [emacs-china上的这条帖子](https://emacs-china.org/t/emacs-fcitx5-gnome-on-wayland/13650)
    > 
    > ```
    > GTK_IM_MODULE=fcitx         
    > QT_IM_MODULE=fcitx
    > XMODIFIERS=@im=fcitx
    > SDL_IM_MODULE=fcitx
    > ```

## 3. 环境说明

| 序号 | 环境说明 | 说明
| ---- | ---- | ----
| 1 | OS - 操作系统 | `Arch Linux x86_64`
| 2 | WM - 窗口管理 | `Hyprland`
| 2 | DE - 桌面环境 | `KDE plasma 6`
| 3 | 桌面服务器 | `Wayland`
| 4 | 输入法 | `fcitx5`

## 4. 配置方案

| 序号 | 配置方案 | 说明
| ---- | ---- | ----
| 1 | 输入方案 | `自然码双拼`
| 2 | 输入文字 | `简体中文`
| 3 | 输入法前端 | `emacs-rime`
| 4 | 输入法后端 | `rime`

## 5. 安装做法

### (1) 先决条件
```
# 安装fcitx5输入法框架，到本机系统内(fcitx5-im: 包括了fcitx5-qt与fcitx5-gtk)
sudo pacman -S fcitx5-im fcitx5-chinese-addons fcitx5-rime fcitx5-material-color

# 编辑开机启动fcitx5
#			=>	GTK_IM_MODULE=fcitx
#			=>	QT_IM_MODULE=fcitx
#			=>	XMODIFIERS=@im=fcitx
#			=>  SDL_IM_MODULE=fcitx
sudo nano /etc/environment
```

### (2) 输入方案
- 下载rime官方提供的 **双拼** 输入方案

    > 下载别的输入方案也行，不过我自己尝试过别的，好像感觉不太好安装，没有rime-double-pinyin的安装做法简便
    >
    > [rime-double-pinyin仓库地址](https://github.com/rime/rime-double-pinyin)
    >

- rime官方提供的 `双拼` 输入方案，在默认部署后，默认是 `繁体字`

    > 默认rime官方提供的 `双拼` 输入方案，是 `繁体字`。
    >
    > 这就是因为 `rime官方提供的双拼输入方案` 的 `配置项` 决定了的，想要键入简体字，就需要更改输入方案配置项
    > 
    > 若要输入 `简体字`，就需要 [设置reset: 1的配置项](https://github.com/rime/rime-double-pinyin/issues/3#issuecomment-864338144)

- 安装 [自然码双拼输入方案](https://github.com/rime/rime-double-pinyin/blob/master/double_pinyin.schema.yaml) 到本机(如果不出意外的话，一般都是 `/usr/share/rime-data` 这个路径下)

    > ```sh
    > cd /usr/share/rime-data
    > sudo nano double_pinyin.schema.yaml     # 因为是在 /usr/share 路径下，所以需要 sudo 权限创建 新文件(新文件名: double_pinyin.schema.yaml)
    >
    > # 将 [自然码双拼输入方案] 的文本内容，复制粘贴到这里，保存退出。
    > ```

- 输入方案设置为 **简体字**

    > 若要输入 `简体字`，就需要 [设置reset: 1的配置项](https://github.com/rime/rime-double-pinyin/issues/3#issuecomment-864338144)

### (3) 在GNU Emacs上的部署

QA
- Q: 为什么还要在GNU Emacs上部署?

    > A: 因为我们之前只是安装好了 `输入法后端fcitx5` 与 `输入方案rime`。我们是 **想要在 `KDE on Wayland桌面环境上` 使用 `GNU Emacs` 来切换输入法fcitx5**。所以还要在GNU Emacs上部署。

#### I. 安装emacs-rime
具体的安装做法
> [安装emacs-rime](https://github.com/DogLooksGood/emacs-rime/blob/master/INSTALLATION.org)

个人安装经历
```text
# 本机依赖(via ArchLinux)
pacman -S librime

# 添加配置到 [GNU Emacs配置文件]
(use-package rime
  :custom
  (default-input-method "rime"))

# 安装rime包
# M-x list-packages，然后C-s搜 "rime"，按 i 标记，按 x 执行
```

#### II. 部署
```text
# \: 默认vim/neovim的那个 leader_key，就是Enter/RETURN上面的那个键。

# 先按下 C-\，来动态加载rime这个包，然后会提示要在自己的emacs配置文件处，创建rime文件夹。yes就是了

# 然后 M-x rime-open-configuration 来打开 [部署rime的配置文件]

# 我个人的配置在 ~/.config/emacs/rime/default.custom.yaml 这里，还没打造出一套Emacs个人风格快捷键的也可以先用编辑器（比如青春版Emacs: nano），来在终端里编辑文件

# 加上这里的配置
patch:
  schema_list:
    - schema: double_pinyin
  menu/page_size: 9

# 接下来重新配置
M-x rime-deploy

# 接下来设置默认激活emacs-rime的输入法快捷键
;; 用 Control + Space 来切换由狗哥开发的Emacs-rime的激活输入法按键
(global-set-key (kbd "C-SPC")         'toggle-input-method)
```

#### III. 启动
在 GNU Emacs 上按下 `C-SPC`(Control + Space) 来切换输入法，应该就是没有问题的了。

愉快地在 `KDE on Wayland / Hyprland` 上的 `GNU Emacs` 来享受打字吧！
