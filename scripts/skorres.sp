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
    Client_SetScore(client, 0);
    PrintToChat(client, "\x07696969[ \x07A9A9A9SM \x07696969]\x07CCCCCCSkorunuz resetlendi!");
}
