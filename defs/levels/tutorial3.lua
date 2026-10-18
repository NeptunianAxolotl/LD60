return {
	humanName = "Standby Mode",
	description = [[
Run over a chip to pick it up.
Move next to a robot and press E or Left Mouse to swap in into the slot.
Chips can also be dropped.

This robot has an empty program. Feed it chips to guide it to its charging port.
]],
	dimensions = {16, 10},
	doorOpenState = {},
	player = {
		{
			name = "player",
			pos = {7, 1},
			direction = 0,
		},
	},
	robots = {
		{
			name = "basic_robot",
			pos = {8, 3},
			direction = 1,
			humanName = "Sleepy Bot",
			swapAction = {trigger = "wildcard", slot = 1},
			program = {
				{
					trigger = "wildcard",
					actions = {"empty"},
				},
			},
		},
	},
	blocks = {
		{
			name = "wall",
			pos = {7, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {6, 2},
			direction = 0,
		},
		{
			name = "wall",
			pos = {6, 1},
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
			name = "wall",
			pos = {10, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {9, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {6, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 4},
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
			pos = {3, 7},
			direction = 0,
		},
		{
			name = "wall",
			pos = {3, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {4, 8},
			direction = 0,
		},
		{
			name = "wall",
			pos = {5, 8},
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
			pos = {12, 8},
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
			pos = {13, 4},
			direction = 0,
		},
		{
			name = "wall",
			pos = {13, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {12, 3},
			direction = 0,
		},
		{
			name = "wall",
			pos = {11, 3},
			direction = 0,
		},
		{
			name = "cmd_move",
			pos = {9, 1},
			direction = 0,
		},
		{
			name = "cmd_left",
			pos = {10, 5},
			direction = 0,
		},
		{
			name = "robot_goal",
			pos = {5, 5},
			direction = 0,
		},
		{
			name = "player_goal",
			pos = {11, 5},
			direction = 0,
		},
	},
}
