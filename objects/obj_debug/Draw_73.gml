/// @description Drawing debug info

// Drawing the object bounding boxes if debug mode is on
if(debug) {
	with(all) {
		if(self.id == other.id) continue;
		
		draw_bbox();
	}
}
