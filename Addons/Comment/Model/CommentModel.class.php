<?php
/**
 * Onethink 评论插件，功能演示版本
 * @copyright
 * @author      Wolix Li <wolixli@gmail.com>
 * @link
 * 各位叔叔大爷、婶婶大娘、哥哥姐姐、弟弟妹妹们行行好，如果哪位走在网路上可怜我四十几岁的小乞丐，可顺便给我打点零花钱，
 * 半年在家呆着没挣着钱，快过年了，没钱给小孩子们包红包、没钱给老人们孝敬槽子糕，也没钱给我那可怜的老婆买新衣服。
 * 一块两块不嫌少，10万八万的不嫌多，美元、日元都可以，最欢迎人民币，我的支付宝账号和 paypal的账号都是： wolix@139.com
 * 专业组团定制互联网php产品，联系QQ: 4118814
 * 现在做雷锋也留名，请不要再叫我雷锋了，叫我“老李”就行了！
 * 2014/1/14
 **/
namespace Addons\Comment\Model;
use Think\Model;

/**
 * 评论模型
 */
class CommentModel extends Model{

	protected $_validate = array(
		array('comment','require','评论内容不能为空！'), //默认情况下用正则进行验证
	);

	/**
	 * 评论模型自动完成
	 * @var array
	 */
	protected $_auto = array(
		array('uid', 'session', self::MODEL_INSERT, 'function', 'user_auth.uid'),
		array('create_time', NOW_TIME, self::MODEL_INSERT),
        array('com_ip', 'get_client_ip', self::MODEL_INSERT, 'function', 1),
		array('status', 1, self::MODEL_BOTH),
		array('digg', 0, self::MODEL_INSERT),
		array('model_id','require','不知道是哪个类型的内容!'),
		array('comment','require','没有评论内容，就别发表了!'),
		array('comment', 'htmlspecialchars', self::MODEL_BOTH, 'function'),
		array('cid','require','不知道是哪个内容的评论!'),
	);

	protected function _after_find(&$result,$options) {
		$result['create_time_text'] = date('Y-m-d H:i:s', $result['create_time']);
		$result['ip'] = long2ip($result['com_ip']);


	}

	protected function _after_select(&$result,$options){
		foreach($result as &$record){
			$this->_after_find($record,$options);
		}
	}

	public function diggit($id){
		return $this->where('id='.$id)->setInc('digg');
	}
}
