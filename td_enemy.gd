extends CharacterBody2D


const SPEED = 300.0
var MAXHP = 30.0
var HP = MAXHP
var DMG = 10.0
var AI_STATE = STATES.IDLE

enum STATES { IDLE=0, DAMAGED, UP, DOWN, LEFT, RIGHT, UPLEFT, UPRIGHT, DOWNLEFT, DOWNRIGHT}

var state_directions = [
	Vector2.ZERO,
	Vector2.UP,
	Vector2.DOWN,
	Vector2.LEFT,
	Vector2.RIGHT,
	Vector2(-1, -1).normalized(), # up left
	Vector2(1, -1).normalized(), # up right
	Vector2(-1, 1).normalized(), # down left
	Vector2(1, 1).normalized(), # down right
	Vector2.ZERO
	
	
]
