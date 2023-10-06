extends Control
func _on_btn_calc_pressed():
	var len = int($txtnum1.text)
	var wid = int($txtnum2.text)
	var area = len * wid
	var perim = len * 2 + wid *2
	$output.text = "Area: %.d " %(area) + "Permiter: %.d " %(perim)
