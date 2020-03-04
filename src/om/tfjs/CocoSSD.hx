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

typedef ModelConfig = {
	var ?base : Dynamic;
	var ?modelUrl : String;
}

typedef BBox = {
	var x : Float;
	var y : Float;
	var width : Float;
	var height : Float;
}

typedef Result = {
	var bbox : BBox;
	@:native("class") var class_ : String;
	var score : Float;
}

/**
	Object detection.
	
	https://github.com/tensorflow/tfjs-models/tree/master/coco-ssd
**/
@:native("cocoSsd")
extern class CocoSSD {
	static function load( ?modelConfig : ModelConfig ) : Promise<CocoSSD>;
	function detect( img : EitherType<ImageData,EitherType<ImageElement,EitherType<CanvasElement,VideoElement>>>, ?maxDetectionSize : Int ) : Promise<Array<Result>>;
}
