# Copyright 2016 Kees Cook <keescook@chromium.org>
# License: GPLv2+
#
# Figure out the top 5 most common prefixes used for a given set of files,
# within the last 64 commits touching those files, with the first argument
# being the fall-back when nothing is better.
#
# e.g.
# 	$ get-prefix unknown kernel/seccomp.c
# 	seccomp:
# 	signal:
# 	ptrace, seccomp:
# 	syscalls:
# 	syscall_get_arch:
#
import sys, re, fnmatch, subprocess, operator
from icecream import ic


# Update the copy in split-on-maintainer...
def get_prefixes(area, paths):
    # "--follow" is very slow, but sometime needed:
    # ret = subprocess.run(['git', 'log', '-n', '64', '--no-merges', '--oneline', '--follow', '--'] + paths,
    ret = subprocess.run(
        ["git", "log", "-n", "64", "--no-merges", "--oneline", "--"] + paths,
        stdout=subprocess.PIPE,
        check=False,
    )
    commits = str(ret.stdout, "utf-8").strip().splitlines()
    prefixes = dict()
    # ic(commits)
    for commit in commits:
        title = commit.split(" ", 1)[1].strip()
        # Drop old-style []s
        if "[PATCH]" in title:
            title = title.replace("[PATCH]", "").strip()
        if "[" in title:
            prefix = title.partition("]")[0].replace("[", "").replace("]", "")
            title = title.replace("[%s]" % (prefix), "").strip()
            if not title.startswith(":"):
                prefix += ": "
            title = prefix.lower() + title
        if title.startswith('Revert "'):
            continue
        if ":" in title:
            prefix = title.rpartition(":")[0]
            # Ignore useless prefixes.
            if not prefix in ["net", "treewide"]:
                prefixes.setdefault(prefix, 0)
                prefixes[prefix] += 1
    best = 0
    prefix = None

    likely = sorted(prefixes.items(), key=operator.itemgetter(1), reverse=True)
    count = len(likely)

    if count == 0:
        print("%s:" % area)
        return

    if count > 5:
        count = 5

    # for i in range(count):
    return "%s:" % likely[0][0]


# if len(sys.argv) > 1:
#     get_prefixes(sys.argv[1], sys.argv[2:])
