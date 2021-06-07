package om.tfjs;

import haxe.extern.EitherType;
import js.lib.Promise;
import js.html.CanvasElement;
import js.html.ImageData;
import js.html.ImageElement;
import js.html.VideoElement;

private typedef ModelConfig = {
    var maxContinuousChecks : Int;
    var detectionConfidence : Float;
    var iouThreshold : Float;
    var scoreThreshold : Float;
};

private typedef Prediction = {
	var handInViewConfidence : Float;
	var boundingBox : {
        topLeft: Array<Float>,
        bottomRight: Array<Float>
    };
	var landmarks : Array<Array<Float>>;
	var annotations : {
        thumb: Array<Array<Float>>
        //.-..
    };
}

private typedef HandPipeline = Dynamic; //TODO

private typedef Media = EitherType<ImageData,EitherType<ImageElement,EitherType<CanvasElement,VideoElement>>>;

/**
	MediaPipe Handpose.
	
	https://github.com/tensorflow/tfjs-models/tree/master/handpose
**/

@:native("handpose")
extern class Handpose {

    var pipeline : HandPipeline;

	static function load( ?config : ModelConfig ) : Promise<Handpose>;

	function estimateHands( media : Media ) : Promise<Array<Prediction>>;
}
