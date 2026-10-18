return {
	humanName = "Level 4",
	dimensions = {16, 10},
	player = {
		{
			name = "player",
			pos = {11, 4},
			direction = 2,
		},
	},
	robots = {
		{
			name = "basic_robot",
			pos = {8, 4},
			direction = 0,
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
					trigger = "wildcard",
					actions = {"move","move","right","move","right"},
				},
			},
		},
	},
	blocks = {
		{
			name = "wall",
			pos = {14, 1},
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
			pos = {7, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 0},
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
			pos = {3, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 0},
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
			pos = {13, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 3},
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
			pos = {4, 0},
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
			pos = {3, 8},
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
			pos = {12, 9},
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
			pos = {14, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 6},
			direction = 0,
		},
		{
			name = "robot_goal",
			pos = {13, 8},
			direction = 0,
		},
		{
			name = "player_goal",
			pos = {5, 6},
			direction = 0,
		},
	},
	description = "WSAD or arrows to move.\nSpace/Right Mouse to paint.\n\nDirect all the robots (including yourself) to their designated charging ports.\n\nCtrl+J to toggle editor\nCtrl+R to restart\n",
}
