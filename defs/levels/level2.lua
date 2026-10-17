return {
	humanName = "Level 2",
	dimensions = {16, 10},
	player = {
		{
			name = "player",
			pos = {3, 5},
			direction = 0,
		},
	},
	robots = {
		{
			name = "fast_robot",
			pos = {7, 2},
			direction = 2,
			program = {
				{
					trigger = "paint",
					actions = {"wait", "wait", "move_fast"},
				},
				{
					trigger = "wall_front",
					actions = {"reflect_fast"},
				},
				{
					trigger = "wildcard",
					actions = {"move_fast"},
				},
			},
		},
		{
			name = "fast_robot",
			pos = {7, 3},
			direction = 2,
			program = {
				{
					trigger = "paint",
					actions = {"wait", "wait", "move_fast"},
				},
				{
					trigger = "wall_front",
					actions = {"reflect_fast"},
				},
				{
					trigger = "wildcard",
					actions = {"move_fast"},
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
			pos = {11, 7},
			direction = 0,
		},
		{
			name = "robot_goal",
			pos = {2, 3},
			direction = 0,
		},
		{
			name = "player_goal",
			pos = {12, 5},
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
			pos = {3, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {6, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 5},
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
			name = "robot_goal",
			pos = {2, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 7},
			direction = 0,
		},
	},
	description = "WSAD or arrows to move.\nSpace/Right Mouse to paint.\n\nDirect all the robots (including yourself) to their designated charging ports.\n\nCtrl+J to toggle editor\nCtrl+R to restart\n",
}
