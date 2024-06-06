# Simple HTTP Server for Windows w/ custom Startpage

Simple HTTP Server & custom Startpage for the browser:

- on Windows using Python & Bash,
- on Linux using Lighttpd.

## Windows

1. Make sure Git Bash & Python are installed (you probably do have those anyway…)

2. Make sure the `bash` & `python` are added to PATH

   Try:

   - `bash --version`,
   - `python --version`,

   if not, add them to environmental variables, e.g.,

   - `"C:\Program Files\Python\"` or `"C:\Users\\[username]\AppData\Local\Programs\Python"`,
   - `"C:\Program Files\Git\bin"`.

3. Edit the directory path in `./config/scriptStartup.bat` (default: `"E:\0PROGRAMOWANIE Projekty\Python WebServer HTTP\config\httpserver.sh"`)

4. Edit the directory path in `./config/httpserver.sh` (default: `DIR="/e/0PROGRAMOWANIE Projekty/Python WebServer HTTP/"`)

5. Edit the port in `./config/httpserver.sh` (default: `PORT=80`)

6. Copy the `./config/scriptStartup.bat` to `C:\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp` (copy the file $\Rightarrow$ go to StartUp dir $\Rightarrow$ paste link here, or just paste the file)

7. Check status of the server w/ following command `bash E:\0PROGRAMOWANIE Projekty\Python WebServer HTTP\config\httpserver.sh" status` (remember to change the path to the ".sh" file)

8. Run `bash E:\0PROGRAMOWANIE Projekty\Python WebServer HTTP\config\httpserver.sh"` to see available commands (`Usage: ./httpserver.sh {start|stop|status|restart}`). Each command must include the path to the script (just Windows things, might try adding the dir path to PATH $\Rightarrow$ `bash httpserver.sh status` might work, idk haven't tested)

## Linux

1. Install lighttpd (`dnf install lighttpd` <sup style="font-size: 7px; color: #dad;">(Fedora KDE supremacy)</sup>)

2. Open the config `sudo vi /etc/lighttpd/lighttpd.conf` (write `/server_root` to find element in vi or just use different editor)

3. Change the root dir `var.server_root = "/var/www"`

4. Uncomment the bind to localhost `server.bind = "localhost"`

5. Change port `server.port = 80`

6. Change website dir `server.document-root = server_root + "/browserStartingPage"` ("browserStartingPage" is the name of the directory where our website is located)

7. Move the files to specified location (e.g., `sudo mv ~/browserStartingPage/ /var/www/`)

8. Enable the service, restart it (not necessary I guess) and check if it is working `systemctl enable lighttpd --now && ststemctl restart lighttpd && systemctl status lighttpd`

## Setup custom starting page

### Firefox

1. Download the extension [New Tab Override](https://addons.mozilla.org/pl/firefox/addon/new-tab-override/)

2. Open settings `about:preferences#home` and go to "Home" $\Rightarrow$ "New windows and Tabs" section

3. Set the "New Window" to "other" and paste the link `http://localhost`

4. Open the New Tab Override extension settings, set the option to "custom" and paste the link `http://localhost`

### Chromium browsers are trash because of `Manifest V3`, stop using them
