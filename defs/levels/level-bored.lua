return {
	humanName = "Jump Scare",
	description = "Bored Bot is waiting impatiently for a cleaning job.\n\nPerhaps it needs to be told to slow down a little...",
	dimensions = {11, 10},
	doorOpenState = {},
	player = {
		{
			name = "player",
			pos = {8, 3},
			direction = 2,
		},
	},
	robots = {
		{
			name = "basic_robot",
			humanName = "Eight Bot",
			pos = {4, 4},
			direction = 3,
			swapAction = {trigger = "robot_goal", slot = 1},
			program = {
				{
					trigger = "robot_goal",
					actions = {"wait"},
				},
				{
					trigger = "wall_front",
					actions = {"left"},
				},
				{
					trigger = "wildcard",
					actions = {"move"},
				},
			},
		},
		{
			name = "basic_robot",
			humanName = "Bored Bot",
			pos = {8, 5},
			direction = 1,
			swapAction = {trigger = "paint_see_front", slot = 2},
			program = {
				{
					trigger = "paint_see_front",
					actions = {"reset_1", "empty", "move_fast"},
				},
				{
					trigger = "paint",
					actions = {"paint_up", "set_1"},
				},
				{
					trigger = "robot_goal",
					actions = {"wait"},
				},
				{
					trigger = "register_1",
					actions = {"right"},
				},
				{
					trigger = "wall_front",
					actions = {"u_turn"},
				},
				{
					trigger = "wildcard",
					actions = {"wait"},
				},
			},
		},
	},
	blocks = {
		{
			name = "wall",
			pos = {1, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 7},
			direction = 0,
		},
		{
			name = "robot_goal",
			pos = {1, 3},
			direction = 1,
		},
		{
			name = "wall",
			pos = {3, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 4},
			direction = 0,
		},
		{
			name = "player_goal",
			pos = {5, 8},
			direction = 1,
		},
		{
			name = "wall",
			pos = {1, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {6, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {6, 8},
			direction = 0,
		},
		{
			name = "robot_goal",
			pos = {4, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {6, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 0},
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
			pos = {10, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 5},
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
			name = "wall",
			pos = {11, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 8},
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
			pos = {-1, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 0},
			direction = 0,
		},
	},
}
