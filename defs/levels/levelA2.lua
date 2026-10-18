return {
	humanName = "Level A2",
	description = "WSAD or arrows to move.\nSpace/Right Mouse to paint.\nSwap commands with LMB\nDirect all the robots (including yourself) to their designated charging ports.\n\nCtrl+J to toggle editor\nCtrl+R to restart\n",
	dimensions = {16, 10},
	doorOpenState = {},
	player = {
		{
			name = "player",
			pos = {8, 3},
			direction = 2,
		},
	},
	robots = {
		{
			name = "basic_robot",
			humanName = "Eight Bot",
			pos = {6, 4},
			direction = 3,
			swapAction = {trigger = "robot_goal", slot = 1},
			program = {
				{
					trigger = "robot_goal",
					actions = {"wait"},
				},
				{
					trigger = "wall_front",
					actions = {"left"},
				},
				{
					trigger = "wildcard",
					actions = {"move"},
				},
			},
		},
		{
			name = "basic_robot",
			humanName = "Bored Bot",
			pos = {10, 5},
			direction = 1,
			swapAction = {trigger = "paint_see_front", slot = 2},
			program = {
				{
					trigger = "paint_see_front",
					actions = {"reset_1","empty","move_fast"},
				},
				{
					trigger = "paint",
					actions = {"paint_up","set_1",},
				},
				{
					trigger = "robot_goal",
					actions = {"wait"},
				},
				{
					trigger = "register_1",
					actions = {"right"},
				},
				{
					trigger = "wall_front",
					actions = {"u_turn"},
				},
				{
					trigger = "wildcard",
					actions = {"wait"},
				},
			},
		},
	},
	blocks = {
		{
			name = "wall",
			pos = {3, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 4},
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
			pos = {7, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 3},
			direction = 0,
		},
		{
			name = "robot_goal",
			pos = {6, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 8},
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
			pos = {12, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 9},
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
			pos = {8, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 1},
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
			pos = {9, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 8},
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
			pos = {10, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 7},
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
			pos = {5, 8},
			direction = 0,
		},
		{
			name = "robot_goal",
			pos = {3, 3},
			direction = 1,
		},
		{
			name = "player_goal",
			pos = {7, 8},
			direction = 1,
		},
	},
}
