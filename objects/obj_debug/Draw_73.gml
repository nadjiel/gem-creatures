/// @description Drawing debug info

if(debug) {
	with(all) {
		if(self.id == other.id) continue;
		
		draw_bbox();
	}
}
