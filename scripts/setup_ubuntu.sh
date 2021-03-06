if [ -f /etc/debian_version ]; then
  DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

  mkdir -p $DIR/temp

  echo -e '\e[34;47mInstalling prerequisites, update and upgrade apt\e[0m'
  sudo apt update
  sudo apt install -y vim
  sudo apt install -y git
  sudo apt install -y curl
  sudo apt install -y gimp
  sudo apt install -y tmux
  sudo apt -f upgrade

  # Install NodeJS
  echo -e '\e[34;47mInstalling NodeJS\e[0m'
  curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
  sudo apt install -y nodejs

  # Install Chrome
  echo -e '\e[34;47mInstalling Chrome\e[0m'
  sudo apt-get install -y libappindicator1
  sudo apt-get install -f
  wget -O $DIR/temp/google-chrome-stable.deb https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  sudo dpkg -i $DIR/temp/google-chrome-stable.deb
  sudo sh -c 'echo "### THIS FILE IS AUTOMATICALLY CONFIGURED ###\n# You may comment out this entry, but any other modifications may be lost.\ndeb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list'
  sudo apt install -y google-chrome-stable

  # Install VS Code
  echo -e '\e[34;47mInstalling VS Code Stable and Insiders'
  curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
  sudo mv microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
  sudo sh -c 'echo "deb [arch=amd64] http://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
  sudo apt update
  sudo apt install code code-insiders

  # Install peek
  # sudo apt-get install software-properties-common python-software-properties
  sudo add-apt-repository ppa:peek-developers/stable
  sudo apt update
  sudo apt install peek

  # Configure Ubuntu
  echo -e '\e[34;47mConfiguring Ubuntu\e[0m'
  gsettings set com.canonical.Unity.Launcher favorites "['application://ubiquity.desktop', 'application://google-chrome.desktop', 'application://org.gnome.Terminal.desktop', 'application://org.gnome.Nautilus.desktop', 'application://code-insiders.desktop', 'application://slack.desktop', 'application://update-manager.desktop']"
  gsettings set com.canonical.Unity.Launcher launcher-position "Bottom"

  # Install nvm
  curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.5/install.sh | bash
  nvm install 8

  # Install dotfiles
  echo -e '\e[34;47mInstalling dotfiles\e[0m'
  npm install
  node $DIR/../cli.js install

  # Sourcing ~/.bashrc
  echo -e '\e[34;47mSourcing ~/.bashrc\e[0m'
  source ~/.bashrc

  # Install development packages
  echo -e '\e[34;47mInstalling development packages\e[0m'
  sudo apt-get install -y libx11-dev libxkbfile-dev fakeroot rpm # Microsoft/vscode

  # Install global npm packages
  echo -e '\e[34;47mInstalling global npm packages\e[0m'
  npm i -g fkill yo generator-code grunt gulp

  # Clean up
  echo -e '\e[34;47mCleaning up\e[0m'
  rm -rf $DIR/temp
else
  echo "Only Debian is supported"
fi
