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
var id=1;
function validate() {
	$.ajax({
		type : 'POST',
		contentType : 'application/json',
		url : "rest/result/",
		dataType : "json",
		data : JSON.stringify({
		    "num1": $('#num1').val(),
		    "num2": $('#num2').val(),
		    "denom1": $('#denom1').val(),
		    "denom2": $('#denom2').val(),
		    "id" : id,
		}),
		success : function(data, textStatus, jqXHR) {
			alert("Inscription réussie");
			id++;
			window.location.href = "Alumno.jsp" ;
			
		},
		
		error : function(jqXHR, textStatus, errorThrown) {
			$("#message").html("Inscription echouée !");
			alert('postUser error: ' + textStatus + " " + errorThrown);
		}
	});
}







