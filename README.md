# Stronghold for mods acting like companions: The Modsvaskr

**Command-line UI handling a full Mods' ecosystem for Bethesda's games.**

**Please be aware that this tool is still in Beta version**
That means its UI is still not polished, a lot of features are still to be implemented, and bugs will roam in some parts.
You can check a list of opened tickets (and contribute by adding more when you find issues or propose new features) in its [Github's repository](https://github.com/Muriel-Salvan/modsvaskr/issues).

## Description

Heavy mods' user often have **hard times when they want to get a stable modded game**.
A lot of tools are already helping a lot:
* [Mod Organizer](https://www.nexusmods.com/skyrimspecialedition/mods/6194)
* [LOOT](https://loot.github.io/)
* [xEdit](http://tes5edit.github.io/)
* Plenty of tools to create patches, merge, generate content like LODs etc...

Most of the time, gamers have to perform the following tasks every time their mods list changes:
* **Read carefully** all the descriptions of each mod they use.
* **Re-install mods having patches** for newly added mods (using FOMOD installers for the easiest, and search/install patches from NexusMods for others).
* **Correct all errors and warnings** reported by tools like LOOT (change mods list upon incompatibilities, clean esps from dirty records...).
* **ESLify some esps** if they need to get below the 254 esps limit of the new mods.
* **Merge esps** if eslification is not enough to keep below the limit.
* **Manually patch some mods** using tools like xEdit or the Creation Kit, or sometimes files renaming.
* **Re-generate all generated content**, like LODs, FNIS animations, Patches...
* And **test, test, test** - usually breaking the immersive experience of discovering added content naturally in game: to test new mods they usually have to visit changed locations, fly around in high-speed, summon NPCs to check for black faces, etc...

Given those tedious tasks, gamers have basically few choices:
* Rely only on mods lists already tested and curated by other modders (like the excellent [S.T.E.P. guide](https://wiki.step-project.com/Main_Page)), or
* Keep the mods number relatively small, and remove mods before adding new ones (therefore having to start games from scratch), or
* Learn skills of an experienced modder to be able to solve the previous points easily (takes a loooot of time, comprehension and curiosity), or
* Accept to have a game that is not stable, ruining the gaming experience, or
* Ask Modsvaskr for help ;-)

Modsvaskr is here to help gamers do the following:
* **Automate repeatible and tedious tasks** they have to do while updating their mods list (patchs, LODs...).
* **Automate lot of testing** so that they can detect quickly without manually tests, and without having to discover mods before-hand and ruin their in-game experience (automatically load changed locations, new NPCs...).
* **Detect issues early**, so that they can focus of solving the most important issues in their mods list.
* Simplify the way non-modder gamers can **improve and automate their gaming experience**.

The goal as a gamer using Modsvaskr is to be able to:
* **Easily update a mods list** without fear or forgetting some processing, for a large number of mods (over 1000).
* Know quickly and without human intervention **what could go wrong** in using all those mods.
* Solve problems that could be **solved automatically**.
* **Not spoil the mods' content** while testing for in-game stability.

## Games

The list of games that should be compatible with Modsvaskr are the following:
* Skyrim.
* Skyrim Special Edition - Tested successfully.
* Fallout 4.

The list of supported games in the current version of Modsvaskr is found in the [`lib/modsvaskr/games`](https://github.com/Muriel-Salvan/modsvaskr/tree/master/lib/modsvaskr/games) folder of the modsvaskr's Rubygem.
Adding a new compatible game should be as easy as adding a file in this directory and implementing its API in Ruby.

## Requirements

3 tools and 2 mods are needed for Modsvaskr to work:
* [Ruby 2.6.6 with DevKit](https://rubyinstaller.org/downloads/) as this is the language Modsvaskr is written in - Don't install a version greater or equal to 2.7 for the time being as some dependencies don't work well on Windows in those versions.
* [SKSE](https://skse.silverlock.org/) to support a lot of scripting. - You have to install this in your Bethesda game.
* [xEdit](https://www.nexusmods.com/skyrimspecialedition/mods/164) to get information from mods. - You have to install this in a common programs directory (like Program Files), and not in your game folder.
* [AutoLoad](https://www.nexusmods.com/skyrimspecialedition/mods/41478) to be able to automatically restart the game after a CTD. - Install this like any other mod.
* [AutoTest](https://www.nexusmods.com/skyrimspecialedition/mods/42520) to be able to automatically run in-game testing. - Install this like any other mod.

## Installation

**Modsvaskr application packages are downloadable from [Nexus Mods](https://www.nexusmods.com/skyrimspecialedition/mods/42521).**

### Uncompress the archive in a common programs location

Modsvaskr installs in a common programs directory (like xEdit), **not in your game, and not like a mod**.

Just uncompress the whole archive in a common location. In this README the location `C:\Programs\Modsvaskr` is taken as an example.

### Install dependencies

Once uncompressed, execute the file `Install.cmd` to install the tool's dependencies.

### Configure paths to your games

A simple Yaml configuration file is present in the program's folder: `C:\Programs\Modsvaskr\modsvaskr.yaml`. Edit it using any text editor (like Notepad) and change its paths according to your own configuration: your games, xEdit, 7-zip...

Example:
```yaml
---
# Specify the list of Bethesda games that should be handled
games:
  - name: Skyrim SE
    # The installation path (containing the launch executable).
    path: C:\Program Files (x86)\Steam\steamapps\common\Skyrim Special Edition
    # Possible types are defined as the file names in vendor/bundle/ruby/<version>/gems/modsvaskr-<version>/lib/modsvaskr/games/*.rb
    type: skyrim_se
    # The executable to be launched to run the game.
    launch_exe: skse64_loader.exe

# Path where xEdit is installed
xedit: C:\Programs\SSEEdit 4_0_3-164-4-0-3-1575326827
```

### Update Modsvaskr

If you want to update your Modsvaskr to the latest available version, you just need to execute the file `Update.cmd`.

## Usage

**Please refer to [modsvaskr's documentation](https://github.com/Muriel-Salvan/modsvaskr/blob/master/README.md#usage) page for a complete reference of its usage.**

## How to modify or extend Modsvaskr?

Modsvaskr is written in Ruby, making it easy to modify and extend to any user, without any compilation/packaging steps.

Internally, Modsvaskr's code is brought by a Rubygem (whose source is on [Github's Modsvaskr repository](https://github.com/Muriel-Salvan/modsvaskr)), and that allows you to easily use a local version of this code so that you can modify and extend freely, and even contribute back to the main repository if needed.

Here are the steps to have a local version of the modsvaskr Rubygem.

### Download a local copy of the modsvaskr Rubygem from Github

You can get a local copy of Modsvaskr Rubygem locally (in `C:\MyRubygems\Modsvaskr-rubygem` for this example), either
* by downloading and unzipping the package from https://github.com/Muriel-Salvan/modsvaskr (click on the green download button -> Download zip),
* or by using git (download and install from https://git-scm.com/download/win if needed) and cloning the repository:
  ```bash
  git clone https://github.com/Muriel-Salvan/modsvaskr.git "C:\MyRubygems\Modsvaskr-rubygem"
  ```

### Make your Modsvaskr's installation use your local modsvaskr Rubygem

For this you edit the `Gemfile` of your Modsvaskr installation (`C:\Programs\Modsvaskr\Gemfile`) with any text editor and add the path to your Rubygem to the line `gem 'modsvaskr'`:
```ruby
gem 'modsvaskr', path: 'C:\MyRubygems\Modsvaskr-rubygem'
```

You can undo this edit to revert back to using the official Modsvaskr's Rubygem anytime.

### Update your Modsvaskr's installation

Each time you modify your Modsvaskr's `Gemfile`, you need to update your installation by executing `Update.cmd`.

### Enjoy

Now that your Modsvask'r installation is using a local version of the modsvaskr's Rubygem you can change its code from `C:\MyRubygems\Modsvaskr-rubygem` the way you want, modify it, extend it etc...
Changes you perform there are automatically taken into account when you launch Modsvaskr (using `Modsvaskr.cmd`, even from Mod Organizer).

## Developers corner

### Build a packaged version of Modsvaskr's application from the source

This can be achieved using the `build.cmd` tool, from a command-line session:

1. You'll need [7-zip](https://www.7-zip.org/) to package Modsvaskr. If 7-zip is installed to a non-standard location, specify the path to 7-zip using the `sevenZipDir` variable.
  Example:
  ```bat
  set "sevenZipDir=C:\Programs\7zip"
  ```
  
2. You'll need [md_to_bbcode](https://github.com/Muriel-Salvan/md_to_bbcode) to generate documentation for NexusMods. Make sure it is installed (meaning that `md_to_bbcode --version` works).
  
3. Launch the `build.cmd` command from the root of the repository:
  ```bat
  build.cmd
  ```
  
  This will generate a packaged version of Modsvaskr in the file `Modsvaskr.7z`.
  It will also generate a `README.bbcode` file which is a conversion of this `README.md` file in BBCode, ready to be copy-pasted in the NexusMod's description.

## Contributions

Don't hesitate to fork the [Modsvaskr's application Github repository](https://github.com/Muriel-Salvan/Modsvaskr-app) and contribute with Pull Requests.

Modsvaskr's main code is done by the modsvaskr Rubygem, which you are welcome to fork and contribute to from the [Modsvaskr's Rubygem Github repository](https://github.com/Muriel-Salvan/modsvaskr).

Tickets tracking bugs and features of the modsvaskr's Rubygem are found in [modsvaskr's Github tickets](https://github.com/Muriel-Salvan/modsvaskr/issues). Don't hesitate to create new ones.
