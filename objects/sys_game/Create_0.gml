enum GAME_STATE {
    PLAYING,
    DYING,
    RESPAWN,
    GAME_OVER
}

enum PLAY_STATE {
    ARRIVE,
    ASSAULT
}

G.game = id;
G.current_frame = 0;

player = noone;
zone_player = noone; // Defined in room creation code
zone_player_center = undefined;

state = GAME_STATE.RESPAWN;

lives_text = "LIVES: ";
lives_player = 3;
score_player = 0;
lives_score_interval = 7000;
lives_score_current = lives_score_interval;
lives_score_flash = 60;
lives_score_flash_interval = 10;
lives_score_flash_current = 0;

round_current = 0;
round_difficulty_scale = 12;

state_play = PLAY_STATE.ARRIVE;

function formations_set() {
    array_foreach(enemy_formations_current, function(_formation) {
        array_foreach(_formation, function(_enemy) {
            _enemy.inst = noone;
        });
    });
    enemy_formations_current = argument[irandom(argument_count - 1)];
    enemy_count_wave = 0;
    for (var i = 0; i < array_length(enemy_formations_current); ++i)
        enemy_count_wave += array_length(enemy_formations_current[i]);
}
function formation_check_arrive_status(_formation) {
    enum ARRIVE_STATUS {
        KILLED,
        ARRIVED,
        SPAWN,
        ARRIVING
    }
    static check_killed = function(_enemy) {
        return !instance_exists(_enemy.inst) && _enemy.inst != noone;
    }
    static check_does_not_exist = function(_enemy) {
        return !instance_exists(_enemy.inst);
    }
    static check_arriving = function(_enemy) {
        if (!instance_exists(_enemy.inst)) return false;
        return _enemy.inst.state == ENEMY_STATE.ARRIVE;
    }
    if (array_all(_formation, check_killed)) return ARRIVE_STATUS.KILLED;
    if (array_all(_formation, check_does_not_exist)) return ARRIVE_STATUS.SPAWN;
    if (array_any(_formation, check_arriving)) return ARRIVE_STATUS.ARRIVING;
    return ARRIVE_STATUS.ARRIVED;
}
#region Formation easy 1
enemy_formations_easy_1 = [
    [
        {
            path: pth_1_enemy_form_1,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_2_enemy_form_1,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_3_enemy_form_1,
            type: obj_mimbari_1,
            inst: noone
        }
    ],
    [
        {
            path: pth_1_enemy_form_2,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_2_enemy_form_2,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_3_enemy_form_2,
            type: obj_mimbari_1,
            inst: noone
        }
    ],
    [
        {
            path: pth_4_enemy_form_3,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_5_enemy_form_3,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_6_enemy_form_3,
            type: obj_mimbari_1,
            inst: noone
        }
    ]
];
#endregion
#region Formation easy 2
enemy_formations_easy_2 = [
    [
        {
            path: pth_1_enemy_form_2,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_2_enemy_form_2,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_3_enemy_form_2,
            type: obj_mimbari_1,
            inst: noone
        }
    ],
    [
        {
            path: pth_1_enemy_form_1,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_2_enemy_form_1,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_3_enemy_form_1,
            type: obj_mimbari_1,
            inst: noone
        }
    ],
    [
        {
            path: pth_1_enemy_form_3,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_2_enemy_form_3,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_3_enemy_form_3,
            type: obj_mimbari_1,
            inst: noone
        }
    ]
];
#endregion
#region Formation easy elite 1
enemy_formations_easy_elite_1 = [
    [
        {
            path: pth_1_enemy_form_4,
            type: obj_mimbari_2_elite,
            inst: noone
        },
        {
            path: pth_2_enemy_form_4,
            type: obj_mimbari_2_elite,
            inst: noone
        }
    ],
    [
        {
            path: pth_1_enemy_form_1,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_2_enemy_form_1,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_3_enemy_form_1,
            type: obj_mimbari_1,
            inst: noone
        }
    ],
    [
        {
            path: pth_1_enemy_form_2,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_2_enemy_form_2,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_3_enemy_form_2,
            type: obj_mimbari_1,
            inst: noone
        }
    ],
    [
        {
            path: pth_4_enemy_form_3,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_5_enemy_form_3,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_6_enemy_form_3,
            type: obj_mimbari_1,
            inst: noone
        }
    ]
];
#endregion
#region Formation easy elite 2
enemy_formations_easy_elite_2 = [
    [
        {
            path: pth_1_enemy_form_4,
            type: obj_mimbari_2_elite,
            inst: noone
        },
        {
            path: pth_2_enemy_form_4,
            type: obj_mimbari_2_elite,
            inst: noone
        }
    ],
    [
        {
            path: pth_1_enemy_form_2,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_2_enemy_form_2,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_3_enemy_form_2,
            type: obj_mimbari_1,
            inst: noone
        }
    ],
    [
        {
            path: pth_1_enemy_form_1,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_2_enemy_form_1,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_3_enemy_form_1,
            type: obj_mimbari_1,
            inst: noone
        }
    ],
    [
        {
            path: pth_1_enemy_form_3,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_2_enemy_form_3,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_3_enemy_form_3,
            type: obj_mimbari_1,
            inst: noone
        }
    ]
];
#endregion
#region Formation medium 1
enemy_formations_medium_1 = [
    [
        {
            path: pth_1_enemy_form_1,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_2_enemy_form_1,
            type: obj_mimbari_2,
            inst: noone
        },
        {
            path: pth_3_enemy_form_1,
            type: obj_mimbari_1,
            inst: noone
        }
    ],
    [
        {
            path: pth_1_enemy_form_2,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_2_enemy_form_2,
            type: obj_mimbari_2,
            inst: noone
        },
        {
            path: pth_3_enemy_form_2,
            type: obj_mimbari_1,
            inst: noone
        }
    ],
    [
        {
            path: pth_4_enemy_form_3,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_5_enemy_form_3,
            type: obj_mimbari_2,
            inst: noone
        },
        {
            path: pth_6_enemy_form_3,
            type: obj_mimbari_1,
            inst: noone
        }
    ]
];
#endregion
#region Formation medium 2
enemy_formations_medium_2 = [
    [
        {
            path: pth_1_enemy_form_2,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_2_enemy_form_2,
            type: obj_mimbari_2,
            inst: noone
        },
        {
            path: pth_3_enemy_form_2,
            type: obj_mimbari_1,
            inst: noone
        }
    ],
    [
        {
            path: pth_1_enemy_form_1,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_2_enemy_form_1,
            type: obj_mimbari_2,
            inst: noone
        },
        {
            path: pth_3_enemy_form_1,
            type: obj_mimbari_1,
            inst: noone
        }
    ],
    [
        {
            path: pth_1_enemy_form_3,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_2_enemy_form_3,
            type: obj_mimbari_2,
            inst: noone
        },
        {
            path: pth_3_enemy_form_3,
            type: obj_mimbari_1,
            inst: noone
        }
    ]
];
#endregion
#region Formation medium elite 1
enemy_formations_medium_elite_1 = [
    [
        {
            path: pth_1_enemy_form_4,
            type: obj_mimbari_3,
            inst: noone
        },
        {
            path: pth_2_enemy_form_4,
            type: obj_mimbari_3,
            inst: noone
        }
    ],
    [
        {
            path: pth_1_enemy_form_1,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_2_enemy_form_1,
            type: obj_mimbari_2,
            inst: noone
        },
        {
            path: pth_3_enemy_form_1,
            type: obj_mimbari_1,
            inst: noone
        }
    ],
    [
        {
            path: pth_1_enemy_form_2,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_2_enemy_form_2,
            type: obj_mimbari_2,
            inst: noone
        },
        {
            path: pth_3_enemy_form_2,
            type: obj_mimbari_1,
            inst: noone
        }
    ],
    [
        {
            path: pth_4_enemy_form_3,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_5_enemy_form_3,
            type: obj_mimbari_2,
            inst: noone
        },
        {
            path: pth_6_enemy_form_3,
            type: obj_mimbari_1,
            inst: noone
        }
    ]
];
#endregion
#region Formation medium elite 2
enemy_formations_medium_elite_2 = [
    [
        {
            path: pth_1_enemy_form_4,
            type: obj_mimbari_3,
            inst: noone
        },
        {
            path: pth_2_enemy_form_4,
            type: obj_mimbari_3,
            inst: noone
        }
    ],
    [
        {
            path: pth_1_enemy_form_2,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_2_enemy_form_2,
            type: obj_mimbari_2,
            inst: noone
        },
        {
            path: pth_3_enemy_form_2,
            type: obj_mimbari_1,
            inst: noone
        }
    ],
    [
        {
            path: pth_1_enemy_form_1,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_2_enemy_form_1,
            type: obj_mimbari_2,
            inst: noone
        },
        {
            path: pth_3_enemy_form_1,
            type: obj_mimbari_1,
            inst: noone
        }
    ],
    [
        {
            path: pth_1_enemy_form_3,
            type: obj_mimbari_1,
            inst: noone
        },
        {
            path: pth_2_enemy_form_3,
            type: obj_mimbari_2,
            inst: noone
        },
        {
            path: pth_3_enemy_form_3,
            type: obj_mimbari_1,
            inst: noone
        }
    ]
];
#endregion
#region Formation hard 1
enemy_formations_hard_1 = [
    [
        {
            path: pth_1_enemy_form_1,
            type: obj_mimbari_2,
            inst: noone
        },
        {
            path: pth_2_enemy_form_1,
            type: obj_mimbari_3,
            inst: noone
        },
        {
            path: pth_3_enemy_form_1,
            type: obj_mimbari_2,
            inst: noone
        }
    ],
    [
        {
            path: pth_1_enemy_form_2,
            type: obj_mimbari_2,
            inst: noone
        },
        {
            path: pth_2_enemy_form_2,
            type: obj_mimbari_3,
            inst: noone
        },
        {
            path: pth_3_enemy_form_2,
            type: obj_mimbari_2,
            inst: noone
        }
    ],
    [
        {
            path: pth_4_enemy_form_3,
            type: obj_mimbari_2,
            inst: noone
        },
        {
            path: pth_5_enemy_form_3,
            type: obj_mimbari_3,
            inst: noone
        },
        {
            path: pth_6_enemy_form_3,
            type: obj_mimbari_2,
            inst: noone
        }
    ]
];
#endregion
#region Formation hard 2
enemy_formations_hard_2 = [
    [
        {
            path: pth_1_enemy_form_2,
            type: obj_mimbari_2,
            inst: noone
        },
        {
            path: pth_2_enemy_form_2,
            type: obj_mimbari_3,
            inst: noone
        },
        {
            path: pth_3_enemy_form_2,
            type: obj_mimbari_2,
            inst: noone
        }
    ],
    [
        {
            path: pth_1_enemy_form_1,
            type: obj_mimbari_2,
            inst: noone
        },
        {
            path: pth_2_enemy_form_1,
            type: obj_mimbari_3,
            inst: noone
        },
        {
            path: pth_3_enemy_form_1,
            type: obj_mimbari_2,
            inst: noone
        }
    ],
    [
        {
            path: pth_1_enemy_form_3,
            type: obj_mimbari_2,
            inst: noone
        },
        {
            path: pth_2_enemy_form_3,
            type: obj_mimbari_3,
            inst: noone
        },
        {
            path: pth_3_enemy_form_3,
            type: obj_mimbari_2,
            inst: noone
        }
    ]
];
#endregion
enemy_formations_current = choose(enemy_formations_easy_1, enemy_formations_easy_2);
enemy_count_wave = 0;
for (var i = 0; i < array_length(enemy_formations_current); ++i)
    enemy_count_wave += array_length(enemy_formations_current[i]);
enemy_elite_interval = 5; // How many rounds between elite waves
enemy_medium_theshhold = 2*enemy_elite_interval; // How many rounds until medium difficulty waves
enemy_hard_theshhold = 4*enemy_elite_interval; // How many rounds until hard difficulty waves

cruiser_timer_min = 900;
cruiser_timer_min = 1200;
cruiser_timer = random_range(900, 1200);

dying_wait = 60;
dying_wait_current = 0;

respawn_phase = 0;
respawn_start = undefined;
respawn_arrive_speed = 0.02;
respawn_arrive_progress = 0;
respawn_lives_show = false;
respawn_lives_x = 0;
respawn_lives_y = 0;
respawn_lives_speed = 0.02;
respawn_lives_progress = 0;
respawn_lives_hold = 100;
respawn_lives_hold_current = 0;

game_over_phase = 0;
game_over_x = CANVAS_SIZE div 2;
game_over_y = round(0.35*CANVAS_SIZE);//19;
game_over_speed = 0.02;
game_over_progress = 0;
game_over_hold = 150;
game_over_hold_current = 0;
