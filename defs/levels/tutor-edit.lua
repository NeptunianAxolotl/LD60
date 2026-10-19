return {
	humanName = "Standby Mode",
	description = "1. Run over a tube to grab it.\n2. Move next to a robot.\n3. Press the Z or M keys or the Right Mouse Button to use it.\n\nCommands can be swapped with the highlighted slots on robots.\n",
	dimensions = {13, 9},
	doorOpenState = {},
	player = {
		{
			name = "player",
			pos = {5, 1},
			direction = 0,
		},
	},
	robots = {
		{
			name = "basic_robot",
			humanName = "Sleepy Bot",
			pos = {6, 3},
			direction = 1,
			swapAction = {trigger = "wildcard", slot = 1},
			program = {
				{
					trigger = "robot_goal",
					actions = {"wait"},
				},
				{
					trigger = "player_front",
					actions = {"wait"},
				},
				{
					trigger = "wildcard",
					actions = {"empty"},
				},
			},
		},
	},
	blocks = {
		{
			name = "wall",
			pos = {5, 3},
			direction = 0,
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
			pos = {8, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 3},
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
			name = "player_goal",
			pos = {9, 5},
			direction = 0,
		},
		{
			name = "robot_goal",
			pos = {3, 5},
			direction = 0,
		},
		{
			name = "cmd_left",
			pos = {8, 5},
			direction = 0,
		},
		{
			name = "cmd_move",
			pos = {7, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 3},
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
			pos = {10, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {11, 1},
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
			pos = {3, 2},
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
			pos = {2, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 1},
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
			pos = {-1, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {0, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {1, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {2, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {3, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {4, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {5, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {6, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {7, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {8, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {10, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {11, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {12, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {13, 8},
			direction = 3,
		},
		{
			name = "wall",
			pos = {12, 8},
			direction = 3,
		},
		{
			name = "wall",
			pos = {11, 8},
			direction = 3,
		},
		{
			name = "wall",
			pos = {10, 8},
			direction = 3,
		},
		{
			name = "wall",
			pos = {9, 8},
			direction = 3,
		},
		{
			name = "wall",
			pos = {8, 8},
			direction = 3,
		},
		{
			name = "wall",
			pos = {7, 8},
			direction = 3,
		},
		{
			name = "wall",
			pos = {6, 8},
			direction = 3,
		},
		{
			name = "wall",
			pos = {5, 8},
			direction = 3,
		},
		{
			name = "wall",
			pos = {4, 8},
			direction = 3,
		},
		{
			name = "wall",
			pos = {3, 8},
			direction = 3,
		},
		{
			name = "wall",
			pos = {2, 8},
			direction = 3,
		},
		{
			name = "wall",
			pos = {1, 8},
			direction = 3,
		},
		{
			name = "wall",
			pos = {0, 8},
			direction = 3,
		},
		{
			name = "wall",
			pos = {-1, 8},
			direction = 3,
		},
	},
}
