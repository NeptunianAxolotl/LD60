return {
	humanName = "Widdershins",
	description = "Paint puts out fires.\n\nYour robot is not strong enough to stand the heat.",
	dimensions = {15, 9},
	textSize = 300,
	hideChipInventory = false,
	doorOpenState = {},
	player = {
		{
			name = "player",
			pos = {12, 2},
			direction = 2,
		},
	},
	robots = {
		{
			name = "basic_robot",
			humanName = "Helper",
			pos = {10, 1},
			direction = 1,
			swapAction = {trigger = "wildcard", slot = 1},
			program = {
				{
					trigger = "player_front",
					actions = {"right"},
				},
				{
					trigger = "wall_front",
					actions = {"u_turn"},
				},
				{
					trigger = "wildcard",
					actions = {"empty", "move"},
				},
			},
		},
		{
			name = "basic_robot",
			humanName = "Moth",
			pos = {4, 3},
			direction = 0,
			program = {
				{
					trigger = "robot_goal",
					actions = {"wait"},
				},
				{
					trigger = "fire",
					actions = {"move"},
				},
				{
					trigger = "wildcard",
					actions = {"move", "right"},
				},
			},
		},
		{
			name = "basic_robot",
			humanName = "Sprinter",
			pos = {3, 2},
			direction = 0,
			program = {
				{
					trigger = "robot_goal",
					actions = {"wait"},
				},
				{
					trigger = "fire",
					actions = {"move_fast", "right", "move_fast", "move_fast", "right", "move_fast", "right", "move_fast", "right"},
				},
				{
					trigger = "wildcard",
					actions = {"move_fast"},
				},
			},
		},
	},
	blocks = {
		{
			name = "cmd_paint_down",
			pos = {10, 6},
			direction = 0,
		},
		{
			name = "fire",
			pos = {3, 2},
			direction = 0,
		},
		{
			name = "fire",
			pos = {4, 4},
			direction = 0,
		},
		{
			name = "robot_goal",
			pos = {12, 2},
			direction = 0,
		},
		{
			name = "fire",
			pos = {5, 3},
			direction = 0,
		},
		{
			name = "fire",
			pos = {5, 5},
			direction = 0,
		},
		{
			name = "fire",
			pos = {8, 4},
			direction = 0,
		},
		{
			name = "fire",
			pos = {6, 4},
			direction = 0,
		},
		{
			name = "fire",
			pos = {3, 6},
			direction = 0,
		},
		{
			name = "fire",
			pos = {7, 6},
			direction = 0,
		},
		{
			name = "fire",
			pos = {7, 2},
			direction = 0,
		},
		{
			name = "fire",
			pos = {7, 4},
			direction = 0,
		},
		{
			name = "fire",
			pos = {3, 7},
			direction = 0,
		},
		{
			name = "fire",
			pos = {4, 7},
			direction = 0,
		},
		{
			name = "fire",
			pos = {5, 7},
			direction = 0,
		},
		{
			name = "fire",
			pos = {6, 7},
			direction = 0,
		},
		{
			name = "fire",
			pos = {7, 7},
			direction = 0,
		},
		{
			name = "fire",
			pos = {8, 6},
			direction = 0,
		},
		{
			name = "fire",
			pos = {8, 2},
			direction = 0,
		},
		{
			name = "fire",
			pos = {7, 1},
			direction = 0,
		},
		{
			name = "fire",
			pos = {6, 1},
			direction = 0,
		},
		{
			name = "fire",
			pos = {5, 1},
			direction = 0,
		},
		{
			name = "fire",
			pos = {4, 1},
			direction = 0,
		},
		{
			name = "fire",
			pos = {3, 1},
			direction = 0,
		},
		{
			name = "fire",
			pos = {2, 2},
			direction = 0,
		},
		{
			name = "fire",
			pos = {2, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 7},
			direction = 0,
		},
		{
			name = "fire",
			pos = {2, 5},
			direction = 0,
		},
		{
			name = "fire",
			pos = {2, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 0},
			direction = 0,
		},
		{
			name = "fire",
			pos = {1, 2},
			direction = 0,
		},
		{
			name = "fire",
			pos = {1, 3},
			direction = 0,
		},
		{
			name = "fire",
			pos = {1, 7},
			direction = 0,
		},
		{
			name = "robot_goal",
			pos = {1, 4},
			direction = 0,
		},
		{
			name = "fire",
			pos = {2, 4},
			direction = 0,
		},
		{
			name = "fire",
			pos = {1, 5},
			direction = 0,
		},
		{
			name = "fire",
			pos = {1, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {6, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 0},
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
			pos = {6, 0},
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
			name = "wall",
			pos = {9, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 0},
			direction = 0,
		},
		{
			name = "fire",
			pos = {2, 7},
			direction = 0,
		},
		{
			name = "fire",
			pos = {2, 1},
			direction = 0,
		},
		{
			name = "player_goal",
			pos = {12, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 2},
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
			name = "robot_goal",
			pos = {5, 4},
			direction = 2,
		},
		{
			name = "wall",
			pos = {9, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 1},
			direction = 0,
		},
		{
			name = "fire",
			pos = {8, 7},
			direction = 0,
		},
		{
			name = "fire",
			pos = {8, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 7},
			direction = 0,
		},
		{
			name = "cmd_left",
			pos = {10, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 0},
			direction = 0,
		},
		{
			name = "fire",
			pos = {1, 1},
			direction = 0,
		},
	},
}
