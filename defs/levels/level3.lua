return {
	humanName = "Level 3",
	dimensions = {16, 10},
	player = {
		{
			name = "player",
			pos = {13, 7},
			direction = 0,
		},
	},
	robots = {
		{
			name = "basic_robot",
			pos = {7, 6},
			direction = 3,
			program = {
				{
					trigger = "robot_goal",
					actions = {"wait"},
				},
				{
					trigger = "paint",
					actions = {"move"},
				},
				{
					trigger = "wildcard",
					actions = {"move","move","left"},
				},
			},
		},
		{
			name = "basic_robot",
			pos = {10, 5},
			direction = 3,
			program = {
				{
					trigger = "robot_goal",
					actions = {"wait"},
				},
				{
					trigger = "paint",
					actions = {"left","paint_up"},
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
			pos = {1, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 5},
			direction = 0,
		},
		{
			name = "robot_goal",
			pos = {2, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 5},
			direction = 3,
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
			pos = {4, 1},
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
			pos = {10, 1},
			direction = 0,
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
			pos = {13, 1},
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
			name = "robot_goal",
			pos = {2, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 3},
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
			pos = {13, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 8},
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
			pos = {2, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 4},
			direction = 3,
		},
		{
			name = "player_goal",
			pos = {13, 2},
			direction = 3,
		},
		{
			name = "wall",
			pos = {8, 2},
			direction = 3,
		},
		{
			name = "wall",
			pos = {8, 4},
			direction = 3,
		},
		{
			name = "wall",
			pos = {8, 3},
			direction = 3,
		},
		{
			name = "wall",
			pos = {12, 6},
			direction = 3,
		},
		{
			name = "wall",
			pos = {13, 6},
			direction = 3,
		},
	},
	description = "WSAD or arrows to move.\nSpace/Right Mouse to paint.\n\nDirect all the robots (including yourself) to their designated charging ports.\n\nCtrl+J to toggle editor\nCtrl+R to restart\n",
}
