
RegisterServerEvent("s_IsCarDriveable")
RegisterServerEvent("s_RemoveAllWeapons")

-- Only allow users with permission level 1 or higher to drive blacklisted vehicle.
AddEventHandler("s_IsCarDriveable", function()
  local source = source
  TriggerEvent('es:getPlayerFromId', source, function(user)
    if user then
    if ( user.getPermissions >= 1 ) then
       TriggerClientEvent("c_Driveable", source)
      else
       TriggerClientEvent("c_Undriveable", source)
      end
    end
  end)
end)

-- remove civilians weapons when exiting any blacklisted vehicle.
AddEventHandler("s_RemoveAllWeapons", function()
  local source = source
  TriggerEvent('es:getPlayerFromId', source, function(user)
    if user then
      if ( user.getPermissions == 0 ) and (db.driver == "mysql") then
        MySQL:executeQuery("DELETE FROM user_weapons WHERE identifier='@identifier'", { ['@identifier'] = identifier})
          elseif ( user.permission_level == 0 ) and (db.driver == "none") then
            TriggerClientEvent("c_RemWeap", source)
        end
      end
  end)
end)
