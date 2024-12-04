#define FILTERSCRIPT
#include <a_samp>
#include <pawn.cmd>
#include <menu-floating>

enum
{
    MENU_FLOATING_HOSPITAL,
    MENU_FLOATING_TELEPORTES,
}

CMD:hospital(playerid)
{
    static const items[][] =
    {
        "Atendimento",
        "Ver histórico ~p~novo!"
    };
    ShowMenuFloatingForPlayer(playerid, MENU_FLOATING_HOSPITAL, "Hospital", 0xAC2727FF, items);
    return 1;
}

CMD:teleportes(playerid)
{
    static const items[][] =
    {
        "Los Santos",
        "San Fierro",
        "Las Venturas"
    };
    ShowMenuFloatingForPlayer(playerid, MENU_FLOATING_TELEPORTES, "Teleportes", 0x445750FF, items);
    return 1;
}

public OnPlayerMenuFloatingResponse(playerid, extraid, bool:response, listitem)
{
    SendClientMessage(playerid, 0xCDCDCDFF, "[DEBUG] extraid = %i, response = %s, listitem = %i", extraid, response ? "true" : "false", listitem);

    switch (extraid)
    {
        case MENU_FLOATING_HOSPITAL:
        {
            if (!response)
                return 0;
            
            switch (listitem)
            {
                case 0: SendClientMessage(playerid, -1, "Atendimento");
                case 1: SendClientMessage(playerid, -1, "Histórico");
            }
        }
        case MENU_FLOATING_TELEPORTES:
        {
            if (!response)
                return 0;

            HideMenuFloatingForPlayer(playerid);

            switch (listitem)
            {
                case 0:
                {
                    SetPlayerPos(playerid, 1547.2209, -1681.7416, 13.5588);
                    SetPlayerFacingAngle(playerid, 90.0);
                }
                case 1:
                {
                    SetPlayerPos(playerid, -1583.6185, 809.6888, 6.8203);
                    SetPlayerFacingAngle(playerid, 270.0);
                }
                case 2:
                {
                    SetPlayerPos(playerid, 1592.3444, 1817.8513, 10.8203);
                    SetPlayerFacingAngle(playerid, 360.0);
                }
            }

            SetPlayerInterior(playerid, 0);
            SetPlayerVirtualWorld(playerid, 0);
        }
    }
    return 1;
}
