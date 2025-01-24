# Adding app to PATH in SetupS


There are apps that require files to be run from the command line

To have the app files added to the PATH do the following:

in in SetupS post processing add this

    setx /M PATH "%PATH%;%ppApps%\cc65\bin"

where cc65\bin is the directory that contains files that will be used on the command line

## Switches

/m	Specifies to set the variable in the system environment. The default setting is the local environment.

[reference](https://learn.microsoft.com/en-us/windows-server/administration/windows-commands/setx)