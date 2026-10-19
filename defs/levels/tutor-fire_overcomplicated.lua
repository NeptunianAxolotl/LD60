return {
	humanName = "Firewall",
	description = "The old models have no trouble passing through fire.\n\nYour robot is not strong enough to stand the heat.\n",
	dimensions = {16, 10},
	hideChipInventory = false,
	doorOpenState = {},
	player = {
		{
			name = "player",
			pos = {6, 4},
			direction = 0,
		},
	},
	robots = {
		{
			name = "basic_robot",
			humanName = "Hacker Bot",
			pos = {6, 2},
			direction = 0,
			swapAction = {trigger = "paint", slot = 2},
			program = {
				{
					trigger = "robot_goal",
					actions = {"wait"},
				},
				{
					trigger = "wall_front",
					actions = {"right", "right", "left"},
				},
				{
					trigger = "paint",
					actions = {"paint_up", "empty", "u_turn"},
				},
				{
					trigger = "wildcard",
					actions = {"move"},
				},
			},
		},
		{
			name = "basic_robot",
			humanName = "Technician Bot",
			pos = {2, 3},
			direction = 0,
			swapTrigger = "empty",
			program = {
				{
					trigger = "paint",
					actions = {"paint_up", "move"},
				},
				{
					trigger = "empty",
					actions = {"move", "right"},
				},
			},
		},
	},
	blocks = {
		{
			name = "door",
			doorIndex = 2,
			pos = {8, 3},
			direction = 0,
		},
		{
			name = "door",
			doorIndex = 2,
			pos = {8, 4},
			direction = 0,
		},
		{
			name = "door",
			doorIndex = 2,
			pos = {8, 5},
			direction = 0,
		},
		{
			name = "door",
			doorIndex = 2,
			pos = {8, 6},
			direction = 0,
		},
		{
			name = "door",
			doorIndex = 2,
			pos = {9, 6},
			direction = 0,
		},
		{
			name = "door",
			doorIndex = 2,
			pos = {10, 6},
			direction = 0,
		},
		{
			name = "door",
			doorIndex = 2,
			pos = {5, 3},
			direction = 0,
		},
		{
			name = "door",
			doorIndex = 2,
			pos = {11, 6},
			direction = 0,
		},
		{
			name = "door",
			doorIndex = 2,
			pos = {11, 5},
			direction = 0,
		},
		{
			name = "door",
			doorIndex = 2,
			pos = {11, 4},
			direction = 0,
		},
		{
			name = "door",
			doorIndex = 2,
			pos = {11, 3},
			direction = 0,
		},
		{
			name = "door",
			doorIndex = 2,
			pos = {10, 3},
			direction = 0,
		},
		{
			name = "robot_goal",
			pos = {10, 4},
			direction = 0,
		},
		{
			name = "robot_goal",
			pos = {2, 4},
			direction = 1,
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
			pos = {12, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {15, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 4},
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
			name = "wall",
			pos = {14, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 8},
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
			pos = {11, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 9},
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
			pos = {5, 6},
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
			pos = {5, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 8},
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
			name = "fire",
			pos = {5, 1},
			direction = 0,
		},
		{
			name = "fire",
			pos = {5, 2},
			direction = 0,
		},
		{
			name = "fire",
			pos = {5, 4},
			direction = 0,
		},
		{
			name = "fire",
			pos = {5, 5},
			direction = 0,
		},
		{
			name = "door",
			doorIndex = 2,
			pos = {9, 3},
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
			pos = {15, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 4},
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
			pos = {14, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 6},
			direction = 0,
		},
		{
			name = "player_goal",
			pos = {9, 5},
			direction = 0,
		},
		{
			name = "button_close",
			doorIndex = 2,
			pos = {12, 7},
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
			pos = {0, 9},
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
			pos = {7, 8},
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
			pos = {1, 8},
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
			pos = {1, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 2},
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
			pos = {14, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {15, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {15, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {15, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {15, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {15, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {15, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {15, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {15, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 5},
			direction = 0,
		},
		{
			name = "button_open",
			doorIndex = 2,
			pos = {3, 3},
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
			name = "cmd_move_back",
			pos = {4, 4},
			direction = 0,
		},
		{
			name = "cmd_wildcard",
			pos = {4, 2},
			direction = 0,
		},
	},
}
