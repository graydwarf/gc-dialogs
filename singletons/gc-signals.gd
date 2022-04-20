extends Node

# GC loads this project as a pck file so prefixing signal names
# with gc to avoid potential collisions
signal gcLoadExample
signal gcCancelDialog # Inform current example that user hit ESC on keyboard

