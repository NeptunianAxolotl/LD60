return {
	humanName = "Impasse",
	description = "These old robots are strong enough to push boxes. Unfortunately their programming sees boxes as walls.\n\nLoyal Bot would walk through walls for you.\n\nTraitor Bot... not so much.",
	dimensions = {15, 11},
	doorOpenState = {},
	player = {
		{
			name = "player",
			pos = {4, 6},
			direction = 3,
		},
	},
	robots = {
		{
			name = "basic_robot",
			humanName = "Traitor Bot",
			pos = {12, 8},
			direction = 1,
			swapAction = {trigger = "paint", slot = 1},
			program = {
				{
					trigger = "player_see_front",
					actions = {"move_fast"},
				},
				{
					trigger = "paint",
					actions = {"empty"},
				},
				{
					trigger = "wildcard",
					actions = {"right"},
				},
			},
		},
		{
			name = "box",
			pos = {10, 7},
			direction = 2,
		},
	},
	blocks = {
		{
			name = "wall",
			pos = {0, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 2},
			direction = 0,
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
			name = "cmd_move",
			pos = {5, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {7, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {6, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {5, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {1, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {-1, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {6, 10},
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
			pos = {2, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {2, 0},
			direction = 3,
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
			pos = {14, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {1, 0},
			direction = 3,
		},
		{
			name = "wall",
			pos = {14, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 9},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {14, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {8, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 6},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 5},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 1},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 10},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {-1, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {0, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 0},
			direction = 3,
		},
	},
	hideChipInventory = false,
}
