#!/usr/bin/env python3
import sys
from pathlib import Path

print(sys.argv)

rebase_msg_path = Path(sys.argv[1])

rebase_msg = rebase_msg_path.read_text().split("\n")
for idx, line in enumerate(rebase_msg):
    if idx == 0:
        continue
    rebase_msg[idx] = rebase_msg[idx].replace("pick", "f", 1)


rebase_msg_path.write_text("\n".join(rebase_msg))
