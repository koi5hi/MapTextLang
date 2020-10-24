//酸奶[STEAM_1:0:44837813]
//汉化脚本产生的文本信息
//重新推送
IncludeScript("ze_chaos/functions.nut");itemText <- ["[迅捷法球]\nI提升移动速度\n[持续时间]: 3\n[半径]: 256\n[冷却时间]: 50","[毒素法球]\n在周围创造一片毒雾伤害人类\n[伤害]: 20HP/秒\n[持续时间]: 6\n[半径]: 300\n[冷却时间]: 50","[光束法球]\n在前方创造一道光束固定僵尸\n[持续时间]: 4\n[冷却时间]: 60","[治愈法球]\n每秒恢复5000HP\n[持续时间]: 6\n[半径]: 400\n[冷却时间]: 60","[冰水法球]\n在周围创造一片水域减速僵尸\n[伤害]: 400HP/秒\n[持续时间]: 5\n[半径]: 300\n[冷却时间]: 70","[暴风雪法球]\n在周围创造暴风雪减速僵尸\n[伤害]: 400HP/秒\n[持续时间]: 5\n[半径]: 300\n[冷却时间]: 70","[火焰法球]\n在周围创造一片火焰减速僵尸\n[伤害]: 800HP/秒\n[持续时间]: 5\n[半径]: 400\n[冷却时间]: 65","[闪电法球]\n在周围召唤闪电攻击僵尸\n[伤害]: 800HP/秒\n[持续时间]: 5\n[半径]: 400\n[冷却时间]: 65","[黑洞法球]\n吸引周围人类\n[持续时间]: 5\n[半径]: 160\n[冷却时间]: 50","[高达]\n它拥有着神秘的力量\n[砍(右键) 冷却时间: 5]\n[必杀技(SAWD+左键) 冷却时间: 180]","[治愈法球]\n每秒恢复100HP\n[持续时间]: 5\n[半径]: 100\n[冷却时间]: 120"];MAP_TEXT_EN <- ["地图作者：酸奶","章节1：暗影森林","章节2：暗黑城堡","章节3：地下迷城"];function ShowTimeHUD(second){local t,j = null;for(local i = 0;i <= second;i++){j = second-i;if(j > 0){t = "还剩"+j.tostring()+"秒";EntFire("global_hud","AddOutput","message "+t,i);EntFire("global_hud","ShowMessage","",i+0.01);}}}function ShowBossTime(second){for(local i=0;i<=second;i++){message <- null;local j = second-i;if(j == 0){break;};message = "Boss限时: "+j.tostring();EntFire("bosstime_text","SetText",message,i);EntFire("bosstime_text","Display","",i+0.01);}}function SetLevel2BeamTrigger(name,hurt,brush_cur,brush_next,beam_cur,beam_next,target_1,target_2,time,breakable){local output_1 = "OnStartTouch "+name+":Kill::0:1";local output_2 = "OnStartTouch "+hurt+":Enable::0:1";local output_3 = "OnStartTouch "+brush_cur+":Kill::0:1";local output_4 = "OnStartTouch "+brush_next+":AddOutput:renderamt 255:0:1";local output_5 = "OnStartTouch "+beam_cur+":Kill::0:1";local output_6 = "OnStartTouch "+beam_next+":TurnOn::0:1";local output_7 = "OnStartTouch "+target_1+":Kill::0:1";local output_8 = "OnStartTouch "+target_2+":Kill::0:1";local output_9 = "OnStartTouch "+"functions:RunScriptCode:ShowTimeHUD("+time+"):0:1";local output_10 = "OnStartTouch "+breakable+":Break::"+time+":1";local output_11 = "OnStartTouch "+"command:Command:say <--木门将在"+time+"秒后破碎-->:0:1";local output_12 = "OnStartTouch "+"command:Command:say <--木门将在5秒后破碎-->:"+(time.tointeger()-5).tostring()+":1";local output_13 = "OnStartTouch "+"global_text:SetText:<--木门将在"+time+"秒后破碎-->:0:1";local output_14 = "OnStartTouch "+"functions:RunScriptCode:DisplayText(0):0:1";local output_15 = "OnStartTouch "+"global_text:SetText:<--木门将在5秒后破碎-->:"+(time.tointeger()-5).tostring()+":1";local output_16 = "OnStartTouch "+"functions:RunScriptCode:DisplayText("+(time.tointeger()-5).tostring()+"):0:1";local outputs = [output_1,output_2,output_3,output_4,output_5,output_6,output_7,output_8,output_9,output_10,output_11,output_12,output_13,output_14,output_15,output_16];for(local i=0;i<16;i++){EntFire(name,"AddOutput",outputs[i]);}}function SetLevel3Trigger(trigger,wall,breakable,time){local output_1 = "OnStartTouch command:Command:say <--等待"+time.tostring()+"秒-->:0:1";local output_2 = "OnStartTouch functions:RunScriptCode:ShowTimeHUD("+time.tostring()+"):0:1";local output_3 = "OnStartTouch command:Command:say <--还剩5秒-->:"+(time-5).tostring()+":1";local output_4 = "OnStartTouch "+wall+":Kill::"+time.tostring()+":1";local output_5 = "OnStartTouch "+breakable+":Break::"+time.tostring()+":1";local output_6 = "OnStartTouch global_text:SetText:<--等待"+time.tostring()+"秒-->:0:1";local output_7 = "OnStartTouch functions:RunScriptCode:DisplayText(0):0:1";local output_8 = "OnStartTouch global_text:SetText:<--还剩5秒-->:"+(time-5).tostring()+":1";local output_9 = "OnStartTouch functions:RunScriptCode:DisplayText("+(time-5).tostring()+"):0:1";local outputs = [output_1,output_2,output_3,output_4,output_5,output_6,output_7,output_8,output_9];for(local i=0;i<9;i++){EntFire(trigger,"AddOutput",outputs[i]);}}function SetLevel3Trigger2(trigger,breakable,time){local output_1 = "OnStartTouch command:Command:say <--等待"+time.tostring()+"秒-->:0:1";local output_2 = "OnStartTouch functions:RunScriptCode:ShowTimeHUD("+time.tostring()+"):0:1";local output_3 = "OnStartTouch command:Command:say <--还剩5秒-->:"+(time-5).tostring()+":1";local output_4 = "OnStartTouch global_text:SetText:<--等待"+time.tostring()+"秒-->:0:1";local output_5 = "OnStartTouch functions:RunScriptCode:DisplayText(0):0:1";local output_6 = "OnStartTouch global_text:SetText:<--还剩5秒-->:"+(time-5).tostring()+":1";local output_7 = "OnStartTouch functions:RunScriptCode:DisplayText("+(time-5).tostring()+"):0:1";if(breakable != ""){local output_8 = "OnStartTouch "+breakable+":Break::"+time.tostring()+":1";local outputs = [output_1,output_2,output_3,output_4,output_5,output_6,output_7,output_8];for(local i=0;i<8;i++){EntFire(trigger,"AddOutput",outputs[i]);}}else{local outputs = [output_1,output_2,output_3,output_4,output_5,output_6,output_7];for(local i=0;i<7;i++){EntFire(trigger,"AddOutput",outputs[i]);}}}
