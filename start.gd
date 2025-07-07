extends Node2D

signal show_game
signal show_help
signal exit
	

func _on_visibility_changed() -> void:
	show_scores()
	show_stufe()
		
func show_scores():
	var hsc = ""
	if Score.is_high_score:
		hsc = " das ist Highscore in Stufe "+ str(Score.stufe)
	
	$Hintergrund/Spielstand/Taler.text = "Du hast "+ str(Score.act_score) + " Taler erspielt" + hsc
		
	$Hintergrund/Spielstand/HighScores.text = "Highscores in den Stufen : " + str(Score.high_score1) +" Taler / "+ str(Score.high_score2) +" Taler / "+ str(Score.high_score3) + " Taler"

func show_stufe():
	$Buttons/LabelStufe.text = "Stufe: " + str(Score.stufe)

func _on_button_start_pressed() -> void:
	emit_signal("show_game")
	
func _on_button_hilfe_pressed() -> void:		
	emit_signal("show_help")	
	
func _on_button_beenden_pressed() -> void:
	emit_signal("exit")		


func _on_button_stufe_1_pressed() -> void:
	Score.stufe = 1
	show_stufe()

func _on_button_stufe_2_pressed() -> void:
	Score.stufe = 2
	show_stufe()

func _on_button_stufe_3_pressed() -> void:
	Score.stufe = 3
	show_stufe()
	

func _on_button_reset_pressed() -> void:
	Score.reset()	
	show_scores()
