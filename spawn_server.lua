addEvent("buyCar", true)
addEventHandler("buyCar", root, function(player, vehicleModel)

    local vehicleData = CARS[vehicleModel]
    local playerMoney = getPlayerMoney(player)

    if (playerMoney < vehicleData["price"]) then
        outputChatBox("You dont have "..playerMoney.."$ !",player, 255,0,0)
        return
    end

    local car = createVehicle(vehicleModel, spawn_x, spawn_y, spawn_z)
    warpPedIntoVehicle(player, car)

    outputChatBox("Congratulations! You have a new car ["..vehicleData["name"].."]", player, 0,255,0)

    takePlayerMoney(player, vehicleData['price'])
    outputChatBox("-"..vehicleData["price"].."$", player, 255,0,0)


end)