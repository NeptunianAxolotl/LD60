return {
	humanName = "Homing Bots",
	dimensions = {18, 11},
	hideChipInventory = true,
	doorOpenState = {},
	player = {
		{
			name = "player",
			pos = {8, 6},
			direction = 1,
		},
	},
	robots = {
		{
			name = "basic_robot",
			humanName = "Killbot",
			pos = {14, 7},
			direction = 2,
			program = {
				{
					trigger = "player_see_right",
					actions = {"set_1", "right"},
				},
				{
					trigger = "wall_front",
					actions = {"reset_1", "right"},
				},
				{
					trigger = "register_1",
					actions = {"move_fast"},
				},
				{
					trigger = "robot_goal",
					actions = {"wait"},
				},
				{
					trigger = "wall_left",
					actions = {"move"},
				},
				{
					trigger = "wildcard",
					actions = {"left", "move"},
				},
			},
		},
		{
			name = "basic_robot",
			humanName = "Cleanbot",
			pos = {6, 7},
			direction = 0,
			program = {
				{
					trigger = "paint",
					actions = {"paint_up"},
				},
				{
					trigger = "paint_see_front",
					actions = {"move_fast"},
				},
				{
					trigger = "wall_front",
					actions = {"u_turn"},
				},
				{
					trigger = "robot_goal",
					actions = {"wait"},
				},
				{
					trigger = "wildcard",
					actions = {"left", "move", "right", "move"},
				},
			},
		},
	},
	blocks = {
		{
			name = "wall",
			pos = {16, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {15, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 2},
			direction = 0,
		},
		{
			name = "robot_goal",
			pos = {6, 4},
			direction = 1,
		},
		{
			name = "robot_goal",
			pos = {3, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {16, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {15, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 8},
			direction = 0,
		},
		{
			name = "player_goal",
			pos = {10, 2},
			direction = 2,
		},
		{
			name = "paint",
			pos = {13, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 9},
			direction = 3,
		},
		{
			name = "wall",
			pos = {15, 9},
			direction = 3,
		},
		{
			name = "wall",
			pos = {16, 9},
			direction = 3,
		},
		{
			name = "wall",
			pos = {13, 1},
			direction = 3,
		},
		{
			name = "wall",
			pos = {14, 1},
			direction = 3,
		},
		{
			name = "wall",
			pos = {15, 1},
			direction = 3,
		},
		{
			name = "wall",
			pos = {16, 1},
			direction = 3,
		},
		{
			name = "wall",
			pos = {4, 1},
			direction = 3,
		},
		{
			name = "wall",
			pos = {3, 1},
			direction = 3,
		},
		{
			name = "wall",
			pos = {2, 1},
			direction = 3,
		},
		{
			name = "wall",
			pos = {1, 1},
			direction = 3,
		},
		{
			name = "wall",
			pos = {1, 2},
			direction = 3,
		},
		{
			name = "wall",
			pos = {1, 3},
			direction = 3,
		},
		{
			name = "wall",
			pos = {2, 3},
			direction = 3,
		},
		{
			name = "wall",
			pos = {2, 2},
			direction = 3,
		},
		{
			name = "wall",
			pos = {3, 2},
			direction = 3,
		},
		{
			name = "wall",
			pos = {3, 3},
			direction = 3,
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
			pos = {16, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {17, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {17, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {17, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {17, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {17, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {17, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {17, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {17, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {17, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {17, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {17, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {16, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {15, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 11},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 11},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 11},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 11},
			direction = 0,
		},
		{
			name = "wall",
			pos = {6, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {6, 11},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 11},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 11},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 11},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 11},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 11},
			direction = 0,
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
			pos = {11, 11},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 10},
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
	},
}
