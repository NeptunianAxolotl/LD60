return {
	humanName = "Cleanup Duty",
	description = "One of these robots is leaking. The next shift can worry about the mess - you just need to recharge the robots.",
	dimensions = {14, 9},
	textSize = 250,
	hideChipInventory = true,
	doorOpenState = {},
	player = {
		{
			name = "player",
			pos = {11, 5},
			direction = 3,
		},
	},
	robots = {
		{
			name = "basic_robot",
			humanName = "Leaking Bot",
			pos = {7, 4},
			direction = 3,
			program = {
				{
					trigger = "robot_goal",
					actions = {"wait"},
				},
				{
					trigger = "robot_front",
					actions = {"right"},
				},
				{
					trigger = "wall_front",
					actions = {"left"},
				},
				{
					trigger = "wildcard",
					actions = {"paint_down", "move", "move", "move"},
				},
			},
		},
		{
			name = "basic_robot",
			humanName = "Idle Bot",
			pos = {1, 5},
			direction = 3,
			program = {
				{
					trigger = "robot_front",
					actions = {"right"},
				},
				{
					trigger = "paint",
					actions = {"paint_up", "move"},
				},
				{
					trigger = "paint_see_front",
					actions = {"move"},
				},
				{
					trigger = "paint_see_right",
					actions = {"right"},
				},
				{
					trigger = "paint_see_left",
					actions = {"left"},
				},
				{
					trigger = "wall_front",
					actions = {"u_turn"},
				},
			},
		},
	},
	blocks = {
		{
			name = "wall",
			pos = {9, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 8},
			direction = 1,
		},
		{
			name = "wall",
			pos = {13, 8},
			direction = 1,
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
			pos = {11, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {6, 7},
			direction = 0,
		},
		{
			name = "robot_goal",
			pos = {11, 7},
			direction = 3,
		},
		{
			name = "wall",
			pos = {12, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {6, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {6, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 7},
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
			pos = {11, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 0},
			direction = 0,
		},
		{
			name = "robot_goal",
			pos = {3, 7},
			direction = 3,
		},
		{
			name = "wall",
			pos = {2, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 0},
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
			name = "wall",
			pos = {0, 8},
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
			pos = {3, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 7},
			direction = 1,
		},
		{
			name = "player_goal",
			pos = {7, 7},
			direction = 3,
		},
		{
			name = "paint",
			pos = {7, 4},
			direction = 0,
		},
		{
			name = "paint",
			pos = {10, 3},
			direction = 0,
		},
		{
			name = "paint",
			pos = {5, 5},
			direction = 0,
		},
		{
			name = "paint",
			pos = {2, 3},
			direction = 0,
		},
		{
			name = "paint",
			pos = {5, 2},
			direction = 0,
		},
		{
			name = "paint",
			pos = {6, 6},
			direction = 0,
		},
		{
			name = "paint",
			pos = {8, 6},
			direction = 0,
		},
		{
			name = "paint",
			pos = {9, 2},
			direction = 0,
		},
		{
			name = "paint",
			pos = {1, 6},
			direction = 0,
		},
	},
}
