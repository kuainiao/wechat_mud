%%%-------------------------------------------------------------------
%%% @author shuieryin
%%% @copyright (C) 2015, Shuieryin
%%% @doc
%%%
%%% @end
%%% Created : 22. Nov 2015 11:33 AM
%%%-------------------------------------------------------------------
-author("shuieryin").

-ifndef(BATTLE_STATUS).
-include("../data_type/battle.hrl").
-define(BATTLE_STATUS, 1).
-endif.

-include("../data_type/skill.hrl").

-record(avatar_profile, {
    name :: player_fsm:name(),
    description :: [nls_server:nls_object()]
}).

-record(born_type_info, {
    born_type :: player_fsm:born_month(),
    strength :: integer(),
    defense :: integer(),
    hp :: integer(),
    dexterity :: integer(),
    skill :: [player_fsm:skill_id()]
}).

-record(player_profile, {
    uid :: player_fsm:uid() | undefined,
    id :: player_fsm:id() | undefined,
    name :: player_fsm:name() | undefined,
    description :: nls_server:nls_object() | undefined,
    self_description :: nls_server:nls_object() | undefined,
    born_month :: player_fsm:born_month() | undefined,
    gender :: player_fsm:gender() | undefined,
    lang :: nls_server:support_lang() | undefined,
    register_time :: pos_integer() | undefined,
    scene :: scene_fsm:scene_name() | undefined,
    avatar_profile :: #avatar_profile{} | undefined,
    battle_status :: #battle_status{} | undefined
}).

-record(simple_player, {
    uid :: player_fsm:uid(),
    name :: player_fsm:name(),
    id :: player_fsm:id(),
    character_description :: nls_server:nls_object()
}).

-record(mailbox, {
    battle = [] :: [player_fsm:mail_object()],
    scene = [] :: [player_fsm:mail_object()],
    other = [] :: [player_fsm:mail_object()]
}).

-record(player_state, {
    self :: #player_profile{},
    mail_box :: #mailbox{},
    lang_map :: nls_server:lang_map(),
    runtime_data :: csv_to_object:csv_object(),
    battle_status_ri = record_info(fields, battle_status) :: [atom()], % generic atom % battle status record info
    pending_update_runtime_data :: {[csv_to_object:csv_data_struct()], [csv_to_object:csv_data_struct()]} | undefined,
    runtime_data_constraints :: [csv_to_object:csv_data_struct()]
}).