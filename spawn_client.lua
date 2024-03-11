local NativeUI = exports.NativeUI 


local spawn_marker_x, spawn_marker_y, spawn_marker_z = 2106.9675292969,1408.6010742188,9.8203125


local isMenuShown = false 


local marker = createMarker(spawn_marker_x, spawn_marker_y, spawn_marker_z,"cylinder",1.0)





function showMenu()

    if (isMenuShown) then return end;
    NativeUI:CreatePool("Spawn Vehicle 2.0", "spawn vehicle menu 2.0", false, false)

    for carID,car in pairs(CARS) do
        NativeUI:addTab(1, "button", car["name"].." <"..tostring(car["price"]).."$>", "carBuy."..tostring(carID))
    end

    addEventHandler("Rage.onTabEnter", root, handleClicks)
    isMenuShown = true 

end



function hideMenu()
    if (not isMenuShown) then return end;
    NativeUI:DeletePool(1)
    removeEventHandler("Rage.onTabEnter", root, handleClicks)
    isMenuShown = false 

end


function handleClicks(tab, event)
    if (not isMenuShown) then return end

    if (string.find( event, "carBuy." ))then
        local vehicleModel = string.gsub(event, "carBuy.", "")
        vehicleModel = tonumber(vehicleModel)

        outputChatBox(vehicleModel)

        triggerServerEvent("buyCar", localPlayer,localPlayer, vehicleModel)
        hideMenu()
    end

end



addEventHandler("onClientMarkerHit", marker, function(hitElement)

    if (hitElement == localPlayer)then 

        showMenu()

    end

end)


addEventHandler("onClientMarkerLeave", marker, function(hitElement)

    if (hitElement == localPlayer)then 

        hideMenu()

    end

end)

