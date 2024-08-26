# Setting default browser from the command line

whenever i install google chrome for some reason maybe its MS trying to hog the file association of the web browser it never associates all the relevent files

## Solution

So here is a possible solution using an app SetUserFTA perhaps

## setting default browser

ref: [here](https://www.winhelponline.com/blog/)


* download setuserfta [here](https://setuserfta.com/)

To set browser as the default , run one of these commands:

1. Chrome
```cmd
    SetUserFTA http ChromeHTML
    SetUserFTA https ChromeHTML
    SetUserFTA .htm ChromeHTML
    SetUserFTA .html ChromeHTML
```

2. **Firefox**

```cmd
    SetUserFTA http FirefoxHTML
    SetUserFTA https FirefoxHTML
    SetUserFTA .htm FirefoxHTML
    SetUserFTA .html FirefoxHTML


3. Opera

    SetUserFTA http OperaStable
    SetUserFTA htts OperaStable
    SetUserFTA .htm OperaStable
    SetUserFTA .html OperaStable



4. Microsoft Edge (Chromium)

    SetUserFTA http MSEdgeHTM
    SetUserFTA https MSEdgeHTM
    SetUserFTA microsoft-edge MSEdgeHTM
    SetUserFTA .htm MSEdgeHTM
    SetUserFTA .html MSEdgeHTM



5. Microsoft Edge (legacy)

```cmd
    SetUserFTA http AppXq0fevzme2pys62n3e0fbqa7peapykr8v
    SetUserFTA https AppX90nv6nhay5n6a98fnetv7tpk64pp35es
    SetUserFTA microsoft-edge AppX7rm9drdg8sk7vqndwj3sdjw11x96jc0y
    SetUserFTA .htm AppX4hxtad77fbk3jkkeerkrm0ze94wjf3s9
    SetUserFTA .html AppX4hxtad77fbk3jkkeerkrm0ze94wjf3s9


RELATED: See article How to Remove File Type Associations Using the Registry Editor for more information on File extension → ProgID mapping. 
[link](https://www.winhelponline.com/blog/remove-file-association-windows/)


