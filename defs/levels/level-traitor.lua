return {
	humanName = "Impasse",
	description = "Remember the robots' programming sees boxes as walls.\n\nLoyal Bot would walk through walls for you.\n\nTraitor Bot... not so much.",
	dimensions = {15, 11},
	doorOpenState = {},
	player = {
		{
			name = "player",
			pos = {4, 6},
			direction = 3,
		},
	},
	robots = {
		{
			name = "basic_robot",
			humanName = "Loyal Bot",
			pos = {3, 8},
			direction = 3,
			swapAction = {trigger = "robot_goal", slot = 2},
			program = {
				{
					trigger = "player_front",
					actions = {"wait"},
				},
				{
					trigger = "robot_goal",
					actions = {"wait","empty"},
				},
				{
					trigger = "player_see_left",
					actions = {"move"},
				},
				{
					trigger = "player_see_right",
					actions = {"move"},
				},
				{
					trigger = "wall_front",
					actions = {"right"},
				},
				{
					trigger = "wildcard",
					actions = {"move"},
				},
			},
		},
		{
			name = "box",
			pos = {6, 5},
			direction = 0,
		},
		{
			name = "basic_robot",
			humanName = "Traitor Bot",
			pos = {12, 8},
			direction = 3,
			swapAction = {trigger = "paint", slot = 1},
			program = {
				{
					trigger = "player_see_front",
					actions = {"move_fast"},
				},
				{
					trigger = "paint",
					actions = {"empty"},
				},
				{
					trigger = "wildcard",
					actions = {"right"},
				},
			},
		},
		{
			name = "box",
			pos = {10, 7},
			direction = 2,
		},
	},
	blocks = {
		{
			name = "wall",
			pos = {0, 3},
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
			pos = {1, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {8, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {7, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {6, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {5, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {7, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {13, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {-1, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 6},
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
			pos = {9, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {8, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {6, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {14, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {-1, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 1},
			direction = 3,
		},
		{
			name = "wall",
			pos = {13, 2},
			direction = 3,
		},
		{
			name = "wall",
			pos = {2, 8},
			direction = 2,
		},
		{
			name = "wall",
			pos = {7, 8},
			direction = 2,
		},
		{
			name = "wall",
			pos = {4, 8},
			direction = 2,
		},
		{
			name = "wall",
			pos = {7, 7},
			direction = 2,
		},
		{
			name = "wall",
			pos = {6, 8},
			direction = 2,
		},
		{
			name = "wall",
			pos = {9, 2},
			direction = 0,
		},
		{
			name = "player_goal",
			pos = {5, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 2},
			direction = 2,
		},
		{
			name = "robot_goal",
			pos = {3, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 6},
			direction = 2,
		},
		{
			name = "wall",
			pos = {14, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 3},
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
			pos = {11, 2},
			direction = 0,
		},
		{
			name = "robot_goal",
			pos = {12, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 2},
			direction = 3,
		},
		{
			name = "wall",
			pos = {8, 8},
			direction = 3,
		},
		{
			name = "wall",
			pos = {0, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {7, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 4},
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
			pos = {1, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {0, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {6, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {3, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {2, 0},
			direction = 3,
		},
		{
			name = "cmd_move",
			pos = {5, 3},
			direction = 0,
		},
	},
	hideChipInventory = false,
}
