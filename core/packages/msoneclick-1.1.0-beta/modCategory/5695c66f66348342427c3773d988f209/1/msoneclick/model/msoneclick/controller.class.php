<?php

abstract class msoneclickDefaultController {
	/* @var modX $modx */
	public $modx;
	/* @var msOneClick $msoneclick */
	public $msoneclick;
	public $config;
	public $formid = '';

	public $count = 0;
	public $product_id = 0;
	public $hash = '';
	public $form_data = array();
	public $data = array();


	public function __construct(msOneClick $msoneclick, array $config = array()) {
		$this->modx = & $msoneclick->modx;
		$this->msoneclick = & $msoneclick;

		$this->setDefault($config);
		$topics = $this->getLanguageTopics();
		foreach ($topics as $topic) {
			$this->modx->lexicon->load($topic);
		}
	}


	public function setDefault($config = array()) {$this->config = $config;}

	public function initialize($ctx = 'web') {return true;}

	public function getLanguageTopics() {return array();}

	public function getDefaultAction() {return 'defaultAction';}

	public function defaultAction() {return 'Default action of default controller';}


	public function getValueOrderMinishop($arr = array()) {

		if(!empty($_SESSION['minishop2']['order'])) {
			foreach ($_SESSION['minishop2']['order'] as $field => $val) {
				if(!empty($val)) {
					$data[$field] = $val;
				}
			}
		}
		return true;
	}


	/**
	 * Поля пользователя для формы
	 *
	 * @param array $arr параметры для наполенения формы
	 *
	 * @return bool
	 */
	public function getValueUsers() {

		if(!$this->modx->user->isAuthenticated($this->config['ctx'])) return false;

		$Profile = $this->modx->user->getOne('Profile')->toArray();
		$this->form_data = array_merge($this->form_data, $Profile);
		$this->form_data['username'] = $this->modx->user->username;

		return true;
	}

	/**
	 * Значения товара
	 *
	 * @return array
	 */
	public function getValueProduct() {
		$data = array();

		/* @var msProduct $msProduct*/
		if($msProduct = $this->modx->getObject('msProduct', $this->product_id)){
			$data = array_merge($this->form_data, $msProduct->toArray());
		}

		$data['count'] = 1;
		$data['thumb'] = empty($data['thumb']) ? $this->config['default_images'] : $data['thumb'];

		$data = array_merge($data, $this->getValueProductOptions($data));

		return $this->form_data = array_merge($this->config, $data);
	}

	public function getValueProductOptions($data = array()) {

		$options = array();
		if (isset($_REQUEST['optionsform'])){

			foreach ($_REQUEST['optionsform'] as $item) {
				$name = $item['name'];
				$value = $item['value'];
				switch ($item['name']){
					case 'id':
						break;
					case 'count':
						$options[$name] = $value;
						break;
					default:

						$optionsq = explode('[',$name);
						if(count($optionsq) == 2){
							preg_match_all('/\[.*?]/',$name,$arr);
							$name_options = $arr[0][0];
							$name_options = substr($name_options,1);
							$name_options = substr($name_options,0,-1);
						} else {
							$name_options = $name;
						}

						$options['options_'.$name_options] = $value;

						break;
				}
			}
		}




		return empty($options) ? $data : array_merge($data,$options);
	}

	/**
	 * Хешь индификатора формы
	 *
	 * @param array $arr параметры для наполенения формы
	 *
	 * @return bool
	 */
	public function getHashForm() {
		$this->form_data['formid'] = 'msoneclickForm-'.$this->hash;
		return true;
	}

	/**
	 * Хешь индификатора формы
	 *
	 * @param array $arr параметры для наполенения формы
	 *
	 * @return bool
	 */
	public function getRequiredFields() {

		if (!empty($this->config['required_fields'])){
			foreach ($this->config['required_fields'] as $field) {
				$this->form_data[$field.'_required'] = $this->config['field_required_class'];
			}
		}

		return true;
	}


	/**
	 * Проверка данных для формы
	 *
	 * @return array
	 */
	public function validateData() {

		// Проверка обяательныйх плесхолдеров
		$config_em = explode(',', 'create_order,tplForm,delivery,payment,tplSendSuccessMS,tplSendSuccessMAIL,field_required_class');
		foreach ($config_em as $key) {
			if (empty($this->config[$key])){
				return $this->error('Не указан плесхолдер:'.$key);
			}
		}

		// check form
		$tplForm = $this->modx->getChunk($this->config['tplForm']);
		$count = $this->modx->getCount('msProduct', $this->product_id);
		if (empty($tplForm)){
			return $this->error('msoc_err_form_chunk');
		} else if(empty($this->product_id)){
			return $this->error('Укажите ID товара');
		}  else if(!is_numeric($this->product_id)){
			return $this->error('ID товара не валиден: '.$this->product_id);
		} else if(empty($count)){
			return $this->error('msoc_err_get_msProduct');
		}
		return $this->success();
	}

	/**
	 * Заносим данные в форму
	 *
	 * @return array
	 */
	public function getForm() {

		// Проверка наличия класса miniShop2 метода MS
		if ($this->config['create_order'] == 'MS') {
			/* @var miniShop2 $miniShop2 */
			$miniShop2 = $this->modx->getService('minishop2');
			if (!($miniShop2 instanceof miniShop2)) {
				return $this->error('msoc_err_could_not_miniShop2');
			}
		}

		$this->modx->lexicon->load('minishop2:default');
		$this->modx->lexicon->load('minishop2:product');


		if (empty($_SESSION['msOneClickConfig'][$this->hash])){
			return $this->error('Не удалось получить конфиг формы');
		}

		/* @var pdoFetch $pdoFetch */
		if (!$this->modx->loadClass('pdofetch', MODX_CORE_PATH . 'components/pdotools/model/pdotools/', false, true)) {return false;}
		$pdoFetch = new pdoFetch($this->modx);

		$out = $pdoFetch->getChunk($this->config['tplForm'], $this->form_data, true);

		return $this->success(
			$this->modx->lexicon('msoc_form_success'),
			array('form' => $out, 'formid' => $this->form_data['formid'])
		);

	}


	/**
	 * Проверка обяательных полей
	 *
	 * @return array
	 */
	public function getErros() {

		$errors = array();
		if (!empty($this->config['required_fields'])) {
			foreach ($this->config['required_fields'] as $field) {
				$response = $this->check_field($field, $this->data[$field]);
				if(!$response['success']){
					$errors[$field] = $response['message'];
				}
			}
		}

		if(!empty($errors)) {
			$out_errors = array();
			foreach ($errors as $field => $message) {
				$out_errors[] = array(
					'name' => $field,
					'message' => $message
				);
			}

			return $this->error(
				$this->modx->lexicon('msoc_errors'),
				array('errors' => $out_errors)
			);
		}

		return $this->success();
	}



	/**
	 * Добавление полей пользователя в заказ
	 *
	 * @param array $data поле
	 *
	 * @return array
	 */
	public function add($data) {
		$field = $data['field'];
		$value = $data['value'];

		$out_errors = array();
		$response = $this->check_field($field, $value);
		$this->config['json_response'] = 1;
		if(!$response['success']){
			$out_errors[] = array(
				'name' => $field,
				'message' => $response['message']
			);

			return $this->error(
				$this->modx->lexicon('msoc_errors'),
				array('errors' => $out_errors, 'field' => $field)
			);
		}

		if(!empty($value)) {
			$_SESSION['minishop2']['order'][$field] = $value;
		}

		return $this->success('',array('errors' => array(), 'field' => $field));
	}

	public function setProduct() {
		$this->product_id = (int)$this->form_data['product_id'];
	}

	/**
	 * Проверка валидации поля
	 *
	 * @param string $field поле
	 * @param string $value значение
	 *
	 * @return array
	 */
	public function check_field($field, $value) {
		$response = $this->check_validate($field, $value);
		if(!$response['success']){
			return $this->error($response['message']);
		}
		return $this->success();
	}



	/**
	 * Проверка валидации полей
	 *
	 * @param string $field поле
	 * @param string $value значение
	 *
	 * @return array
	 */
	public function check_validate($field, $value) {

		switch ($field){
			case 'receiver':

				$first = (int)substr($value, 0, 1);
				if(empty($value)){
					return $this->error($this->modx->lexicon('msoc_err_name'));
				} else if(strlen($value) < 2){
					return $this->error($this->modx->lexicon('msoc_err_name_strlen'));
				} else if(!empty($first)){
					return $this->error($this->modx->lexicon('msoc_err_name_numeric'));
				}

				break;
			case 'email':
				if(empty($value)){
					return $this->error($this->modx->lexicon('msoc_err_email'));
				} else if(!filter_var($value, FILTER_VALIDATE_EMAIL)) {
					return $this->error($this->modx->lexicon('msoc_err_email_invalid'));
				}

				break;
			case 'phone':

				$value = preg_replace("/[^0-9]/", '', $value);

				if(empty($value)){
					return $this->error($this->modx->lexicon('msoc_err_phone'));
				} else if(strlen($value) != 11){
					return $this->error($this->modx->lexicon('msoc_err_phone_valide'));
				}

				break;
			default:

				if(empty($value)){
					return $this->error($this->modx->lexicon('msoc_err_all_field'));
				}

				break;
		}
		return $this->success();
	}

	/**
	 * Содание заказ или отправка на email
	 *
	 * @return array
	 */
	public function prepareOrder() {
		$this->count 	  			= (integer)$this->data['count'];
		$this->product_id 			= (int)$this->data['product_id'];
		$this->data['payment'] 		= $this->config['payment'];
		$this->data['delivery'] 	= $this->config['delivery'];
		$this->data['fast_order'] 	= 1;

		if (empty($this->data)) 			return $this->error('msoc_err_count');
		if ($this->count <= 0) 				return $this->error('msoc_err_count');
		if (empty($this->product_id)) 		return $this->error('msoc_err_product_id');
		if (empty($this->data['payment'])) 	return $this->error('msoc_err_not_payments');
		if (empty($this->data['delivery'])) return $this->error('msoc_err_not_deliverys');

		// Проверяем деактивированость метода оплаты
		if (!$payment = $this->modx->getObject('msPayment', array('id' => $this->data['payment'], 'active' => 0))){
			return $this->error('msoc_err_get_msPayment_active');
		}

		return $this->success();
	}


	/**
	 * Содание заказ в минишоп
	 *
	 * @param int $product_id id товара
	 * @param integer $count количество товаров
	 * @param array $data дополнительные данные для заказа
	 *
	 * @return array
	 */
	public function createOrderMAIL($product_id = 0, $count = 0, $data = array()) {

		$data = array_merge($data,$this->getValueProduct());

		unset($data['content']);

		$subject 	= $this->modx->getChunk($data['tplMAILmessage'], array_merge(array('subject' => 1,'body' => 0), $data), true);
		$body 		= $this->modx->getChunk($data['tplMAILmessage'], array_merge(array('subject' => 0,'body' => 1),$data), true);

		if (!empty($data['email_method_mail'])) {
			$email = trim($data['email_method_mail']);
			$this->msoneclick->sendEmail($email, $subject, $body);
		} else {

			$emailsender = $this->modx->getOption('emailsender');
			$ms2_email_manager = $this->modx->getOption('ms2_email_manager', null, $this->modx->getOption('emailsender'));
			if (!empty($ms2_email_manager)){
				$email = $ms2_email_manager;
			} else if (!empty($emailsender)){
				$email = $emailsender;
			} else  {
				return $this->error('msoc_err_ms2_email_manager');
			}

			$emails = array_map('trim', explode(',', $email));
			if (!empty($subject)) {
				foreach ($emails as $email) {
					if (preg_match('/^[^@а-яА-Я]+@[^@а-яА-Я]+(?<!\.)\.[^\.а-яА-Я]{2,}$/m', $email)) {
						$this->msoneclick->sendEmail($email, $subject, $body);
					}
				}
			}
		}

		return $this->success($this->modx->lexicon('msoc_success_order_send'));
	}


	/**
	 * Содание заказ в минишоп
	 *
	 * @param int $product_id id товара
	 * @param integer $count количество товаров
	 * @param array $data дополнительные данные для заказа
	 *
	 * @return array
	 */
	public function createOrderMS($product_id = 0, $count = 0, $data = array()) {

		$options = isset($data['options']) ? $data['options'] : array();



		/* @var miniShop2 $miniShop2 */
		$miniShop2 = $this->modx->getService('minishop2');
		$miniShop2->initialize($this->config['ctx']);
		if (!($miniShop2 instanceof miniShop2)) {
			return $this->error('Could not initialize miniShop2');
		}

		// Сохраняем состояние корины и отчищаем её
		$old_cart = $miniShop2->cart->get();
		$old_order = $miniShop2->order->get();
		$miniShop2->cart->clean();
		$miniShop2->order->clean();


		// add product cart
		$response = $miniShop2->cart->add($product_id, $count, $options);
		if(!is_array($response)){
			$response  = $this->modx->fromJSON($response);
		}
		if (!$response['success']) {
			return $this->modx->fromJSON($response);
		}


		// set order value
		$miniShop2->order->set($data);

		// send order miniShop2
		$miniShop2->config['json_response'] = 1;
		$response = $miniShop2->order->submit($data);
		if(!is_array($response)){
			$response  = $this->modx->fromJSON($response);
		}
		if(!$response['success']){
			return $response;
		}

		if (!empty($response['data']['msorder'])){
			$this->error('Не удалось получить ID msorder');
		}

		$id = $response['data']['msorder'];

		// return data order miniShop2
		if(!$msOrder = $this->modx->getObject('msOrder', $id)){
			return $this->error('Не удалось получить созданому данные по заказу');
		}

		// Возвращает товары в корзину по заказу
		if (!empty($old_cart)) {
			$miniShop2->cart->set($old_cart);
		}
		if (!empty($old_order)) {
			$miniShop2->order->set($old_order);
		}

		$data = $msOrder->toArray();
		return $this->success($this->modx->lexicon('msoc_success_order_send'), $data);

	}

	/* This method returns an error response
	 *
	 * @param string $message A lexicon key for error message
	 * @param array $data Additional data, for example cart status
	 * @param array $placeholders Array with placeholders for lexicon entry
	 *
	 * @return array|string $response
	 * */
	public function error($message = '', $data = array(), $placeholders = array()) {
		$response = array(
			'success' => false
		,'message' => $this->modx->lexicon($message, $placeholders)
		,'data' => $data
		);

		return $this->config['json_response'] ? $this->modx->toJSON($response) : $response;
	}


	/* This method returns an success response
	 *
	 * @param string $message A lexicon key for success message
	 * @param array $data Additional data, for example cart status
	 * @param array $placeholders Array with placeholders for lexicon entry
	 *
	 * @return array|string $response
	 * */
	public function success($message = '', $data = array(), $placeholders = array()) {
		$response = array(
			'success' => true
		,'message' => $this->modx->lexicon($message, $placeholders)
		,'data' => $data
		);

		return $this->config['json_response'] ? $this->modx->toJSON($response) : $response;
	}

}