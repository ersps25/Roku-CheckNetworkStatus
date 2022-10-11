# Network Status
Brightscript Scenegraph Channel to detect network connection status
# roDeviceInfo
roDeviceInfo node is used to get any type of device information like network connection/disconnection status, IP Address, Device Model, OS Version and many more things.

# Steps to integrate network status check
1. Write boolean field inside Scene.xml (file extending the Scene node)
2. Write observed function inside corresponding Scene.brs
3. Inside main.brs
    1. Create object of roDeviceInfo
    2. Set the port
    3. Invoke enableNetworkStatusEvent(true)
    4. Inside Event Loop, add the following code

        if msgType = "roDeviceInfoEvent" and msg.isStatusMessage() then 
            scene.offline = msg.getInfo().linkStatus
        end if
4. Done