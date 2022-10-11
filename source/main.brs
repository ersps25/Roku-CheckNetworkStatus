' ********** Copyright 2016 Roku Corp.  All Rights Reserved. ********** 

sub Main()
    showChannelSGScreen1()
end sub

sub showChannelSGScreen1()
    screen = CreateObject("roSGScreen")
    m.port = CreateObject("roMessagePort")
    screen.setMessagePort(m.port)
    
    m.deviceInfo = CreateObject("roDeviceInfo")
    m.deviceInfo.setMessagePort(m.port)
    m.deviceInfo.EnableLinkStatusEvent(true)

    scene = screen.CreateScene("MainScene")
    screen.show()

    scene.offline = m.deviceInfo.GetLinkStatus()

    while(true)
        msg = wait(0, m.port)
    msgType = type(msg)
        if msgType = "roSGScreenEvent"
            if msg.isScreenClosed() then return
        else if msgType = "roDeviceInfoEvent" and msg.isStatusMessage() then 
            scene.offline = msg.getInfo().linkStatus
        end if
    end while
end sub