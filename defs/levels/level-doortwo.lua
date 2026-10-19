return {
	humanName = "Airlock",
	description = "Warden Bot is already on its charging platform. Unfortunately, you are not.\n\nYou can swap the trigger of this robot.\n\nPress Ctrl+R to restart the level if you get stuck.",
	dimensions = {15, 9},
	textSize = 480,
	hideChipInventory = false,
	doorOpenState = {},
	player = {
		{
			name = "player",
			pos = {8, 6},
			direction = 3,
		},
	},
	robots = {
		{
			name = "basic_robot",
			pos = {13, 4},
			direction = 2,
			humanName = "Warden Bot",
			swapTrigger = "wall_front",
			program = {
				{
					trigger = "wall_front",
					actions = {"paint_up","right"},
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
			pos = {0, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 5},
			direction = 2,
		},
		{
			name = "wall",
			pos = {0, 4},
			direction = 2,
		},
		{
			name = "wall",
			pos = {1, 4},
			direction = 2,
		},
		{
			name = "wall",
			pos = {0, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 8},
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
			pos = {11, 8},
			direction = 1,
		},
		{
			name = "wall",
			pos = {10, 8},
			direction = 1,
		},
		{
			name = "wall",
			pos = {-1, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 7},
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
			direction = 1,
		},
		{
			name = "wall",
			pos = {1, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 6},
			direction = 1,
		},
		{
			name = "wall",
			pos = {10, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 7},
			direction = 1,
		},
		{
			name = "wall",
			pos = {12, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 3},
			direction = 2,
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
			pos = {12, 2},
			direction = 1,
		},
		{
			name = "wall",
			pos = {12, 3},
			direction = 1,
		},
		{
			name = "wall",
			pos = {14, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 6},
			direction = 2,
		},
		{
			name = "wall",
			pos = {13, 5},
			direction = 1,
		},
		{
			name = "wall",
			pos = {13, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 0},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 2},
			direction = 1,
		},
		{
			name = "wall",
			pos = {15, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {15, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {15, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {15, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 3},
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
			pos = {1, 2},
			direction = 2,
		},
		{
			name = "wall",
			pos = {1, 5},
			direction = 2,
		},
		{
			name = "wall",
			pos = {12, 1},
			direction = 1,
		},
		{
			name = "wall",
			pos = {12, 5},
			direction = 1,
		},
		{
			name = "wall",
			pos = {13, 3},
			direction = 1,
		},
		{
			name = "wall",
			pos = {12, 8},
			direction = 1,
		},
		{
			name = "wall",
			pos = {0, 6},
			direction = 2,
		},
		{
			name = "wall",
			pos = {14, 2},
			direction = 1,
		},
		{
			name = "wall",
			pos = {12, 6},
			direction = 2,
		},
		{
			name = "wall",
			pos = {12, 7},
			direction = 1,
		},
		{
			name = "wall",
			pos = {1, 1},
			direction = 2,
		},
		{
			name = "wall",
			pos = {2, 4},
			direction = 2,
		},
		{
			name = "wall",
			pos = {4, 4},
			direction = 2,
		},
		{
			name = "wall",
			pos = {5, 4},
			direction = 2,
		},
		{
			name = "wall",
			pos = {5, 5},
			direction = 2,
		},
		{
			name = "wall",
			pos = {5, 3},
			direction = 2,
		},
		{
			name = "wall",
			pos = {5, 2},
			direction = 2,
		},
		{
			name = "wall",
			pos = {5, 1},
			direction = 2,
		},
		{
			name = "wall",
			pos = {5, 7},
			direction = 2,
		},
		{
			name = "door",
			doorIndex = 1,
			pos = {5, 6},
			direction = 2,
		},
		{
			name = "door",
			doorIndex = 1,
			pos = {12, 4},
			direction = 2,
		},
		{
			name = "door_reverse",
			doorIndex = 1,
			pos = {3, 4},
			direction = 2,
		},
		{
			name = "robot_goal",
			pos = {13, 4},
			direction = 2,
		},
		{
			name = "button_open",
			doorIndex = 1,
			pos = {7, 3},
			direction = 0,
		},
		{
			name = "button_close",
			doorIndex = 1,
			pos = {10, 5},
			direction = 0,
		},
		{
			name = "player_goal",
			pos = {3, 2},
			direction = 0,
		},
		{
			name = "cmd_paint",
			pos = {3, 6},
			direction = 0,
		},
	},
}
