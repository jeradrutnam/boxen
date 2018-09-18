# Ballerina Boxen

Boxen allows you draw a stroke line box around the text that you print on the terminal/console.

### How to use

1. First, import the `jeradrutnam/boxen` package into the Ballerina project.

   ```ballerina
   import jeradrutnam/boxen;
   ```

2. Then simply use it as below.

   ```ballerina
   function main(string... args){
       boxen:Boxen boxen = new();

       string boxedText = boxen.write("Hello world!");
       io:println(boxedText);
   }
   ```

3. Go to the terminal/console and run the file.

   ```shell
   ballerina run <filename>.bal
   ```

### License

Licenses this source under the Apache License, Version 2.0 ([LICENSE](LICENSE)), You may not use this file except in compliance with the License.
