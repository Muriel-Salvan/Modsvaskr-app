@ECHO OFF

REM Build a packaged version of Modsvaskr, ready to be uploaded on NexusMods.

REM Uses the following environment variables:
REM * *sevenZipDir*: Path to the 7-zip utility [default: C:\Program Files\7-Zip]

REM Set default values
IF NOT DEFINED sevenZipDir (
  set "sevenZipDir=C:\Program Files\7-Zip"
)

del Modsvaskr.7z
"%sevenZipDir%\7z.exe" a Modsvaskr.7z Gemfile Install.cmd Update.cmd Modsvaskr.cmd CHANGELOG.md LICENSE README.md docs\

md_to_bbcode --input README.md --output README.bbcode
