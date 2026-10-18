return {
	humanName = "Slip and Slide",
	description = [[
Slidy Bot follows paint while Cleaner Bot tidies it up.  Their programs require adjustment.

Use Z/M/Right Mouse Button to place commands.

Press Ctrl+R to restart the level if you get stuck.
]],
	dimensions = {16, 10},
	doorOpenState = {},
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
			humanName = "Slidy Bot",
			pos = {7, 6},
			direction = 3,
			swapAction = {trigger = "robot_goal", slot = 1},
			program = {
				{
					trigger = "robot_goal",
					actions = {"empty"},
				},
				{
					trigger = "paint",
					actions = {"move"},
				},
				{
					trigger = "wildcard",
					actions = {"move", "move", "left"},
				},
			},
		},
		{
			name = "basic_robot",
			humanName = "Cleaner Bot",
			pos = {10, 5},
			direction = 3,
			swapAction = {trigger = "paint", slot = 2},
			program = {
				{
					trigger = "robot_goal",
					actions = {"wait"},
				},
				{
					trigger = "paint",
					actions = {"paint_up", "wait"},
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
		{
			name = "cmd_left",
			pos = {6, 5},
			direction = 0,
		},
	},
}
