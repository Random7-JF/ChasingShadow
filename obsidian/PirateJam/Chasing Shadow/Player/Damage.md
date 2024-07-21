
#Engine 
When a player gets hit by an enemy
- Calls a function on the player
	- Shifts the state into Hit
		- hit shifts back into idle after animation
	- Deal damage
		- check if dead,
			- if dead goto Death
			- else goto idle
	- Update UI
		- Via Signal?
		- Via direct pull?
	