# SteelSeries-Video-Timestamp-Fixer
When editing videos in the steel series engine, the creation and modification date of the source files get altered, even though the source files remain unchanged, this script fixes this
## How does it work
The default name of a video file created by steel series is "*GameName*__yyyy-mm-dd__hh-mm-ss"  
Therefore the name contains the date and time of the creation of the clip  
The script scrapes this data and parses it  
Then it will execute a command that changes the "CreationTime" and "LastWriteTime" to the parsed timestamp  

## How to use
1. Drag the ```main.lua``` file into the folder that contains the source files of the steel series clips
2. Open cmd.exe
3. Execute ```main.lua```
4. Wait
5. Profit
