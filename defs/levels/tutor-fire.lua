return {
	humanName = "Incendiary",
	description = "Paint puts out fires but your robot is not as fireproof as the older models.\n\n\n",
	dimensions = {12, 9},
	doorOpenState = {},
	player = {
		{
			name = "player",
			pos = {4, 5},
			direction = 0,
		},
	},
	robots = {
		{
			name = "basic_robot",
			humanName = "Firefighter",
			pos = {7, 3},
			direction = 1,
			program = {
				{
					trigger = "paint",
					actions = {"paint_up", "right"},
				},
				{
					trigger = "wall_front",
					actions = {"paint_down", "u_turn"},
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
			pos = {-3, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-3, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-3, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-3, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-3, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-3, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-3, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-3, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-3, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 8},
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
			pos = {1, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 0},
			direction = 0,
		},
		{
			name = "fire",
			pos = {6, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 0},
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
			name = "fire",
			pos = {8, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 1},
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
			pos = {11, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 5},
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
			name = "fire",
			pos = {9, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 7},
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
			pos = {1, 2},
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
			name = "wall",
			pos = {3, 1},
			direction = 0,
		},
		{
			name = "fire",
			pos = {7, 5},
			direction = 0,
		},
		{
			name = "fire",
			pos = {10, 5},
			direction = 0,
		},
		{
			name = "fire",
			pos = {5, 4},
			direction = 0,
		},
		{
			name = "fire",
			pos = {6, 4},
			direction = 0,
		},
		{
			name = "fire",
			pos = {5, 3},
			direction = 0,
		},
		{
			name = "fire",
			pos = {4, 2},
			direction = 0,
		},
		{
			name = "fire",
			pos = {5, 2},
			direction = 0,
		},
		{
			name = "fire",
			pos = {4, 1},
			direction = 0,
		},
		{
			name = "fire",
			pos = {7, 2},
			direction = 0,
		},
		{
			name = "fire",
			pos = {9, 4},
			direction = 0,
		},
		{
			name = "fire",
			pos = {9, 1},
			direction = 0,
		},
		{
			name = "fire",
			pos = {10, 2},
			direction = 0,
		},
		{
			name = "fire",
			pos = {10, 1},
			direction = 0,
		},
		{
			name = "player_goal",
			pos = {9, 2},
			direction = 0,
		},
		{
			name = "robot_goal",
			pos = {3, 6},
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
			pos = {10, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 6},
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
			pos = {11, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 8},
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
			pos = {2, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 1},
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
			pos = {1, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 1},
			direction = 0,
		},
		{
			name = "fire",
			pos = {7, 6},
			direction = 0,
		},
		{
			name = "fire",
			pos = {6, 5},
			direction = 0,
		},
	},
	hideChipInventory = false,
}
