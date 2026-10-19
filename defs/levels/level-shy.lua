return {
	humanName = "Shepherd",
	description = "These twin robots are both terrified.\n\nJust get them back on their charging ports for now, we'll worry about counselling later.",
	textSize = 300,
	dimensions = {14, 11},
	hideChipInventory = true,
	doorOpenState = {},
	player = {
		{
			name = "player",
			pos = {10, 5},
			direction = 2,
		},
	},
	robots = {
		{
			name = "basic_robot",
			humanName = "Shy Bot",
			pos = {3, 5},
			direction = 0,
			swapAction = {trigger = "wall_front", slot = 1},
			program = {
				{
					trigger = "player_front",
					actions = {"set_1", "u_turn"},
				},
				{
					trigger = "player_see_right",
					actions = {"left"},
				},
				{
					trigger = "player_see_left",
					actions = {"right"},
				},
				{
					trigger = "wall_front",
					actions = {"move_back"},
				},
				{
					trigger = "register_1",
					actions = {"paint_down","move_fast", "move", "reset_1"},
				},
			},
		},
		{
			name = "basic_robot",
			humanName = "Timid Bot",
			pos = {3, 4},
			direction = 0,
			swapAction = {trigger = "wall_front", slot = 1},
			program = {
				{
					trigger = "player_front",
					actions = {"set_1", "u_turn"},
				},
				{
					trigger = "player_see_right",
					actions = {"left"},
				},
				{
					trigger = "player_see_left",
					actions = {"right"},
				},
				{
					trigger = "wall_front",
					actions = {"empty"},
				},
				{
					trigger = "register_1",
					actions = {"paint_down","move_fast", "move", "reset_1"},
				},
			},
		},
	},
	blocks = {
		{
			name = "wall",
			pos = {0, 8},
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
			pos = {4, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {6, 2},
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
			pos = {0, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 3},
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
			pos = {2, 2},
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
			pos = {0, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 11},
			direction = 3,
		},
		{
			name = "wall",
			pos = {1, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 10},
			direction = 3,
		},
		{
			name = "wall",
			pos = {-1, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {6, 4},
			direction = 1,
		},
		{
			name = "wall",
			pos = {-1, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 1},
			direction = 3,
		},
		{
			name = "wall",
			pos = {11, 1},
			direction = 3,
		},
		{
			name = "wall",
			pos = {12, 1},
			direction = 3,
		},
		{
			name = "wall",
			pos = {12, 2},
			direction = 3,
		},
		{
			name = "wall",
			pos = {13, 1},
			direction = 3,
		},
		{
			name = "wall",
			pos = {13, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {13, 2},
			direction = 3,
		},
		{
			name = "wall",
			pos = {13, 3},
			direction = 3,
		},
		{
			name = "wall",
			pos = {13, 4},
			direction = 3,
		},
		{
			name = "wall",
			pos = {13, 5},
			direction = 3,
		},
		{
			name = "wall",
			pos = {13, 6},
			direction = 3,
		},
		{
			name = "wall",
			pos = {13, 7},
			direction = 3,
		},
		{
			name = "wall",
			pos = {13, 8},
			direction = 3,
		},
		{
			name = "wall",
			pos = {13, 9},
			direction = 3,
		},
		{
			name = "wall",
			pos = {13, 10},
			direction = 3,
		},
		{
			name = "wall",
			pos = {12, 11},
			direction = 3,
		},
		{
			name = "wall",
			pos = {12, 9},
			direction = 3,
		},
		{
			name = "wall",
			pos = {11, 11},
			direction = 3,
		},
		{
			name = "wall",
			pos = {10, 11},
			direction = 3,
		},
		{
			name = "wall",
			pos = {9, 11},
			direction = 3,
		},
		{
			name = "wall",
			pos = {8, 11},
			direction = 3,
		},
		{
			name = "wall",
			pos = {7, 11},
			direction = 3,
		},
		{
			name = "wall",
			pos = {6, 11},
			direction = 3,
		},
		{
			name = "wall",
			pos = {5, 11},
			direction = 3,
		},
		{
			name = "wall",
			pos = {4, 10},
			direction = 3,
		},
		{
			name = "wall",
			pos = {5, 10},
			direction = 3,
		},
		{
			name = "wall",
			pos = {6, 10},
			direction = 3,
		},
		{
			name = "wall",
			pos = {7, 10},
			direction = 3,
		},
		{
			name = "wall",
			pos = {8, 10},
			direction = 3,
		},
		{
			name = "wall",
			pos = {9, 10},
			direction = 3,
		},
		{
			name = "wall",
			pos = {10, 9},
			direction = 3,
		},
		{
			name = "wall",
			pos = {12, 10},
			direction = 3,
		},
		{
			name = "wall",
			pos = {13, 11},
			direction = 3,
		},
		{
			name = "wall",
			pos = {12, 8},
			direction = 3,
		},
		{
			name = "wall",
			pos = {11, 10},
			direction = 3,
		},
		{
			name = "wall",
			pos = {11, 9},
			direction = 3,
		},
		{
			name = "wall",
			pos = {5, 8},
			direction = 3,
		},
		{
			name = "wall",
			pos = {3, 7},
			direction = 3,
		},
		{
			name = "wall",
			pos = {2, 6},
			direction = 3,
		},
		{
			name = "wall",
			pos = {7, 7},
			direction = 3,
		},
		{
			name = "wall",
			pos = {9, 3},
			direction = 3,
		},
		{
			name = "wall",
			pos = {8, 3},
			direction = 3,
		},
		{
			name = "wall",
			pos = {6, 5},
			direction = 3,
		},
		{
			name = "player_goal",
			pos = {2, 5},
			direction = 2,
		},
		{
			name = "wall",
			pos = {9, 6},
			direction = 1,
		},
		{
			name = "wall",
			pos = {10, 6},
			direction = 1,
		},
		{
			name = "wall",
			pos = {11, 4},
			direction = 1,
		},
		{
			name = "robot_goal",
			pos = {8, 5},
			direction = 1,
		},
		{
			name = "robot_goal",
			pos = {9, 7},
			direction = 0,
		},
	},
}
