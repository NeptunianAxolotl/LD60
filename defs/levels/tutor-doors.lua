return {
	humanName = "Level A1",
	description = "bla\n",
	dimensions = {13, 10},
	doorOpenState = {},
	player = {
		{
			name = "player",
			pos = {6, 6},
			direction = 3,
		},
	},
	robots = {
		{
			name = "basic_robot",
			humanName = "Spin Bot",
			pos = {2, 3},
			direction = 3,
			swapAction = {trigger = "wildcard", slot = 1},
			program = {
				{
					trigger = "robot_goal",
					actions = {"wait"},
				},
				{
					trigger = "wildcard",
					actions = {"left"},
				},
			},
		},
		{
			name = "basic_robot",
			humanName = "Patrol Bot",
			pos = {10, 4},
			direction = 2,
			swapAction = {trigger = "paint", slot = 2},
			program = {
				{
					trigger = "robot_goal",
					actions = {"wait"},
				},
				{
					trigger = "paint",
					actions = {"paint_up", "move"},
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
			pos = {8, 5},
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
			pos = {11, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 2},
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
			pos = {3, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 6},
			direction = 0,
		},
		{
			name = "player_goal",
			pos = {11, 7},
			direction = 2,
		},
		{
			name = "wall",
			pos = {8, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 2},
			direction = 0,
		},
		{
			name = "robot_goal",
			pos = {11, 8},
			direction = 0,
		},
		{
			name = "robot_goal",
			pos = {11, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 1},
			direction = 2,
		},
		{
			name = "wall",
			pos = {10, 1},
			direction = 2,
		},
		{
			name = "wall",
			pos = {9, 1},
			direction = 2,
		},
		{
			name = "wall",
			pos = {2, 5},
			direction = 2,
		},
		{
			name = "wall",
			pos = {1, 5},
			direction = 2,
		},
		{
			name = "wall",
			pos = {1, 6},
			direction = 2,
		},
		{
			name = "wall",
			pos = {1, 7},
			direction = 2,
		},
		{
			name = "wall",
			pos = {1, 8},
			direction = 2,
		},
		{
			name = "wall",
			pos = {2, 6},
			direction = 2,
		},
		{
			name = "wall",
			pos = {2, 7},
			direction = 2,
		},
		{
			name = "wall",
			pos = {2, 8},
			direction = 2,
		},
		{
			name = "door",
			doorIndex = 3,
			pos = {3, 1},
			direction = 1,
		},
		{
			name = "button_close",
			doorIndex = 3,
			pos = {10, 6},
			direction = 1,
		},
		{
			name = "door",
			doorIndex = 3,
			pos = {3, 2},
			direction = 1,
		},
		{
			name = "door_reverse",
			doorIndex = 3,
			pos = {9, 6},
			direction = 1,
		},
		{
			name = "door_reverse",
			doorIndex = 3,
			pos = {9, 7},
			direction = 1,
		},
		{
			name = "door_reverse",
			doorIndex = 3,
			pos = {9, 8},
			direction = 1,
		},
		{
			name = "button_open",
			doorIndex = 3,
			pos = {4, 4},
			direction = 1,
		},
		{
			name = "button_open",
			doorIndex = 3,
			pos = {1, 1},
			direction = 1,
		},
		{
			name = "button_close",
			doorIndex = 3,
			pos = {8, 8},
			direction = 1,
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
			pos = {11, 9},
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
			pos = {12, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 9},
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
