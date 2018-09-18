Draw a box around command line interface print line text

# Package Overview

Boxen allows you draw a stroke line box around the text that you print on the terminal/console.

## Compatibility

|                                 |       Version                  |
|  :---------------------------:  |  :---------------------------: |
|  Ballerina Language             |   0.981.0                      |

## Sample

First, import the `jeradrutnam/boxen` package into the Ballerina project.

```ballerina
import jeradrutnam/boxen;
```

Then simply use it as below,

```ballerina
function main(string... args){
    boxen:Boxen boxen = new();

    string boxedText = boxen.write("Hello world!");
    io:println(boxedText);
}
```