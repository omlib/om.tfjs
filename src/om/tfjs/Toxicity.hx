package om.tfjs;

import js.lib.Promise;

private typedef ModelConfig = Dynamic;

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
	static function load( ?threshold : Float, ?labels : Array<String> ) : Promise<Array<Prediction>>;
	function classify( sentences : Array<String>) : Promise<Array<Prediction>>;
}
