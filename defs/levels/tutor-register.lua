return {
	humanName = "Fire Register",
	description = [[Paint puts out fires.

The [1] trigger activates as long its register is set. Register commands enable or disable the trigger.

Press Ctrl+R to restart the level if you get stuck.
]],
	dimensions = {11, 8},
	hideChipInventory = false,
	doorOpenState = {},
	player = {
		{
			name = "player",
			pos = {4, 4},
			direction = 0,
		},
	},
	robots = {
		{
			name = "basic_robot",
			humanName = "Firefighter",
			pos = {7, 3},
			direction = 1,
			swapAction = {trigger = "register_1", slot = 4},
			program = {
				{
					trigger = "register_1",
					actions = {"paint_down", "u_turn", "move", "empty"},
				},
				{
					trigger = "paint",
					actions = {"paint_up", "right"},
				},
				{
					trigger = "wall_front",
					actions = {"set_1"},
				},
				{
					trigger = "wildcard",
					actions = {"move"},
				},
			},
		},
	},
	blocks = {
		{
			name = "wall",
			pos = {-2, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-2, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-2, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-2, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-2, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-2, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-2, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-2, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-2, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 7},
			direction = 0,
		},
		{
			name = "fire",
			pos = {6, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {6, 0},
			direction = 0,
		},
		{
			name = "fire",
			pos = {6, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 0},
			direction = 0,
		},
		{
			name = "fire",
			pos = {9, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 0},
			direction = 0,
		},
		{
			name = "fire",
			pos = {7, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {6, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 7},
			direction = 0,
		},
		{
			name = "fire",
			pos = {9, 1},
			direction = 0,
		},
		{
			name = "player_goal",
			pos = {8, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 2},
			direction = 0,
		},
		{
			name = "fire",
			pos = {6, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 4},
			direction = 0,
		},
		{
			name = "fire",
			pos = {7, 4},
			direction = 0,
		},
		{
			name = "fire",
			pos = {5, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 6},
			direction = 0,
		},
		{
			name = "fire",
			pos = {4, 1},
			direction = 0,
		},
		{
			name = "fire",
			pos = {4, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 3},
			direction = 0,
		},
		{
			name = "fire",
			pos = {8, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 1},
			direction = 0,
		},
		{
			name = "fire",
			pos = {9, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 7},
			direction = 0,
		},
		{
			name = "robot_goal",
			pos = {3, 5},
			direction = 1,
		},
		{
			name = "wall",
			pos = {0, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 7},
			direction = 0,
		},
		{
			name = "cmd_reset_1",
			pos = {5, 5},
			direction = 0,
		},
	},
}
