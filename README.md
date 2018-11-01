# Mark Pitchless NFA

```
************************
*  Mark Pitchless NFA  *
************************
```

Putting my home dir (profile) under git control. https://github.com/markpitchless/home

## Bootstrap

1st time install into a new home directory.

```sh
cd ~
wget https://raw.githubusercontent.com/markpitchless/home/master/bin/nfa-bootstrap
chmod a+x nfa-bootstrap
./nfa-bootstrap
```

Manages home dir but doesn't have the git repo there (after extensive use having a ``~/.git`` is bad idea, not quite as bad as you might think, but don't do it ;-), instead that goes in ``~/.nfa``, with shell hooks and configs symlinked. Use the bootstrap script for that initial setup.

Having home actually be a repo was good in many ways, great user experience as
you have the full power of git to manage it all, so we try not to stray too far
from that experience or worse, invent a half baked, partly implemented VCS with
a symlink obsession and git as a back end. It is supposed to be a profile
manager, that loves symlinks and has a (fairly exposed) git back end.

## Updates

```sh
cd ~/.nfa
git pull
nfa-provision
```

## Home Linking

Nfa sym links files and folders from `~/.nfa/home/` to `~`, your home
directory. This is so you can keep them under version control in your nfa
repository but still have them in their expected locations on the system. Your
editors and tools rc files are what this is for, e.g. a version controlled
`.screenrc` in `~/.nfa/home/.screenrc` gets symlinked to `~/.screenrc` when
nfa-infect runs, which also happens during a bootstrap. Now running screen will
use your config, you can edit in the normal location (`vim ~/.screenrc`) but
commit and push your changes to your repo so they appear in all your other
logins after an `nfa-pull`.

How do we link at depth, like .config?

* Only link at the top level and basically use git to decide what to include?
* Have a file `home.list` that lists patterns to link?
* Only link dir that contain files (non-dirs)?
    * Are there any configs that only have top level dirs?

Only doing the top seems nice as git status shows what is and isn't tracked and
git lets us decide. Otherwise are we just re-implementing a rubbish git?
Also keeps us pretty close to just making home a git repo.
If we just git add and commit the file it gets picked up by other profiles
after a pull.

It does stop you only linking certain dirs on certain hosts. Well parts of
dirs, could add something to the infect logic that controls that, at least for
the top level dirs.

```sh
nfa add
nfa remove
nfa ignore
```

The above commands can be given paths in the actual home namespace and
basically map down to git commands in the .nfa/home namespace.
Ignore updates the `.gitignore` file in `.nfa/home`

```sh
nfa push
nfa pull
```

## Ideas

`.nfa/env` (`.nfa/environment`), env file loaded by all nfa commands, basically a persistant env, basic config.
