return {
	humanName = "Level A1",
	description = "bla\n",
	dimensions = {16, 10},
	player = {
		{
			name = "player",
			pos = {6, 4},
			direction = 2,
		},
	},
	robots = {
		{
			name = "basic_robot",
			pos = {4, 3},
			direction = 3,
			humanName = "Spin Bot",
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
			pos = {12, 4},
			direction = 2,
			humanName = "Patrol Bot",
			swapAction = {trigger = "paint", slot = 2},
			program = {
				{
					trigger = "robot_goal",
					actions = {"wait"},
				},
				{
					trigger = "paint",
					actions = {"paint_up","move"},
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
			pos = {2, 0},
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
			pos = {5, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 2},
			direction = 0,
		},
		{
			name = "robot_goal",
			pos = {13, 8},
			direction = 0,
		},
		{
			name = "robot_goal",
			pos = {13, 6},
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
			pos = {12, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 7},
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
			pos = {7, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {6, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 3},
			direction = 0,
		},
		{
			name = "player_goal",
			pos = {13, 7},
			direction = 2,
		},
	},
}
