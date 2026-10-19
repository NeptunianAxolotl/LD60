return {
	humanName = "Slip and Slide",
	description = "Slidy Bot follows paint while Cleaner Bot tidies it up.  Their programs require adjustment.\n\nUse Z/M/Right Mouse Button to place commands.\n\nPress Ctrl+R to restart the level if you get stuck.\n",
	dimensions = {14, 8},
	doorOpenState = {},
	player = {
		{
			name = "player",
			pos = {12, 6},
			direction = 0,
		},
	},
	robots = {
		{
			name = "basic_robot",
			humanName = "Slidy Bot",
			pos = {6, 5},
			direction = 3,
			swapAction = {trigger = "robot_goal", slot = 1},
			brickDetectionClauses= {
				{{trigger = "paint", invert = false}, {trigger = "wall_front", invert = false}},
			},
			program = {
				{
					trigger = "robot_goal",
					actions = {"empty"},
				},
				{
					trigger = "paint",
					actions = {"move"},
				},
				{
					trigger = "wildcard",
					actions = {"move", "move", "left"},
				},
			},
		},
		{
			name = "basic_robot",
			humanName = "Cleaner Bot",
			pos = {9, 4},
			direction = 3,
			swapAction = {trigger = "paint", slot = 2},
			program = {
				{
					trigger = "robot_goal",
					actions = {"wait"},
				},
				{
					trigger = "paint",
					actions = {"paint_up", "wait"},
				},
				{
					trigger = "wall_front",
					actions = {"u_turn"},
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
			pos = {0, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 1},
			direction = 3,
		},
		{
			name = "wall",
			pos = {0, 4},
			direction = 0,
		},
		{
			name = "robot_goal",
			pos = {1, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 4},
			direction = 3,
		},
		{
			name = "player_goal",
			pos = {12, 1},
			direction = 3,
		},
		{
			name = "wall",
			pos = {3, 3},
			direction = 3,
		},
		{
			name = "wall",
			pos = {0, 6},
			direction = 0,
		},
		{
			name = "cmd_left",
			pos = {5, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 5},
			direction = 3,
		},
		{
			name = "wall",
			pos = {11, 5},
			direction = 3,
		},
		{
			name = "wall",
			pos = {7, 3},
			direction = 3,
		},
		{
			name = "wall",
			pos = {7, 2},
			direction = 3,
		},
		{
			name = "wall",
			pos = {13, 6},
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
			pos = {13, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 1},
			direction = 0,
		},
		{
			name = "robot_goal",
			pos = {1, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {6, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 7},
			direction = 0,
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
			pos = {0, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 0},
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
			name = "wall",
			pos = {13, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 7},
			direction = 0,
		},
	},
}
