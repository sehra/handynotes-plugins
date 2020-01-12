-------------------------------------------------------------------------------
---------------------------------- NAMESPACE ----------------------------------
-------------------------------------------------------------------------------

local ADDON_NAME, ns = ...
local L = ns.locale
local Class = ns.Class
local Map = ns.Map
local isinstance = ns.isinstance

local Node = ns.node.Node
local Cave = ns.node.Cave
local NPC = ns.node.NPC
local PetBattle = ns.node.PetBattle
local Rare = ns.node.Rare
local Supply = ns.node.Supply
local Treasure = ns.node.Treasure

local Achievement = ns.reward.Achievement
local Item = ns.reward.Item
local Mount = ns.reward.Mount
local Pet = ns.reward.Pet
local Quest = ns.reward.Quest
local Toy = ns.reward.Toy
local Transmog = ns.reward.Transmog

local Path = ns.poi.Path
local POI = ns.poi.POI

local options = ns.options.args.VisibilityGroup.args
local defaults = ns.optionDefaults.profile

local AQR, EMP, AMA = 0, 1, 2 -- assaults

-------------------------------------------------------------------------------
------------------------------------- MAP -------------------------------------
-------------------------------------------------------------------------------

local map = Map({ id=1527, phased=false })
local nodes = map.nodes

local function GetAssault ()
    local textures = C_MapExplorationInfo.GetExploredMapTextures(map.id)
    if textures and textures[1].fileDataIDs[1] == 3165083 then
        ns.debug('Uldum assault: AQR')
        return AQR -- left
    elseif textures and textures[1].fileDataIDs[1] == 3165092 then
        ns.debug('Uldum assault: EMP')
        return EMP -- middle
    elseif textures and textures[1].fileDataIDs[1] == 3165098 then
        ns.debug('Uldum assault: AMA')
        return AMA -- right
    end
end

function map:prepare ()
    self.assault = GetAssault()
    self.phased = self.assault ~= nil
end

function map:enabled (node, coord, minimap)
    if not Map.enabled(self, node, coord, minimap) then return false end

    if node == map.intro then return true end

    local assault = node.assault
    if assault then
        assault = type(assault) == 'number' and {assault} or assault
        for i=1, #assault + 1, 1 do
            if i > #assault then return false end
            if assault[i] == self.assault then break end
        end
    end

    return true
end

-------------------------------------------------------------------------------
----------------------------------- OPTIONS -----------------------------------
-------------------------------------------------------------------------------

defaults['pet_uldum'] = true

options.groupUldum = {
    type = "header",
    name = L["uldum"],
    order = 10,
};

options.petUldum = {
    type = "toggle",
    arg = "pet_uldum",
    name = L["options_toggle_battle_pets"],
    desc = L["options_toggle_battle_pets_desc"],
    order = 11,
    width = "normal",
};

-------------------------------------------------------------------------------
------------------------------------ INTRO ------------------------------------
-------------------------------------------------------------------------------

local Intro = Class('Intro', Node)

Intro.note = L["uldum_intro_note"]
Intro.icon = 'quest_yellow'
Intro.scale = 3

function Intro:enabled ()
    if not Node.enabled(self) then return false end
    return map.assault == nil
end

function Intro.getters:label ()
    return select(2, GetAchievementInfo(14153)) -- Uldum Under Assault
end

-- Where the Heart is => Surfacing Threats
local Q = Quest({id={58583, 58506, 56374, 56209, 56375, 56472, 56376}})

if UnitFactionGroup('player') == 'Alliance' then
    map.intro = Intro({faction='Alliance', rewards={
        Quest({id={58496, 58498}}), Q
    }})
else
    map.intro = Intro({faction='Horde', rewards={
        Quest({id={58582}}), Q
    }})
end

nodes[46004300] = map.intro

ns.addon:RegisterEvent('QUEST_WATCH_UPDATE', function (_, index)
    local _, _, _, _, _, _, _, questID = GetQuestLogTitle(index)
    if questID == 56376 then
        ns.debug('Uldum assaults unlock detected')
        C_Timer.After(1, function()
            ns.addon:Refresh()
        end)
    end
end)

-------------------------------------------------------------------------------
------------------------------------ RARES ------------------------------------
-------------------------------------------------------------------------------

nodes[64572623] = Rare({id=157170, quest=nil, note=L["chamber_of_the_stars"]}) -- Acolyte Taspu
nodes[66817436] = Rare({id=158557, quest=57669}) -- Actiss the Deceiver
-- nodes[] = Rare({id=157593, quest=nil, rewards={
--     Pet({id=2851, item=174478}) -- Wicked Lurker
-- }}) -- Amalgamation of Flesh
nodes[32426443] = Rare({id=155703, quest=56834}) -- Anq'uri the Titanic
nodes[69714973] = Rare({id=151883, quest=55468, pois={
    Path({68645049, 69714973, 70955041, 71425210, 71005388, 69855463, 68695394, 68225217, 68645049})
}}) -- Anaua
nodes[38732500] = Rare({id=154578, quest=58612, note=L["aqir_flayer"], pois={
    POI({ -- Aqir Hive Worker
        41202497, 40472249, 39882209, 38942459, 37102236, 36502179, 37782046,
        36761891, 37591749, 36041891, 35691808, 33551946, 32251624, 35031801,
        35292068, 33461670, 35102299, 37981821, 40952468
    }),
    POI({ -- Aqir Reaper
        41863885, 41264078, 41494146, 41104233, 40464372, 40624452, 40834550,
        39984480, 39814467, 39254356, 37994321, 37584213, 39764251, 39333892,
        29816310, 32056727, 32426645, 33646358, 37094853
    })
}}) -- Aqir Flayer
nodes[31245691] = Rare({id=154576, quest=58614, note=L["aqir_titanus"], pois={
    POI({30266161, 30076533, 31496674, 33356610, 32486946, 34856598}),
    Path({37295892, 36485588, 37285284}),
    Path({38134884, 36535023, 34765141, 32935159}),
    Path({33325836, 33865418}),
    Path({26795106, 27055372, 27025596}),
    Path({28526114, 28975921, 28805676, 28945481}),
    Path({43194180, 42864292, 41284445, 40884731}),
    Path({40864255, 41714037}),
    Path({38314290, 40354482}),
    Path({32994510, 35434436, 36284239}),
    Path({41243247, 40503334, 39233745})
}}) -- Aqir Titanus
nodes[38214521] = Rare({id=162172, quest=58694, note=L["aqir_warcaster"], pois={
    POI({
        29666397, 30346691, 30396549, 30946805, 31296612, 31316747, 31546811,
        31586663, 31906347, 32256093, 32796516, 32856283, 33046590, 33246733,
        33656812, 33666517, 33976361, 34446875, 34466522, 36844697, 38284543,
        39303882, 39314582, 39754049, 39873790, 39944596, 40033882, 40144315,
        40214146, 40233654, 40264433, 40544320, 40883978, 40894302, 40924132,
        41463988, 41993776, 42913735
    }) -- Aqir Voidcaster
}}) -- Aqir Warcaster
nodes[44854235] = Rare({id=162370, quest=58718}) -- Armagedillo
nodes[65035129] = Rare({id=152757, quest=55710, note=L["atekhramun"]}) -- Atekhramun
nodes[45605777] = Rare({id=162171, quest=58699, note=L["chamber_of_the_sun"]}) -- Captain Dunewalker
nodes[30854971] = Rare({id=162147, quest=58696, rewards={
    Mount({id=1319, item=174769}) -- Malevolent Drone
}}) -- Corpse Eater
nodes[49363822] = Rare({id=158594, quest=57672}) -- Doomsayer Vathiris
nodes[48657067] = Rare({id=158491, quest=57662, pois={
    Path({53287082, 54066945, 53446815, 49866959, 48097382, 46537211, 46257561, 44217851})
}}) -- Falconer Amenophis
nodes[75056816] = Rare({id=157120, quest=57258}) -- Fangtaker Orsa
nodes[55085317] = Rare({id=158633, quest=57680, rewards={
    Toy({item=175140}) -- All-Seeing Eye
}, note=L["left_eye"]}) -- Gaze of N'Zoth
nodes[19755847] = Rare({id=155531, quest=56823, note=L["wastewander"], pois={
    POI({
        17896249, 18026020, 18406490, 18966279, 19176080, 19626403, 19696174,
        19976498, 20036084, 20336267, 20686052, 20796452, 21365790, 22056027,
        22086169, 22135658, 22156465, 22656370, 22905737, 22976012, 23205863,
        23246283, 23706188, 24146211, 24316070, 24366309, 24495822, 24616524,
        24806225, 25306412
    }) -- Wastewander Host
}}) -- Infested Wastewander Captain
nodes[54694317] = Rare({id=158597, quest=57675}) -- High Executor Yothrim
nodes[52398000] = Rare({id=158528, quest=57664, note=L["reshef"], pois={
    POI({51568173, 51578293, 53657939, 54147941, 49028263, 49008194}) -- Voidwarped High Guard
}}) -- High Guard Reshef
nodes[42485873] = Rare({id=162163, quest=58701, pois={
    Path({42485873, 44396076, 46215988, 46785800, 46465623, 44545616, 43055653, 42485873})
}}) -- High Priest Ytaessis
nodes[80504715] = Rare({id=151995, quest=55502, pois={
    Path({80504715, 79804519, 77204597})
}}) -- Hik-Ten the Taskmaster
nodes[60033950] = Rare({id=160623, quest=58206, note=L["hmiasma"]}) -- Hungering Miasma
nodes[73908353] = Rare({id=157134, quest=57259, rewards={
    Mount({id=1314, item=174641}) -- Drake of the Four Winds
}}) -- Ishak of the Four Winds
nodes[71237375] = Rare({id=156655, quest=57433}) -- Korzaran the Slaughterer
nodes[34681890] = Rare({id=154604, quest=56340, note=L["chamber_of_the_moon"], rewards={
    Pet({id=2847, item=174475}) -- Rotbreath
}}) -- Lord Aj'qirai
nodes[30476602] = Rare({id=156078, quest=56952, pois={
    POI({30476602, 33696573})
}}) -- Magus Rehleth
nodes[66842035] = Rare({id=157157, quest=57277}) -- Muminah the Incandescent
nodes[62012454] = Rare({id=152677, quest=55684}) -- Nebet the Ascended
nodes[35071729] = Rare({id=162196, quest=58681}) -- Obsidian Annihilator
nodes[37505978] = Rare({id=162142, quest=58693}) -- Qho
nodes[58175712] = Rare({id=156299, quest=57430, pois={
    Path({51055121, 52684913, 54554907, 56165227, 56795451, 58095721, 58536856})
}}) -- R'khuzj the Unfathomable
nodes[28651339] = Rare({id=162173, quest=58864, pois={
    Path({
        38031012, 36071044, 34261112, 31611053, 29200919, 27930731, 26460550,
        24980615, 24810886, 26881180, 28651339, 28381641, 29341853, 29392137,
        29472409, 29822663, 30342939, 30333188, 30103380
    })
}}) -- R'krox the runt
nodes[68593204] = Rare({id=157146, quest=57273, rewards={
    Mount({id=1317, item=174753}) -- Waste Marauder
}}) -- Rotfeaster
nodes[69714215] = Rare({id=152040, quest=55518}) -- Scoutmaster Moswen
nodes[73536459] = Rare({id=151948, quest=55496}) -- Senbu the Pridefather
nodes[57003794] = Rare({id=161033, quest=58333}) -- Shadowmaw
nodes[58558282] = Rare({id=156654, quest=57432}) -- Shol'thoss the Doomspeaker
nodes[61297484] = Rare({id=160532, quest=58169}) -- Shoth the Darkened
nodes[21236105] = Rare({id=162140, quest=58697, rewards={
    Pet({id=2848, item=174476}) -- Aqir Tunneler
}, pois={
    Path({22486168, 21316279, 19896347, 19356128, 20345804, 21435846, 24325860, 24866015, 24406194, 22486168})
}}) -- Skikx'traz
nodes[66676804] = Rare({id=162372, quest=58715, pois={
    POI({66676804, 70997407})
}}) -- Spirit of Cyrus the Black
nodes[49944011] = Rare({id=162352, quest=58716, note=L["in_water_cave"]}) -- Spirit of Dark Ritualist Zakahn
nodes[52154012] = Cave({parent=nodes[49944011], label=L["spirit_cave"]}) -- Entrance
nodes[78986389] = Rare({id=151878, quest=58613}) -- Sun King Nahkotep
nodes[84785704] = Rare({id=151897, quest=55479}) -- Sun Priestess Nubitt
nodes[73347447] = Rare({id=151609, quest=55353}) -- Sun Prophet Epaphos
nodes[65903522] = Rare({id=152657, quest=55682, pois={
    Path({68043800, 64873862, 64503660, 65903522, 67003162, 67743515, 68043800})
}}) -- Tat the Bonechewer
nodes[49328235] = Rare({id=158636, quest=57688, note=L["gexec"], rewards={
    Toy({item=169303}) -- Hell-Bent Bracers
}}) -- The Grand Executor
nodes[33592569] = Rare({id=162170, quest=58702}) -- Warcaster Xeshro
nodes[79505217] = Rare({id=151852, quest=55461, pois={
    Path({77755217, 81265217})
}}) -- Watcher Rehu
-- nodes[] = Rare({id=157473, quest=nil, rewards={
--     Toy({item=174874}) -- Budget K'thir Disguise
-- }}) -- Yiphrim the Will Ravager
nodes[80165708] = Rare({id=157164, quest=57279}) -- Zealot Tekem
nodes[39694159] = Rare({id=162141, quest=58695}) -- Zuythiz

-------------------------------------------------------------------------------
---------------------------------- TREASURES ----------------------------------
-------------------------------------------------------------------------------

local AQRChest = Class('AQRChest', Treasure, {
    assault=AQR, label=L["infested_cache"]
})

local AQRTR1 = AQRChest({quest=58138, icon='chest_blue'})
local AQRTR1C = AQRChest({quest=58138, icon='chest_blue', note=L["chamber_of_the_sun"]})
local AQRTR2 = AQRChest({quest=58139, icon='chest_purple'})
local AQRTR3 = AQRChest({quest=58140, icon='chest_orange'})
local AQRTR4 = AQRChest({quest=58141, icon='chest_yellow'})
local AQRTR5 = AQRChest({quest=58142, icon='chest_teal'})

-- quest=58138
nodes[45845698] = AQRTR1C
nodes[46525801] = AQRTR1
nodes[50555882] = AQRTR1
nodes[51736032] = AQRTR1
-- quest=58139
nodes[31166796] = AQRTR2
nodes[32764770] = AQRTR2
nodes[32976010] = AQRTR2
nodes[33366210] = AQRTR2
-- quest=58140
nodes[18356130] = AQRTR3
nodes[19836512] = AQRTR3
nodes[23055936] = AQRTR3
nodes[24525507] = AQRTR3
-- quest=58141
nodes[36032024] = AQRTR4
nodes[37484577] = AQRTR4
nodes[38774014] = AQRTR4
nodes[39754504] = AQRTR4
-- quest=58142
nodes[28030834] = AQRTR5
nodes[30671611] = AQRTR5
nodes[33953036] = AQRTR5
nodes[35413157] = AQRTR5

nodes[36252324] = Supply({quest=nil, assault=AQR, label=L["infested_strongbox"], note=L["chamber_of_the_moon"]})

-------------------------------------------------------------------------------

local EMPChest = Class('EMPChest', Treasure, {
    assault=EMP, label=L["black_empire_cache"]
})

local EMPTR1 = EMPChest({quest=57623, icon='chest_blue'})
local EMPTR2 = EMPChest({quest=57624, icon='chest_purple'})
local EMPTR3 = EMPChest({quest=57626, icon='chest_orange'})
local EMPTR4 = EMPChest({quest=57627, icon='chest_yellow'})
local EMPTR5 = EMPChest({quest=57635, icon='chest_teal'})
--local EMPTR6 = EMPChest({quest=nil, icon='chest_lime'})

-- quest=57623
nodes[58361535] = EMPTR1
-- quest=57624
nodes[50793143] = EMPTR2
-- quest=57626
nodes[59226749] = EMPTR3
nodes[61778172] = EMPTR3
nodes[62588188] = EMPTR3
nodes[62977610] = EMPTR3
nodes[70217325] = EMPTR3
-- quest=57627
nodes[60757493] = EMPTR4
nodes[62157346] = EMPTR4
nodes[62737184] = EMPTR4
nodes[67167394] = EMPTR4
-- quest=57635
nodes[45697961] = EMPTR5
nodes[47507687] = EMPTR5
nodes[51707135] = EMPTR5
nodes[52197757] = EMPTR5

nodes[71657334] = Supply({quest=nil, assault=EMP, label=L["black_empire_coffer"]})

-------------------------------------------------------------------------------

local AMAChest = Class('AMAChest', Treasure, {
    assault=AMA, label=L["amathet_cache"]
})

local AMATR1 = AMAChest({quest=55689, icon='chest_blue'})
local AMATR2 = AMAChest({quest=55690, icon='chest_purple'})
local AMATR3 = AMAChest({quest=55691, icon='chest_orange'})
local AMATR4 = AMAChest({quest=55698, icon='chest_yellow'})
local AMATR5 = AMAChest({quest=55699, icon='chest_teal'})
local AMATR6 = AMAChest({quest=55700, icon='chest_lime'})
local AMATR6C = AMAChest({quest=55700, icon='chest_lime', note=L["chamber_of_the_stars"]})

-- quest=55689
nodes[80785611] = AMATR1
nodes[81585359] = AMATR1
nodes[84534540] = AMATR1
nodes[84836185] = AMATR1
nodes[85275138] = AMATR1
-- quest=55690
nodes[71226851] = AMATR2
nodes[72216422] = AMATR2
nodes[73117297] = AMATR2
nodes[73987095] = AMATR2
nodes[78286207] = AMATR2
nodes[79166486] = AMATR2
-- quest=55691
nodes[72474857] = AMATR3
nodes[74195187] = AMATR3
nodes[75335579] = AMATR3
nodes[75575372] = AMATR3
nodes[78125302] = AMATR3
-- quest=55698
nodes[71884388] = AMATR4
nodes[72944350] = AMATR4
nodes[75134608] = AMATR4
nodes[76344679] = AMATR4
nodes[79314578] = AMATR4
-- quest=55699 (no blizzard minimap icon for this one?)
nodes[63084970] = AMATR5
nodes[64094488] = AMATR5
nodes[69744236] = AMATR5
-- quest=55700
nodes[60932455] = AMATR6
nodes[61343060] = AMATR6
nodes[63122508] = AMATR6C
nodes[63532160] = AMATR6
nodes[67172800] = AMATR6C
nodes[68222051] = AMATR6

nodes[64463415] = Supply({quest=nil, assault=AMA, label=L["amathet_reliquary"], note=L["chamber_of_the_stars"]})
nodes[67464294] = Supply({quest=nil, assault=AMA, label=L["amathet_reliquary"]})
nodes[73685054] = Supply({quest=nil, assault=AMA, label=L["amathet_reliquary"]})

-------------------------------------------------------------------------------
--------------------------------- BATTLE PETS ---------------------------------
-------------------------------------------------------------------------------

nodes[35453159] = PetBattle({id=162465}) -- Aqir Sandcrawler
nodes[57604356] = PetBattle({id=162466}) -- Blotto
nodes[62043188] = PetBattle({id=162458}) -- Retinus the Seeker
nodes[61745440] = PetBattle({id=162461}) -- Whispers

-------------------------------------------------------------------------------

ns.maps[map.id] = map
