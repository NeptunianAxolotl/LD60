return {
	humanName = "Painting",
	description = "Use the X or N keys or click the Left Mouse Button to paint.\n\nPaint can also be removed with the same controls.\n\nThis robot turns on paint. It will run over you if you get in the way.\n\nHover the mouse over the commands below for tips",
	dimensions = {12, 9},
	hideChipInventory = true,
	doorOpenState = {},
	player = {
		{
			name = "player",
			pos = {5, 3},
			direction = 0,
		},
	},
	robots = {
		{
			name = "basic_robot",
			humanName = "Lefty Bot",
			pos = {7, 4},
			direction = 3,
			program = {
				{
					trigger = "robot_goal",
					actions = {"wait"},
				},
				{
					trigger = "paint",
					actions = {"left", "move"},
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
			name = "paint",
			pos = {7, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {6, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 0},
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
			pos = {10, 3},
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
			name = "wall",
			pos = {10, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {6, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {6, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 8},
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
			pos = {2, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 0},
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
			name = "robot_goal",
			pos = {4, 2},
			direction = 0,
		},
		{
			name = "player_goal",
			pos = {6, 4},
			direction = 0,
		},
		{
			name = "paint",
			pos = {7, 1},
			direction = 0,
		},
		{
			name = "paint",
			pos = {3, 1},
			direction = 0,
		},
		{
			name = "paint",
			pos = {3, 5},
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
			pos = {1, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 6},
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
			pos = {9, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 5},
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
			pos = {9, 7},
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
			pos = {0, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 8},
			direction = 3,
		},
		{
			name = "wall",
			pos = {8, 8},
			direction = 3,
		},
		{
			name = "wall",
			pos = {9, 8},
			direction = 3,
		},
		{
			name = "wall",
			pos = {10, 8},
			direction = 3,
		},
		{
			name = "wall",
			pos = {11, 8},
			direction = 3,
		},
		{
			name = "wall",
			pos = {12, 8},
			direction = 3,
		},
		{
			name = "wall",
			pos = {0, 8},
			direction = 3,
		},
		{
			name = "wall",
			pos = {1, 8},
			direction = 3,
		},
		{
			name = "wall",
			pos = {1, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {0, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {11, 0},
			direction = 3,
		},
	},
}
