# CEID-generative-art
Infinite zoom generative art display for the Becton Cafe.

[![IMAGE ALT TEXT](http://img.youtube.com/vi/ht1_2JQ3BMo/0.jpg)](http://www.youtube.com/watch?v=ht1_2JQ3BMo "Screen Blossom")

Randomly generated new colors cascade outward in rectangular rings from the center.
Both the color and length of the shift are generated randomly. 
Each seperate screen in the Becton Cafe has its own "blossom."

## Installation on Raspberry Pi

Install processing
```
curl https://processing.org/download/install-arm.sh | sudo sh
```

Clone the repository.

In the `/home/pi` directory create a new script called `startBloom.sh` with this line in it:
```
processing-java –sketch=/full/path/to/infinite_rectangles --force --run
```
Add the line `@bash /home/pi/startBloom.sh` to the end of the file `/etc/xdg/lxsession/LXDE-pi/autostart`

Now the processing sketch should run on boot!
