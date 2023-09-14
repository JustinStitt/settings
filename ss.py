#!/usr/bin/env python
# strncpy setup script, just give filename like drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c
import argparse
import subprocess
from pathlib import Path
from time import sleep
from get_prefix import get_prefixes

"""
git checkout mainline

b4 prep -n "strncpy/drivers/gpu/drm/gma500/oaktrail_lvds_i2c.c"

# get prefix (use Kees' get prefix python script maybe)
./get_prefix.py

# set cover letter prefix
b4 prep --edit-cover

# create temporary file with subject prefix and strncpy-blurb and empty-diff commit
git commit -s --allow-empty -F tmp.txt

"""

if __name__ == "__main__":
    arg_parser = argparse.ArgumentParser()
    arg_parser.add_argument("path", type=Path, help="path")
    args = arg_parser.parse_args()

    print("Checking out mainline...")
    subprocess.run(["git", "checkout", "mainline"])

    print(f"b4 prep -n {args.path}")
    subprocess.run(["b4", "prep", "-n", str(args.path)])

    print("Getting prefix...")
    prefix = get_prefixes("unknown", [str(args.path)])
    assert prefix and len(prefix) > 2, "Couldn't find a valid prefix, check manually"
    prefix = prefix + " refactor deprecated strncpy"

    print("Modifying cover letter")
    # subprocess.run(["git", "commit", "--amend", "--allow-empty"])
    # proc = subprocess.Popen(["git", "commit", "--amend", "--allow-empty"])
    raw_cover_letter_fd = open(".git/COMMIT_EDITMSG", "r")
    raw_cover_letter = raw_cover_letter_fd.read()
    idx_of_fold = raw_cover_letter.index("---")
    rest = raw_cover_letter[idx_of_fold:]
    new_msg = f"{prefix}\n\n{rest}"

    subprocess.run(["git", "commit", "--allow-empty", "--amend", "-m", new_msg])
    print("Done modifying cover letter")

    print("Adding empty commit on top")

    strncpy_blurb = open("strncpy-blurb.txt", "r").read()
    subprocess.run(
        ["git", "commit", "--allow-empty", "-m", f"{prefix}\n\n{strncpy_blurb}"]
    )

    print("Done. Happy Coding ｡◕‿◕｡")
