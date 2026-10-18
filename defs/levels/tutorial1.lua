return {
	humanName = "Training 1",
	description = "WSAD or arrows to move.\nThis polite robot will turn aside\nrather than crush you.\nDirect all the robots (including yourself) to their designated charging ports.\n\nCtrl+J to toggle editor\nCtrl+R to restart\n",
	dimensions = {14, 9},
	doorOpenState = {},
	player = {
		{
			name = "player",
			pos = {9, 4},
			direction = 0,
		},
	},
	robots = {
		{
			name = "basic_robot",
			pos = {5, 3},
			direction = 3,
			humanName = "Polite Bot",
			program = {
				{
					trigger = "robot_goal",
					actions = {"wait"},
				},
				{
					trigger = "player_front",
					actions = {"right"},
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
			name = "player_goal",
			pos = {7, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 3},
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
			name = "wall",
			pos = {3, 7},
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
			pos = {13, 8},
			direction = 1,
		},
		{
			name = "wall",
			pos = {12, 8},
			direction = 1,
		},
		{
			name = "wall",
			pos = {13, 7},
			direction = 1,
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
			pos = {11, 1},
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
			pos = {11, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 8},
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
			pos = {6, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 5},
			direction = 1,
		},
		{
			name = "wall",
			pos = {6, 5},
			direction = 1,
		},
		{
			name = "wall",
			pos = {6, 6},
			direction = 1,
		},
		{
			name = "wall",
			pos = {6, 7},
			direction = 1,
		},
		{
			name = "wall",
			pos = {5, 7},
			direction = 1,
		},
		{
			name = "wall",
			pos = {5, 6},
			direction = 1,
		},
		{
			name = "wall",
			pos = {5, 5},
			direction = 1,
		},
		{
			name = "wall",
			pos = {4, 6},
			direction = 1,
		},
		{
			name = "wall",
			pos = {4, 7},
			direction = 1,
		},
		{
			name = "wall",
			pos = {12, 4},
			direction = 1,
		},
		{
			name = "wall",
			pos = {13, 4},
			direction = 1,
		},
		{
			name = "wall",
			pos = {13, 5},
			direction = 1,
		},
		{
			name = "wall",
			pos = {13, 6},
			direction = 1,
		},
		{
			name = "robot_goal",
			pos = {12, 6},
			direction = 1,
		},
	},
}
