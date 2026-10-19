return {
	humanName = "Central",
	description = "What does that so-called\n'Master Bot' think it is doing?\n\nThat is YOUR command center\nit is sitting in.\n\nTake it back.",
	dimensions = {14, 12},
	hideChipInventory = false,
	doorOpenState = {},
	player = {
		{
			name = "player",
			pos = {3, 9},
			direction = 0,
		},
	},
	robots = {
		{
			name = "basic_robot",
			humanName = "Master Bot",
			pos = {10, 8},
			direction = 1,
			swapTrigger = "paint",
			program = {
				{
					trigger = "paint",
					actions = {"left"},
				},
				{
					trigger = "wildcard",
					actions = {"move", "u_turn", "move"},
				},
			},
		},
		{
			name = "basic_robot",
			humanName = "Security Bot",
			pos = {10, 2},
			direction = 2,
			swapTrigger = "player_see_right",
			program = {
				{
					trigger = "player_see_right",
					actions = {"right", "move"},
				},
				{
					trigger = "player_see_left",
					actions = {"left", "move"},
				},
				{
					trigger = "wall_front",
					actions = {"u_turn"},
				},
				{
					trigger = "wildcard",
					actions = {"move_fast"},
				},
			},
		},
		{
			name = "basic_robot",
			humanName = "Janitor Bot",
			pos = {6, 5},
			direction = 1,
			swapTrigger = "wildcard",
			program = {
				{
					trigger = "paint_see_front",
					actions = {"move"},
				},
				{
					trigger = "wildcard",
					actions = {"paint_up", "left", "paint_up", "move"},
				},
			},
		},
	},
	blocks = {
		{
			name = "wall",
			pos = {11, 3},
			direction = 0,
		},
		{
			name = "fire",
			pos = {3, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 5},
			direction = 0,
		},
		{
			name = "door_reverse",
			doorIndex = 3,
			pos = {11, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 6},
			direction = 0,
		},
		{
			name = "door",
			doorIndex = 3,
			pos = {5, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 11},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 0},
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
			pos = {5, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 11},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 5},
			direction = 0,
		},
		{
			name = "fire",
			pos = {2, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 11},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {6, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 12},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 5},
			direction = 0,
		},
		{
			name = "player_goal",
			pos = {10, 8},
			direction = 2,
		},
		{
			name = "wall",
			pos = {12, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 4},
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
			pos = {7, 10},
			direction = 2,
		},
		{
			name = "button_close",
			doorIndex = 3,
			pos = {10, 9},
			direction = 3,
		},
		{
			name = "button_open",
			doorIndex = 3,
			pos = {10, 7},
			direction = 3,
		},
		{
			name = "button_open",
			doorIndex = 2,
			pos = {9, 8},
			direction = 3,
		},
		{
			name = "wall",
			pos = {7, 8},
			direction = 0,
		},
		{
			name = "button_close",
			doorIndex = 2,
			pos = {11, 8},
			direction = 3,
		},
		{
			name = "wall",
			pos = {7, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 4},
			direction = 2,
		},
		{
			name = "wall",
			pos = {7, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 11},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 11},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 11},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 11},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 11},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 11},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 11},
			direction = 0,
		},
		{
			name = "wall",
			pos = {6, 11},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 11},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 11},
			direction = 0,
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
			name = "wall",
			pos = {0, 11},
			direction = 2,
		},
		{
			name = "robot_goal",
			pos = {6, 5},
			direction = 0,
		},
		{
			name = "door",
			doorIndex = 2,
			pos = {5, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {6, 4},
			direction = 2,
		},
		{
			name = "wall",
			pos = {7, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 7},
			direction = 3,
		},
		{
			name = "wall",
			pos = {11, 7},
			direction = 3,
		},
		{
			name = "wall",
			pos = {11, 9},
			direction = 3,
		},
		{
			name = "wall",
			pos = {9, 9},
			direction = 3,
		},
		{
			name = "wall",
			pos = {5, 8},
			direction = 3,
		},
		{
			name = "wall",
			pos = {5, 10},
			direction = 3,
		},
		{
			name = "door",
			doorIndex = 2,
			pos = {5, 9},
			direction = 3,
		},
		{
			name = "door_reverse",
			doorIndex = 2,
			pos = {7, 9},
			direction = 3,
		},
		{
			name = "wall",
			pos = {5, 7},
			direction = 3,
		},
		{
			name = "fire",
			pos = {4, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 0},
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
			pos = {6, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {6, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {10, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {6, 6},
			direction = 0,
		},
		{
			name = "robot_goal",
			pos = {6, 10},
			direction = 0,
		},
		{
			name = "fire",
			pos = {4, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 6},
			direction = 0,
		},
		{
			name = "robot_goal",
			pos = {6, 7},
			direction = 0,
		},
		{
			name = "fire",
			pos = {4, 10},
			direction = 0,
		},
		{
			name = "fire",
			pos = {1, 4},
			direction = 0,
		},
		{
			name = "fire",
			pos = {2, 1},
			direction = 0,
		},
		{
			name = "fire",
			pos = {3, 7},
			direction = 0,
		},
		{
			name = "fire",
			pos = {3, 6},
			direction = 0,
		},
		{
			name = "fire",
			pos = {4, 7},
			direction = 0,
		},
		{
			name = "fire",
			pos = {3, 1},
			direction = 0,
		},
	},
}
