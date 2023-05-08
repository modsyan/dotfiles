from __future__ import (absolute_import, division, print_function)

from ranger.api.commands import *
from ranger_udisk_menu.mounter import mount

import os

class emptytrash(Command):
    """:empty

    Empties the trash 
    """

    def execute(self):
        HOME = os.environ['HOME']
        self.fm.run(f'trash-empty')


class code(Command):
    def execute(self):
        dirname = self.fm.thisdir.path
        codecmd = ["code", dirname]
        self.fm.execute_command(codecmd)
