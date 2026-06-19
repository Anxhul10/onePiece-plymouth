<!--markdownlint-disable MD013-->
<!--markdownlint-disable MD025-->
<!--markdownlint-disable MD041-->
## Demo Video

[Watch the demo video](https://vimeo.com/1121696476)

<img width="400" height="225" alt="one_piece_plymouth (1080p)" src="https://github.com/user-attachments/assets/2a3dcdfc-6d4f-4109-8a90-1b7af520e39a" />

### Installation on Ubuntu ,Fedora & Arch Linux(Single CLI - Easiest)

```bash
curl -s -L -o /tmp/onePiece-plymouth.sh https://raw.githubusercontent.com/Anxhul10/onePiece-plymouth/refs/heads/develop/main.sh && sudo bash /tmp/onePiece-plymouth.sh
```

## Installation On Fedora Linux
1. change directory

```
cd  /usr/share/plymouth/themes
```

2. clone repo
```
sudo git clone https://github.com/Anxhul10/onePiece-plymouth.git
```

3. set plymouth theme
```
sudo plymouth-set-default-theme onePiece-plymouth -R
```

4. manually rebuild initramfs
```
sudo dracut --force
```

## Installation On Ubuntu

1. clone this repo at /usr/share/plymouth/themes

```bash
sudo git clone https://github.com/Anxhul10/onePiece-plymouth.git
```

2. Install the theme.

```bash
    sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/onePiece-plymouth/onePiece-plymouth.plymouth 120
```

3. Select the default theme.

```bash
    sudo update-alternatives --config default.plymouth
```

4. Update the initramfs image.

```bash
    sudo update-initramfs -u
```

Now reboot.

If you want to install this on < Ubuntu 16.04, change the path from /usr/share/plymouth to /lib/plymouth/ . You need to do this on the PlymouthTheme-Cat.plymouth file also.

## Installation On Arch Linux

1. clone this repo at /usr/share/plymouth/themes

```bash
sudo git clone https://github.com/Anxhul10/onePiece-plymouth.git
```
2. install plymouth if not installed 
```
sudo pacman -S plymouth
sudo systemctl enable plymouth-start.service
```
3. set this theme as default 
```
sudo plymouth-set-default-theme -R onePiece-plymouth
```
Now reboot. 

## Development

### METHOD 1

#### 1. clone this repo at /usr/share/plymouth/themes

  ```bash
  sudo git clone https://github.com/Anxhul10/onePiece-plymouth.git
  ```

#### 2. add the theme to the default.plymouth

  ```bash
  sudo update-alternatives --install /usr/share/plymouth/themes/default.plymouth default.plymouth /usr/share/plymouth/themes/onePiece-plymouth/onePiece-plymouth.plymouth 120
  ```

```bash
sudo update-alternatives --config default.plymouth
```

#### OUTPUT

```bash
There are 4 choices for the alternative default.plymouth (providing /usr/share/plymouth/themes/default.plymouth).

  Selection    Path                                                                     Priority   Status
------------------------------------------------------------
  0           /usr/share/plymouth/themes/onePiece-plymouth/onePiece-plymouth.plymouth   120       auto mode
  1           /usr/share/plymouth/themes/bgrt/bgrt.plymouth                             100       manual mode
* 2           /usr/share/plymouth/themes/onePiece-plymouth/onePiece-plymouth.plymouth   120       manual mode
  3           /usr/share/plymouth/themes/spinner/spinner.plymouth                       70        manual mode

Press <enter> to keep the current choice[*], or type selection number: ^C

```

and build a new initramfs to apply the changes

```bash
sudo update-initramfs -u -k all
```

⚠️ Plymouth draws over your desktop. Please note that you will need Terminal 2 on a different workspace to close Plymouth. ⚠️

#### Terminal 1

##### Tab 1

###### Start Plymouth daemon

```bash
sudo plymouthd --no-daemon --debug
```

##### Tab 2

###### Show splash

```bash
sudo plymouth show-splash
```

> [!NOTE]
> This will take over your screen and prevent you from running other apps until Plymouth is stopped.
> To exit, press Ctrl + Alt + F3 to switch to a virtual terminal, then run the command below.
> And to exit virtual terminal use Ctrl + Alt + F2

#### Terminal 2

With this terminal you can test the following modes and user interactions.
When you're done, you can close Plymouth

```bash
sudo plymouth quit
```

## METHOD 2

### 1. **COPY PLYMOUTH TO /usr/share/plymouth/themes**

```bash
sudo cp -r ~/path/to/plymouth /usr/share/plymouth/themes
```

### 2. **Run the test-script** or run ``` sudo plymouthd ; sudo plymouth --show-splash ; sleep 10 ; sudo killall plymouthd ```

Make the script executable and run it:

```bash
chmod +x run-plymouth-test.sh
./run-plymouth-test.sh
```

> [!NOTE]
> This will take over your screen while running. To switch to a virtual terminal use `Ctrl+Alt+F3`. To return to your graphical session use `Ctrl+Alt+F2` (or the > F1–F7 key your distro uses).

# Example

## 1. **Change directory**

```bash
cd /usr/share/plymouth/themes
```

## 2. **Copy theme**

```bash
sudo cp -r ~/CodeVault/github/onePiece-plymouth .
```

## Credits

Original artwork: [One Piece Logo by Miiizi](https://pin.it/5R9bQJWi4)
