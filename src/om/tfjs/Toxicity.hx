package om.tfjs;

import js.lib.Promise;

private typedef ModelConfig = Dynamic;

enum abstract ToxicityLabel(String) to String {
	var identity_attack;
	var insult;
	var obscene;
	var severe_toxicity;
	var sexual_explicit;
	var threat;
	var toxicity;
}

private typedef Result = {
	var probabilities : Array<Float>;
	var match : Bool;
}

private typedef Prediction = {
	var label : String;
	var results : Array<Result>;
}

/**
	Toxicity classifier.
	
	The toxicity model detects whether text contains toxic content such as threatening language, insults, obscenities, identity-based hate, or sexually explicit language.
	
	https://github.com/tensorflow/tfjs-models/tree/master/toxicity
**/

@:native("toxicity")
extern class Toxicity {

	var labels : Array<String>;
	var model : Dynamic;
	var threshold : Float;
	var tokenizer : Dynamic;
	var toxicityLabels : Array<ToxicityLabel>;

	static function load( ?threshold : Float, ?labels : Array<String> ) : Promise<Toxicity>;

	function classify( sentences : Array<String>) : Promise<Array<Prediction>>;
}
