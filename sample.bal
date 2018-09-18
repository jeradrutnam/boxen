import ballerina/io;
import wso2/boxen;

function main(string... args){
    boxen:Boxen boxen = new();

    string boxedText = boxen.write("Hello world!");
    io:println(boxedText);
}