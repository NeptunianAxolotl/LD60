return {
	humanName = "Hall Cleaners",
	description = "These sentries restlessly patrol the hallway to keep it clean of paint.\n\nWin by putting all three robots on charging points, even if momentarily.\n\nUse X/N/Left Mouse Button to add or remove paint.\n",
	dimensions = {13, 8},
	hideChipInventory = true,
	doorOpenState = {},
	player = {
		{
			name = "player",
			pos = {1, 2},
			direction = 0,
		},
	},
	robots = {
		{
			name = "basic_robot",
			humanName = "Sentry Bot",
			pos = {7, 3},
			direction = 2,
			program = {
				{
					trigger = "robot_goal",
					actions = {"u_turn", "move"},
				},
				{
					trigger = "paint",
					actions = {"wait", "paint_up"},
				},
				{
					trigger = "wildcard",
					actions = {"move"},
				},
			},
		},
		{
			name = "basic_robot",
			humanName = "Patrol Bot",
			pos = {6, 4},
			direction = 2,
			program = {
				{
					trigger = "robot_goal",
					actions = {"u_turn", "move"},
				},
				{
					trigger = "paint",
					actions = {"wait", "paint_up"},
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
			name = "robot_goal",
			pos = {3, 3},
			direction = 0,
		},
		{
			name = "robot_goal",
			pos = {2, 4},
			direction = 0,
		},
		{
			name = "robot_goal",
			pos = {10, 3},
			direction = 2,
		},
		{
			name = "robot_goal",
			pos = {9, 4},
			direction = 2,
		},
		{
			name = "wall",
			pos = {5, 2},
			direction = 2,
		},
		{
			name = "wall",
			pos = {4, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {6, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 6},
			direction = 2,
		},
		{
			name = "wall",
			pos = {4, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 5},
			direction = 2,
		},
		{
			name = "wall",
			pos = {2, 5},
			direction = 2,
		},
		{
			name = "wall",
			pos = {3, 5},
			direction = 2,
		},
		{
			name = "wall",
			pos = {4, 5},
			direction = 2,
		},
		{
			name = "wall",
			pos = {5, 5},
			direction = 2,
		},
		{
			name = "wall",
			pos = {6, 5},
			direction = 2,
		},
		{
			name = "wall",
			pos = {7, 5},
			direction = 2,
		},
		{
			name = "wall",
			pos = {8, 5},
			direction = 2,
		},
		{
			name = "wall",
			pos = {6, 2},
			direction = 2,
		},
		{
			name = "wall",
			pos = {7, 2},
			direction = 2,
		},
		{
			name = "wall",
			pos = {8, 2},
			direction = 2,
		},
		{
			name = "wall",
			pos = {9, 2},
			direction = 2,
		},
		{
			name = "wall",
			pos = {10, 2},
			direction = 2,
		},
		{
			name = "wall",
			pos = {11, 2},
			direction = 2,
		},
		{
			name = "wall",
			pos = {7, 6},
			direction = 0,
		},
		{
			name = "player_goal",
			pos = {10, 5},
			direction = 2,
		},
		{
			name = "wall",
			pos = {10, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {6, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 1},
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
			pos = {12, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 7},
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
			name = "wall",
			pos = {8, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 7},
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
			pos = {12, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 0},
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
			pos = {6, 0},
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
			pos = {-1, 0},
			direction = 0,
		},
	},
}
