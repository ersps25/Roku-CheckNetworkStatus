sub init()
    m.top.setFocus(true)
    m.realtimestatus = m.top.findNode("realtimestatus")
    
end sub

function onOfflineChanged()
    if(m.top.offline)
       m.realtimestatus.text = "Internet Connected"
    else 
        m.realtimestatus.text = "Internet Disconnected"
    end if
end function
