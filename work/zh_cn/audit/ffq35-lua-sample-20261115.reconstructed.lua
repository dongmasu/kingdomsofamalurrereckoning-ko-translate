-- RESEARCH ONLY: manually reconstructed subset, NOT original source.
-- Evidence: ffq35-lua-sample-20261115.disassembly.txt.
-- Not executed or intended for installation. Engine functions are external.
-- Function names come from CLOSURE + SETGLOBAL in script 1164041.
-- Original comments, local names and source formatting are not recovered.
-- arg0/arg1/arg2/arg3 are synthetic names for unused parameter slots.

function on_dialog_line_1164038_204596_0()
    QUEST.set_stage(QUEST_ID("FFQ35"), 10)
end

function on_dialog_line_1164038_204596_1()
    QUEST.set_stage(QUEST_ID("FFQ35"), 30)
end

function on_dialog_line_1164038_204597_1()
    FFQ35.set_spared_cartery(true)
    QUEST.set_stage(QUEST_ID("FFQ35"), 40)
    Player.give_quest_gold("Freeform Quest")
    Player.remove_item_from_player(
        SIMTYPE_ID("QuestItem_FFQ35_JayckDagger"), 1)
end

function on_dialog_line_1164038_21374_5()
    QUEST.set_stage(QUEST_ID("FFQ35"), 100)
end

function on_dialog_line_1164038_21374_6()
    QUEST.set_stage(QUEST_ID("FFQ35"), 100)
end

function on_dialog_line_1164038_622331_1()
    -- The bytecode consists only of RETURN with no returned values.
end

function on_start_stage_30(arg0, arg1, arg2, arg3)
    game_quest_alert.add_alert(QUEST_ID("FFQ35"), "update")
    factionsLibrary.set_faction_hostile(
        FACTION_ID("Player"), FACTION_ID("Quest_FFQ35_Cartery"))
end

-- The following function names are synthetic labels for the two anonymous
-- child closures embedded at BXML offsets 699 and 1323, respectively.
-- Predicate expressions are static interpretations of calls, EQ, JMP,
-- LOADBOOL and RETURN, not a claim about their surrounding BXML attachment.
function sample_predicate_at_699(arg0, arg1)
    return QUEST.get_stage(QUEST_ID("FFQ35")) == 0
        and ACTOR.was_object_killed(GOR_ID("NPC_DAL_LJO_MenriTogh")) == false
end

function sample_predicate_at_1323(arg0, arg1)
    return QUEST.get_stage(QUEST_ID("FFQ35")) == 10
        and ACTOR.was_object_killed(GOR_ID("NPC_DAL_LJO_MenriTogh")) == false
end
