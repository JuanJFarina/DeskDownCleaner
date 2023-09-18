@echo off

set "downloadsFolder=%USERPROFILE%\Downloads"
set "desktopFolder=%USERPROFILE%\Desktop"
set "documentsFolder=D:\Documentos"
set "videosFolder=D:\Videos"
set "musicFolder=D:\Musica"
set "imagesFolder=D:\Imagenes"
set "unrevisedFolder=D:\Ordenar"

rem Create destination folders if they don't exist
if not exist "%documentsFolder%" mkdir "%documentsFolder%"
if not exist "%videosFolder%" mkdir "%videosFolder%"
if not exist "%musicFolder%" mkdir "%musicFolder%"
if not exist "%imagesFolder%" mkdir "%imagesFolder%"
if not exist "%unrevisedFolder%" mkdir "%unrevisedFolder%"

rem Move folders from Downloads
for /D %%I in ("%downloadsFolder%\*") do (
    echo Moving folder: "%%I"
    xcopy "%%I" "%unrevisedFolder%\%%~nxI" /E /I
    rd /S /Q "%%I"
)

rem Move folders from Desktop
for /D %%I in ("%desktopFolder%\*") do (
    echo Moving folder: "%%I"
    xcopy "%%I" "%unrevisedFolder%\%%~nxI" /E /I
    rd /S /Q "%%I"
)

rem Move document files
move "%downloadsFolder%\*.pdf" "%documentsFolder%"
move "%downloadsFolder%\*.docx" "%documentsFolder%"
move "%downloadsFolder%\*.txt" "%documentsFolder%"

move "%desktopFolder%\*.pdf" "%documentsFolder%"
move "%desktopFolder%\*.docx" "%documentsFolder%"
move "%desktopFolder%\*.txt" "%documentsFolder%"

rem Move video files
move "%downloadsFolder%\*.mp4" "%videosFolder%"
move "%downloadsFolder%\*.wmv" "%videosFolder%"
move "%downloadsFolder%\*.avi" "%videosFolder%"

move "%desktopFolder%\*.mp4" "%videosFolder%"
move "%desktopFolder%\*.wmv" "%videosFolder%"
move "%desktopFolder%\*.avi" "%videosFolder%"

rem Move music files
move "%downloadsFolder%\*.mp3" "%musicFolder%"
move "%downloadsFolder%\*.wav" "%musicFolder%"
move "%downloadsFolder%\*.flac" "%musicFolder%"
move "%downloadsFolder%\*.m4a" "%musicFolder%"

move "%desktopFolder%\*.mp3" "%musicFolder%"
move "%desktopFolder%\*.wav" "%musicFolder%"
move "%desktopFolder%\*.flac" "%musicFolder%"
move "%desktopFolder%\*.m4a" "%musicFolder%"

rem Move image files
move "%downloadsFolder%\*.jpg" "%imagesFolder%"
move "%downloadsFolder%\*.jpeg" "%imagesFolder%"
move "%downloadsFolder%\*.png" "%imagesFolder%"
move "%downloadsFolder%\*.gif" "%imagesFolder%"
move "%downloadsFolder%\*.webp" "%imagesFolder%"
move "%downloadsFolder%\*.svg" "%imagesFolder%"

move "%desktopFolder%\*.jpg" "%imagesFolder%"
move "%desktopFolder%\*.jpeg" "%imagesFolder%"
move "%desktopFolder%\*.png" "%imagesFolder%"
move "%desktopFolder%\*.gif" "%imagesFolder%"
move "%desktopFolder%\*.webp" "%imagesFolder%"
move "%desktopFolder%\*.svg" "%imagesFolder%"

echo Files moved successfully.

@echo off

echo Deleting files in the Downloads folder: %downloadsFolder%
if exist "%downloadsFolder%\*" (
    del /q "%downloadsFolder%\*"
    echo Files deleted successfully from the Downloads folder.
) else (
    echo No files found in the Downloads folder.
)

@echo off

echo Deleting files in the Desktop folder: %desktopFolder%
if exist "%desktopFolder%\*" (
    del /q "%desktopFolder%\*"
    echo Files deleted successfully from the Desktop folder.
) else (
    echo No files found in the Desktop folder.
)
