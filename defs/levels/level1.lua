return {
	humanName = "test",
	dimensions = {16, 10},
	player = {
		{
			name = "player",
			pos = {7, 6},
			direction = 0,
		},
	},
	robots = {
		{
			name = "basic_robot",
			pos = {8, 4},
			direction = 3,
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
	},
	blocks = {
		{
			name = "robot_goal",
			pos = {6, 3},
			direction = 3,
		},
		{
			name = "wall",
			pos = {4, 1},
			direction = 3,
		},
		{
			name = "wall",
			pos = {4, 4},
			direction = 3,
		},
		{
			name = "wall",
			pos = {4, 3},
			direction = 3,
		},
		{
			name = "wall",
			pos = {11, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 5},
			direction = 3,
		},
		{
			name = "wall",
			pos = {11, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 2},
			direction = 3,
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
			pos = {6, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 7},
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
			name = "player_goal",
			pos = {10, 3},
			direction = 0,
		},
	},
}
