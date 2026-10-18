return {
	humanName = "Level 2",
	dimensions = {16, 10},
	player = {
		{
			name = "player",
			pos = {4, 3},
			direction = 0,
		},
	},
	robots = {
		{
			name = "basic_robot",
			pos = {7, 5},
			direction = 0,
			humanName = "Patrol Bot",
			program = {
				{
					trigger = "robot_goal",
					actions = {"u_turn", "move"},
				},
				{
					trigger = "paint",
					actions = {"wait", "paint_up"},
				},
				{
					trigger = "wildcard",
					actions = {"move"},
				},
			},
		},
		{
			name = "basic_robot",
			pos = {8, 4},
			direction = 0,
			humanName = "Sentry Bot",
			program = {
				{
					trigger = "robot_goal",
					actions = {"u_turn", "move"},
				},
				{
					trigger = "paint",
					actions = {"wait", "paint_up"},
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
			name = "robot_goal",
			pos = {5, 4},
			direction = 2,
		},
		{
			name = "robot_goal",
			pos = {4, 5},
			direction = 2,
		},
		{
			name = "robot_goal",
			pos = {11, 4},
			direction = 2,
		},
		{
			name = "robot_goal",
			pos = {10, 5},
			direction = 2,
		},
		{
			name = "wall",
			pos = {6, 3},
			direction = 2,
		},
		{
			name = "wall",
			pos = {6, 2},
			direction = 2,
		},
		{
			name = "wall",
			pos = {6, 1},
			direction = 2,
		},
		{
			name = "wall",
			pos = {5, 1},
			direction = 2,
		},
		{
			name = "wall",
			pos = {4, 1},
			direction = 2,
		},
		{
			name = "wall",
			pos = {3, 1},
			direction = 2,
		},
		{
			name = "wall",
			pos = {2, 1},
			direction = 2,
		},
		{
			name = "wall",
			pos = {2, 2},
			direction = 2,
		},
		{
			name = "wall",
			pos = {2, 3},
			direction = 2,
		},
		{
			name = "wall",
			pos = {2, 4},
			direction = 2,
		},
		{
			name = "wall",
			pos = {2, 5},
			direction = 2,
		},
		{
			name = "wall",
			pos = {2, 6},
			direction = 2,
		},
		{
			name = "wall",
			pos = {3, 6},
			direction = 2,
		},
		{
			name = "wall",
			pos = {4, 6},
			direction = 2,
		},
		{
			name = "wall",
			pos = {5, 6},
			direction = 2,
		},
		{
			name = "wall",
			pos = {6, 6},
			direction = 2,
		},
		{
			name = "wall",
			pos = {7, 6},
			direction = 2,
		},
		{
			name = "wall",
			pos = {8, 6},
			direction = 2,
		},
		{
			name = "wall",
			pos = {9, 6},
			direction = 2,
		},
		{
			name = "wall",
			pos = {7, 3},
			direction = 2,
		},
		{
			name = "wall",
			pos = {8, 3},
			direction = 2,
		},
		{
			name = "wall",
			pos = {9, 3},
			direction = 2,
		},
		{
			name = "wall",
			pos = {10, 3},
			direction = 2,
		},
		{
			name = "wall",
			pos = {11, 3},
			direction = 2,
		},
		{
			name = "wall",
			pos = {12, 3},
			direction = 2,
		},
		{
			name = "wall",
			pos = {13, 3},
			direction = 2,
		},
		{
			name = "wall",
			pos = {13, 4},
			direction = 2,
		},
		{
			name = "wall",
			pos = {13, 5},
			direction = 2,
		},
		{
			name = "wall",
			pos = {13, 6},
			direction = 2,
		},
		{
			name = "wall",
			pos = {13, 7},
			direction = 2,
		},
		{
			name = "wall",
			pos = {13, 8},
			direction = 2,
		},
		{
			name = "wall",
			pos = {9, 7},
			direction = 2,
		},
		{
			name = "wall",
			pos = {12, 8},
			direction = 2,
		},
		{
			name = "wall",
			pos = {11, 8},
			direction = 2,
		},
		{
			name = "wall",
			pos = {10, 8},
			direction = 2,
		},
		{
			name = "wall",
			pos = {9, 8},
			direction = 2,
		},
		{
			name = "player_goal",
			pos = {11, 6},
			direction = 2,
		},
	},
	description = "WSAD or arrows to move.\nSpace/Right Mouse to paint.\n\nDirect all the robots (including yourself) to their designated charging ports.\n\nCtrl+J to toggle editor\nCtrl+R to restart\n",
}
