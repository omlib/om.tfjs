package om.tfjs;

import js.lib.Promise;

private typedef ModelConfig = {
	var ?modelUrl:String;
}

typedef Result = {
	var text:String;
	var score:Float;
	var startIndex:Int;
	var endIndex:Int;
}

/**
	Question and Answer.

	https://github.com/tensorflow/tfjs-models/tree/master/qna
**/
@:native("qna")
extern class QnA {
	static function load(?modelConfig:ModelConfig):Promise<QnA>;

	var model:Dynamic;
	var modelConfig:Dynamic;
	var tokenizer:Dynamic;

	/**
	 * [Description]
	 * @param question The question string
	 * @param passage The content to extract answers from
	 * @return Promise<Array<Result>>
	 */
	function findAnswers(question:String, passage:String):Promise<Array<Result>>;
}
