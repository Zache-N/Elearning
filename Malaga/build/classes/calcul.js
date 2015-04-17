function success() {
	var html ='<div class="container-fluid col-xs-8"><div class="alert alert-success" role="alert" text="center"> Félications vous avez réussi la premiere étape</div></div>';
	$("#success").html(html);
}

function wrong() {
	var html ='<div class="container-fluid col-xs-8"><div class="alert alert-danger" role="alert" text="center"> Vous avez fait une erreur</div></div>';
	$("#wrong").html(html);
}

function simplification() {
	var html ='<div class="container-fluid col-xs-8"><div class="alert alert-success" role="alert" text="center"> La fraction est déjà simplifié à son maximun :)</div></div>';
	$("#simplification").html(html);
}
