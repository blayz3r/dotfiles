# This is a sample commands.py.  You can add your own commands here.
#
# Please refer to commands_full.py for all the default commands and a complete
# documentation.  Do NOT add them all here, or you may end up with defunct
# commands when upgrading ranger.

# You can import any python module as needed.
# You always need to import ranger.api.commands here to get the Command class:
from ranger.api.commands import *
import os
import re
import subprocess
import sys
from functools import partial
from pathlib import Path

from ranger.api.commands import Command
from ranger.ext.get_executables import get_executables
# A simple command for demonstration purposes follows.
FZF_DEFAULT_OPTS = """\
--height=30 --inline-info --prompt="❯ " \
--bind=ctrl-space:toggle+up,ctrl-d:half-page-down,ctrl-u:half-page-up \
--bind=alt-v:toggle-preview,alt-j:preview-down,alt-k:preview-up \
--color=bg+:#282c34,bg:#24272e,fg:#abb2bf,fg+:#abb2bf,hl:#528bff,hl+:#528bff \
--color=prompt:#61afef,header:#566370,info:#5c6370,pointer:#c678dd \
--color=marker:#98c379,spinner:#e06c75,border:#282c34 \
"""
# -----------------------------------------------------------------------------

# Any class that is a subclass of "Command" will be integrated into ranger as a
# command.  Try typing ":my_edit<ENTER>" in ranger!


class my_edit(Command):
    # The so-called doc-string of the class will be visible in the built-in
    # help that is accessible by typing "?c" inside ranger.
    """:my_edit <filename>
    A sample command for demonstration purposes that opens a file in an editor.
    """

    # The execute method is called when you run this command in ranger.
    def execute(self):
        # self.arg(1) is the first (space-separated) argument to the function.
        # This way you can write ":my_edit somefilename<ENTER>".
        if self.arg(1):
            # self.rest(1) contains self.arg(1) and everything that follows
            target_filename = self.rest(1)
        else:
            # self.fm is a ranger.core.filemanager.FileManager object and gives
            # you access to internals of ranger.
            # self.fm.thisfile is a ranger.container.file.File object and is a
            # reference to the currently selected file.
            target_filename = self.fm.thisfile.path

        # This is a generic function to print text in ranger.
        self.fm.notify("Let's edit the file " + target_filename + "!")

        # Using bad=True in fm.notify allows you to print error messages:
        if not os.path.exists(target_filename):
            self.fm.notify("The given file does not exist!", bad=True)
            return

        # This executes a function from ranger.core.acitons, a module with a
        # variety of subroutines that can help you construct commands.
        # Check out the source, or run "pydoc ranger.core.actions" for a list.
        self.fm.edit_file(target_filename)

    # The tab method is called when you press tab, and should return a list of
    # suggestions that the user will tab through.
    # tabnum is 1 for <TAB> and -1 for <S-TAB> by default
    def tab(self, tabnum):
        # This is a generic tab-completion function that iterates through the
        # content of the current directory.
        return self._tab_directory_content()

    
class fzf_select(Command):
    """
    Find a file or directory using fzf and fd.
    Add - d to select only dirs and / or -ngi to ignore gitignore.
    """

    def execute(self):
        """Execute the command."""
        fd_cmd = "fdfind"
        if fd_cmd not in get_executables():
            self.fm.notify(f"Couldn't find {fd_cmd} on the PATH.", bad=True)
            return

        only_dirs = True if self.arg(1) == "-d" else False
        command = (
            f"{fd_cmd} --type {'d' if only_dirs else 'f'} --hidden --follow "
            f"--exclude .git {'--color=always ' if not only_dirs else ''}"
        )
        no_git_ignore = (
            True
            if self.arg(1) == "-d" and self.arg(2) or self.arg(1) == "-ngi"
            else False
        )
        if no_git_ignore:
            command += "--no-ignore-vcs "
        preview_cmd = (
            "bat --color always --style numbers --theme TwoDark --line-range :200 {2}"
        )
        if self.arg(1) == "-d":
            preview_cmd = (
                "lsd -F --tree --depth 2 --color=always --icon=always {2} | head -200"
            )
        fzf_cmd = f"FZF_DEFAULT_OPTS='{FZF_DEFAULT_OPTS}' fzf"
        command += (
            f"| devicon-lookup {'--color' if not only_dirs else ''} | "
            f"{fzf_cmd} {'--ansi' if not only_dirs else ''} --preview '{preview_cmd}' +m"
        )

        fzf = self.fm.execute_command(command, stdout=subprocess.PIPE)
        stdout, _ = fzf.communicate()
        if fzf.returncode == 0:
            out = stdout.decode("utf-8").rstrip("\n")[2:]  # due to devicons
            fzf_file = os.path.abspath(out)
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)

class fzf_z(Command):
    """Find a directory using fzf and z."""

    def execute(self):
        """Execute the command."""
        z_sh = '/home/tate/.zplug/repos/rupa/z/z.sh'
        if not os.path.isfile(z_sh) or z_sh is None:
            return

        command = f'. {z_sh} && _z -l 2>&1'
        preview_cmd = (
            'lsd -F --tree --depth 2 --color=always --icon=always {3} | head -200'
        )
        fzf_cmd = f"FZF_DEFAULT_OPTS='{FZF_DEFAULT_OPTS}' fzf"
        command += (
        f" | devicon-lookup | {fzf_cmd} --no-sort --tac --preview='{preview_cmd}'"
        )
        command += ' | sed "s/^\\W\\s[0-9,.]* *//"'

        fzf = self.fm.execute_command(command, stdout=subprocess.PIPE)
        stdout, _ = fzf.communicate()
        if fzf.returncode == 0:
            fzf_dir = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
            self.fm.cd(fzf_dir)

class fzf_parents(Command):
    """Show parent dirs with fzf."""

    def execute(self):
        """Execute the command."""
        selection = [str(f) for f in self.fm.thistab.get_selection()][0]
        path = Path(selection).parent
        parents = [str(path)]
        while str(path) != '/':
            path = path.parent
            parents.append(str(path))
        parents = '\\n'.join(parents)  # type: ignore

        preview_cmd = (
            'lsd -F --tree --depth 2 --color=always --icon=always {2} | head -200'
        )
        fzf_cmd = f"FZF_DEFAULT_OPTS='{FZF_DEFAULT_OPTS}' fzf"
        command = (
            f"printf '{parents}' | devicon-lookup | {fzf_cmd} --preview '{preview_cmd}'"
        )
        fzf = self.fm.execute_command(command, stdout=subprocess.PIPE)
        stdout, _ = fzf.communicate()
        if fzf.returncode == 0:
            out = stdout.decode('utf-8').rstrip('\n')[2:]  # due todevicons
            fzf_dir = os.path.abspath(out)
            self.fm.cd(fzf_dir)
# fzf_locate
class fzf_locate(Command):
    """
    :fzf_locate
    Find a file using fzf.
    With a prefix argument select only directories.
    See: https://github.com/junegunn/fzf
    """
    def execute(self):
        import subprocess
        if self.quantifier:
            command="locate  mnt/d | fzf -e -i"
        else:
            command="locate  mnt/d | fzf -e -i"
        fzf = self.fm.execute_command(command, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.decode('utf-8').rstrip('\n'))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)
