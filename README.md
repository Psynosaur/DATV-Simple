# DATV-Simple

## Prerequisite 
- **VERY IMPORTANT** at least passive cooling on the PlutoSDR in the form of heatsinks, or it might explode ¯\_(ツ)_/¯
  - Mine with big chungus metal block heatsink goes upto 45°C
- Latest beta PlutoSDR [firmware](https://github.com/F5OEO/pluto-ori-ps/wiki)

## Setup and use
1. Download [latest release](https://github.com/Psynosaur/DATV-Simple/releases) and extract to folder `DATV-Simple` and open in file explorer

2. setup mqtt broker in `pluto.json` file
   
   ```json
    {
      "action": "connect",
      "broker": {
        "broker": "192.168.2.1",
        "port": 1883,
        "username": "root",
        "password": "analog"
      },
      "topic" : "cmd/pluto/call",
      "payload": "ZS1SCI"
    }
   ```
3. double click `DATV-Start.cmd`

4. Watch this intro video on [channel calibration](https://youtu.be/-ZdQOVg26_0) and then [usage](https://www.youtube.com/watch?v=8q4WMCyKtKw) and perhaps [reception](https://youtu.be/lz3GO2zCf_Q)

5. Have fun

![image](https://github.com/Psynosaur/DATV-Simple/assets/26934113/24dcd240-e742-4776-a6a5-986730f174c4)

[Discord](https://discord.gg/szQKjRZvuZ) channel for latest developments. . . 

If you want buy me a coffee:

  [paypal.me/zs1sci](https://paypal.me/zs1sci?country.x=ZA&locale.x=en_US)

## Thanks 
Batch files previously used in this project were from DL5OCD Michael and his [DATV-NotSoEasy project](https://groups.io/g/plutodvb/message/257)

Node Red flows inspired by project from PE2JKO [from this post](https://www.pg540.org/wiki/index.php/RFE_for_PlutoDVB2)

![image](https://github.com/Psynosaur/DATV-Simple/assets/26934113/6718292b-fee6-44af-8273-f52b30c44cf1)


## Change the scaling settings for the app to accomodate 1080p monitors.

 ![image](https://github.com/Psynosaur/DATV-Simple/assets/26934113/10d683ec-f646-4d97-9545-08e60bdc5114)
 ![image](https://github.com/Psynosaur/DATV-Simple/assets/26934113/ffa637ad-ef4f-4cd2-84bc-50d3cb666540)
 ![image](https://github.com/Psynosaur/DATV-Simple/assets/26934113/4d631029-4853-4bc2-a96b-32aaacccc085) 
 
 Change both horizontal and vertical to 37

 ![image](https://github.com/Psynosaur/DATV-Simple/assets/26934113/8745f94d-b2a9-43a2-ad0d-7806f23afd1e)




## Motivation
DATV transmissions normally have the following programs open:
 1. OBS
 2. DATV-Easy/FreeStreamCoder (ffmpeg maker...) < - - - **DATV-Simple**
 3. Panel for operating PlutoSDR  < - - - - - - - - - - - - - - **DATV-Simple**                
 4. OpenTuner / Minitioune < - - - - - We could use opentuner / quicktune spectrum as means to drive tx settings?
 5. QuickTune / Chat

So that is five programs and their child windows we need open just to have TX and RX.

I'd like to make that 3 or perhaps even less, it would be nice to run this on any operating system


