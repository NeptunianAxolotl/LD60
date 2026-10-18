return {
	humanName = "Hall Cleaners",
	description = [[
These sentries restlessly patrol the hallway to keep it clean of paint.

Win by putting all three robots on charging points, even if momentarily.

Use X/N/Left Mouse Button to add or remove paint.
]],
	dimensions = {14, 10},
	doorOpenState = {},
	hideChipInventory = true,
	player = {
		{
			name = "player",
			pos = {3, 3},
			direction = 0,
		},
	},
	robots = {
		{
			name = "basic_robot",
			humanName = "Sentry Bot",
			pos = {8, 4},
			direction = 2,
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
			humanName = "Patrol Bot",
			pos = {7, 5},
			direction = 2,
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
			pos = {4, 4},
			direction = 0,
		},
		{
			name = "robot_goal",
			pos = {3, 5},
			direction = 0,
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
			pos = {5, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 2},
			direction = 0,
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
		{
			name = "wall",
			pos = {1, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 2},
			direction = 0,
		},
	},
}
