return {
	humanName = "Painting",
	description = [[
Use Space/Right Mouse to put paint on the floor or to remove it.

This robot turns left when it encounters paint. Stay of of its way as it will crush you. Send everyone to their charging ports.
]],
	hideChipInventory = true,
	dimensions = {16, 10},
	player = {
		{
			name = "player",
			pos = {6, 4},
			direction = 0,
		},
	},
	robots = {
		{
			name = "basic_robot",
			humanName = "Left Paint Turner",
			pos = {6, 6},
			direction = 0,
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
			name = "paint",
			pos = {8, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 1},
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
			pos = {11, 4},
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
			pos = {11, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 5},
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
			pos = {9, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 7},
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
			pos = {4, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 9},
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
			pos = {5, 1},
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
			name = "robot_goal",
			pos = {5, 3},
			direction = 0,
		},
		{
			name = "player_goal",
			pos = {7, 5},
			direction = 0,
		},
		{
			name = "paint",
			pos = {8, 2},
			direction = 0,
		},
		{
			name = "paint",
			pos = {4, 2},
			direction = 0,
		},
		{
			name = "paint",
			pos = {4, 6},
			direction = 0,
		},
	},
}
