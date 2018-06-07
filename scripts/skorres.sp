#pragma semicolon 1

#define DEBUG

#define PLUGIN_AUTHOR ""
#define PLUGIN_VERSION "0.00"

#include <sourcemod>
#include <sdktools>
#include <tf2>
#include <tf2_stocks>
#include <clients>
#include <sdkhooks>
#include <smlib>

new ScoreEntity;
new ScoreOffset;

public Plugin:myinfo = 
{
	name = "",
	author = PLUGIN_AUTHOR,
	description = "",
	version = PLUGIN_VERSION,
	url = ""
};
public OnPluginStart()
{
	RegConsoleCmd("sm_rs", SkorRes);
}
public Action:SkorRes(client, args)
{
	new entity = FindEntityByClassname(GetMaxClients() + 1, "tf_player_manager");
	if(entity == -1)
	{
		SetFailState("tf_player_manager bulunamadı!");
    } else {
    	ScoreEntity = entity;
    }
    //EntInfo
    ScoreOffset = FindSendPropInfo("CTFPlayerResource", "m_iScore");
    if(ScoreOffset == -1)
    {
    	SetFailState("m_iScore bulunamadı");
    }
    if(skor(client) > 0)
    {
    	SetEntData(ScoreEntity, ScoreOffset, 0);
    }
    //new score1 = TF2_SetPlayerResourceData(client, TFResource_Score);
    //score1 = 0;
    Client_SetScore(client, 0);
    PrintToChat(client, "\x07696969[ \x07A9A9A9SM \x07696969]\x07CCCCCCSkorunuz resetlendi!");
    //new score = GetScore(GetPlayerResourceEntity(), Prop_Send, "m_iScore", _, client);
}
skor(client)
{
	new PlayerScore = GetEntData(ScoreEntity, ScoreOffset + (client * 4));
	return GetEntData(ScoreEntity, ScoreOffset + (client * 4));
}
