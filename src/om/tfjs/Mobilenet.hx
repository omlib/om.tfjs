package om.tfjs;

import haxe.extern.EitherType;
import js.lib.Promise;
import js.html.CanvasElement;
import js.html.ImageData;
import js.html.ImageElement;
import js.html.VideoElement;

enum abstract MobileNetAlpha(Float) to Float {
	var _025 = 0.25;
	var _050 = 0.50;
	var _075 = 0.75;
	var _1 = 1.0;
}

private typedef ModelConfig = {
	var version : String;
	var ?alpha : MobileNetAlpha;
	var ?modelUrl : String;
	var ?inputRange : Array<Float>;
}

typedef Prediction = {
	var className : String;
	var probability : Float;
}

/**

	Image recogniton.
	
	https://github.com/tensorflow/tfjs-models/tree/master/mobilenet
**/
@:native("mobilenet")
extern class Mobilenet {
	static function load( ?modelConfig : ModelConfig ) : Promise<Mobilenet>;
	function infer( img : EitherType<ImageData,EitherType<ImageElement,EitherType<CanvasElement,VideoElement>>>, ?embedding : Bool ) : Promise<Array<Prediction>>;
	function classify( img : EitherType<ImageData,EitherType<ImageElement,EitherType<CanvasElement,VideoElement>>>, ?topk : Int ) : Promise<Array<Prediction>>;
}
