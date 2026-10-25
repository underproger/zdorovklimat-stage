<?php

class msOneClickFormController extends msoneclickDefaultController {


	/**
	 * Default config
	 *
	 * @param array $config
	 */
	public function setDefault($config = array()) {

		$this->config = array_merge(array(
			'delivery' 			=> $this->modx->getOption('msoneclick_deliverys'),
			'payment' 			=> $this->modx->getOption('msoneclick_payments'),
			'tplForm' 			=> 'tpl.msOneClick.form',
			'default_images' 	=> '/assets/components/minishop2/img/web/ms2_small.png',
			'tplSendSuccessMS' 		=> 'tpl.msOneClick.MS.send',
			'tplSendSuccessMAIL' 	=> 'tpl.msoneclick.MAIL.body.send',
			'field_required_class' 	=> 'msoc_field__required',
			'siteUrl' 			=> $this->modx->getOption('site_url'),
			'create_order' 		=> 'MS',
			'required_fields' 		=> explode(',', $this->modx->getOption('msoneclick_required_fields', array(). '')),
		), $config);

		$this->hash = $_REQUEST['hash'];
		if (isset($_SESSION['msOneClickConfig'][$this->hash])) {
			$this->config = array_merge($this->config, $_SESSION['msOneClickConfig'][$this->hash]);
		}

	}

	/**
	 * Returns array with language topics
	 *
	 * @return array
	 */
	public function getLanguageTopics() {
		return array('msoneclick:form');
	}

	/**
	 * Returns order field form
	 *
	 * @return bool
	 */
	public function defaultAction() {}



	/**
	 * Получения формы для оформления заказа
	 *
	 * @param array $arr параметры для наполенения формы
	 *
	 * @return array
	 */
	public function get($arr = array()) {
		$this->form_data = $arr;
		$this->setProduct();

		if (!isset($_SESSION['msOneClickConfig'][$this->hash])){
			return $this->error('Не удалось получить конфиг формы');
		}

		$response = $this->validateData();
		if (!$response['success']) {
			return $response;
		}

		$this->getValueUsers();
		$this->getValueOrderMinishop();
		$this->getValueProduct();
		$this->getHashForm();
		$this->getRequiredFields();

		return $this->getForm();
	}


	/**
	 * Отправка формы
	 *
	 * @param array $data данные для отправки заказа
	 *
	 * @return array
	 */
	public function sendForm($data = array()) {
		$this->data = $data;

		// Проверка формы
		$response = $this->getErros();
		if(!$response['success']){
			return $response;
		}

		// Подготовка данных
		$response = $this->prepareOrder();
		if (!$response['success']){
			return $response;
		}

		// Создание заказа
		$response = $this->createOrder();
		if(!$response['success']){
			return $this->error($response['message']);
		}

		$tplSendSuccess = $this->config['tplSendSuccess'.$this->config['create_order']];
		$out = $this->modx->getChunk($tplSendSuccess, $response['data']);
		return $this->success($this->modx->lexicon('msoc_success_order_send'), array('body' => $out));
	}


	/**
	 * Содание заказ или отправка на email
	 *
	 * @return array
	 */
	public function createOrder() {

		switch ($this->config['create_order']) {
			case 'MAIL':
				$response = $this->createOrderMAIL($this->product_id, $this->count, $this->data);
				break;
			case 'MS':
				$response = $this->createOrderMS($this->product_id, $this->count, $this->data);
				break;
			default:
				$response = $this->error('msoc_err_not_deliverys');
				break;
		}
		return $response;
	}
}

return 'msOneClickFormController';