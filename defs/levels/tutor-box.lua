return {
	humanName = "Stevedore",
	description = "Robots are strong enough to push boxes, but they see the boxes as walls.\n\nStuck Bot will need some help to reach a charging port.",
	dimensions = {13, 10},
	hideChipInventory = true,
	doorOpenState = {},
	player = {
		{
			name = "player",
			pos = {3, 7},
			direction = 3,
		},
	},
	robots = {
		{
			name = "box",
			pos = {6, 5},
			direction = 3,
		},
		{
			name = "basic_robot",
			humanName = "Stuck Bot",
			pos = {6, 6},
			direction = 1,
			swapAction = {trigger = "wildcard", slot = 1},
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
					actions = {"empty"},
				},
			},
		},
		{
			name = "basic_robot",
			humanName = "Pusher Bot",
			pos = {4, 4},
			direction = 3,
			swapAction = {trigger = "paint", slot = 1},
			program = {
				{
					trigger = "paint",
					actions = {"move"},
				},
				{
					trigger = "wildcard",
					actions = {"move","move","left"},
				},
			},
		},
		{
			name = "box",
			pos = {11, 5},
			direction = 3,
		},
	},
	blocks = {
		{
			name = "wall",
			pos = {-1, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 8},
			direction = 3,
		},
		{
			name = "wall",
			pos = {-2, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-2, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 2},
			direction = 0,
		},
		{
			name = "robot_goal",
			pos = {2, 7},
			direction = 3,
		},
		{
			name = "wall",
			pos = {5, 6},
			direction = 3,
		},
		{
			name = "wall",
			pos = {-1, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 4},
			direction = 1,
		},
		{
			name = "wall",
			pos = {-2, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-2, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-2, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 5},
			direction = 1,
		},
		{
			name = "wall",
			pos = {-2, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-2, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-2, 3},
			direction = 0,
		},
		{
			name = "door",
			doorIndex = 3,
			pos = {8, 3},
			direction = 3,
		},
		{
			name = "wall",
			pos = {12, 2},
			direction = 3,
		},
		{
			name = "wall",
			pos = {12, 5},
			direction = 3,
		},
		{
			name = "wall",
			pos = {12, 7},
			direction = 3,
		},
		{
			name = "wall",
			pos = {13, 9},
			direction = 3,
		},
		{
			name = "wall",
			pos = {11, 9},
			direction = 3,
		},
		{
			name = "wall",
			pos = {12, 9},
			direction = 3,
		},
		{
			name = "wall",
			pos = {10, 9},
			direction = 3,
		},
		{
			name = "wall",
			pos = {9, 9},
			direction = 3,
		},
		{
			name = "wall",
			pos = {8, 9},
			direction = 3,
		},
		{
			name = "wall",
			pos = {7, 9},
			direction = 3,
		},
		{
			name = "wall",
			pos = {12, 6},
			direction = 3,
		},
		{
			name = "wall",
			pos = {12, 3},
			direction = 3,
		},
		{
			name = "wall",
			pos = {12, 4},
			direction = 3,
		},
		{
			name = "door",
			doorIndex = 3,
			pos = {8, 2},
			direction = 3,
		},
		{
			name = "wall",
			pos = {8, 6},
			direction = 1,
		},
		{
			name = "wall",
			pos = {5, 8},
			direction = 3,
		},
		{
			name = "button_open",
			doorIndex = 3,
			pos = {6, 7},
			direction = 3,
		},
		{
			name = "wall",
			pos = {7, 4},
			direction = 3,
		},
		{
			name = "wall",
			pos = {5, 7},
			direction = 3,
		},
		{
			name = "wall",
			pos = {7, 6},
			direction = 3,
		},
		{
			name = "wall",
			pos = {1, 9},
			direction = 3,
		},
		{
			name = "wall",
			pos = {2, 9},
			direction = 3,
		},
		{
			name = "wall",
			pos = {3, 9},
			direction = 3,
		},
		{
			name = "wall",
			pos = {4, 9},
			direction = 3,
		},
		{
			name = "wall",
			pos = {5, 9},
			direction = 3,
		},
		{
			name = "wall",
			pos = {6, 9},
			direction = 3,
		},
		{
			name = "wall",
			pos = {12, 1},
			direction = 2,
		},
		{
			name = "wall",
			pos = {12, 0},
			direction = 2,
		},
		{
			name = "wall",
			pos = {11, 0},
			direction = 2,
		},
		{
			name = "wall",
			pos = {10, 0},
			direction = 2,
		},
		{
			name = "wall",
			pos = {9, 0},
			direction = 2,
		},
		{
			name = "wall",
			pos = {8, 0},
			direction = 2,
		},
		{
			name = "wall",
			pos = {7, 0},
			direction = 2,
		},
		{
			name = "wall",
			pos = {6, 0},
			direction = 2,
		},
		{
			name = "wall",
			pos = {5, 0},
			direction = 2,
		},
		{
			name = "wall",
			pos = {4, 0},
			direction = 2,
		},
		{
			name = "wall",
			pos = {3, 0},
			direction = 2,
		},
		{
			name = "wall",
			pos = {2, 0},
			direction = 2,
		},
		{
			name = "wall",
			pos = {1, 0},
			direction = 2,
		},
		{
			name = "wall",
			pos = {0, 0},
			direction = 2,
		},
		{
			name = "wall",
			pos = {0, 1},
			direction = 2,
		},
		{
			name = "wall",
			pos = {0, 2},
			direction = 2,
		},
		{
			name = "wall",
			pos = {0, 3},
			direction = 2,
		},
		{
			name = "wall",
			pos = {0, 4},
			direction = 2,
		},
		{
			name = "wall",
			pos = {0, 5},
			direction = 2,
		},
		{
			name = "wall",
			pos = {0, 6},
			direction = 2,
		},
		{
			name = "wall",
			pos = {0, 7},
			direction = 2,
		},
		{
			name = "wall",
			pos = {0, 8},
			direction = 2,
		},
		{
			name = "wall",
			pos = {0, 9},
			direction = 2,
		},
		{
			name = "wall",
			pos = {0, 10},
			direction = 2,
		},
		{
			name = "door",
			doorIndex = 3,
			pos = {8, 1},
			direction = 2,
		},
		{
			name = "robot_goal",
			pos = {2, 8},
			direction = 2,
		},
		{
			name = "player_goal",
			pos = {8, 7},
			direction = 2,
		},
	},
}
