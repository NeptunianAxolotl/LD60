return {
	humanName = "Simple Test",
	description = "WSAD or arrows to move.\nSpace/Right Mouse to paint.\nSwap commands with LMB\nDirect all the robots (including yourself) to their designated charging ports.\n\nCtrl+J to toggle editor\nCtrl+R to restart\n",
	dimensions = {14, 9},
	doorOpenState = {},
	player = {
		{
			name = "player",
			pos = {6, 4},
			direction = 1,
		},
	},
	robots = {
		{
			name = "basic_robot",
			humanName = "Left Turner",
			pos = {4, 1},
			direction = 2,
			swapAction = {trigger = "paint", slot = 1},
			swapTrigger = "wall_front",
			program = {
				{
					trigger = "robot_goal",
					actions = {"wait"},
				},
				{
					trigger = "paint",
					actions = {"left", "move"},
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
		{
			name = "basic_robot",
			humanName = "Waiting",
			pos = {5, 3},
			direction = 0,
			swapTrigger = "empty",
			program = {
				{
					trigger = "wall_front",
					actions = {"u_turn"},
				},
				{
					trigger = "empty",
					actions = {"move"},
				},
			},
		},
	},
	blocks = {
		{
			name = "paint",
			pos = {8, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 7},
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
			pos = {11, 4},
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
			pos = {9, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 6},
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
			pos = {3, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 0},
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
			name = "robot_goal",
			pos = {5, 2},
			direction = 0,
		},
		{
			name = "player_goal",
			pos = {7, 4},
			direction = 0,
		},
		{
			name = "paint",
			pos = {8, 1},
			direction = 0,
		},
		{
			name = "paint",
			pos = {4, 1},
			direction = 0,
		},
		{
			name = "paint",
			pos = {4, 5},
			direction = 0,
		},
		{
			name = "cmd_u_turn",
			pos = {7, 3},
			direction = 0,
		},
		{
			name = "cmd_wildcard",
			pos = {5, 6},
			direction = 0,
		},
	},
}
