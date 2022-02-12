# To the extent possible under law, the author(s) have dedicated all
# copyright and related and neighboring rights to this software to the
# public domain worldwide. This software is distributed without any warranty.
# You should have received a copy of the CC0 Public Domain Dedication along
# with this software.
# If not, see <http://creativecommons.org/publicdomain/zero/1.0/>.

# ~/.bash_profile: executed by bash(1) for login shells.

# The copy in your home directory (~/.bash_profile) is yours, please
# feel free to customise it to create a shell
# environment to your liking.  If you feel a change
# would be benifitial to all, please feel free to send
# a patch to the msys2 mailing list.

# User dependent .bash_profile file

# source the users bashrc if it exists
if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# Set PATH so it includes user's private bin if it exists
# if [ -d "${HOME}/bin" ] ; then
#   PATH="${HOME}/bin:${PATH}"
# fi

# Set MANPATH so it includes users' private man if it exists
# if [ -d "${HOME}/man" ]; then
#   MANPATH="${HOME}/man:${MANPATH}"
# fi

# Set INFOPATH so it includes users' private info if it exists
# if [ -d "${HOME}/info" ]; then
#   INFOPATH="${HOME}/info:${INFOPATH}"
# fi

export GOROOT=/mingw64/lib/go
export GOPATH=/mingw64

export PATH=$PATH:/c/Program\ Files\ \(x86\)/PICO-8
export PATH=$PATH:/c/msys64/home/Fabian/.gem/ruby/2.3.0/bin
export PATH=$PATH:/c/RailsInstaller/Ruby2.3.0/bin
export PATH=$PATH:/c/Graphviz2.38/bin
export PATH=$PATH:/c/cc64/bin
export PATH=$PATH:/c/Users/Fabian/Documents/Emulatorer/NES/fceux
export PATH=$PATH:/c/Program\ Files\ \(x86\)/LilyPond/usr/bin
export PATH=$PATH:/c/Program\ Files\ \(x86\)/vanBasco\'s\ Karaoke\ Player
export PATH=$PATH:/c/bin
export PATH=$PATH:/c/bin/yy-chr
export PATH=$PATH:/mingw64/bin
export PATH=$PATH:/c/Program\ Files/Tiled
