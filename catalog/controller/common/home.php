<?php  
class ControllerCommonHome extends Controller {
	public function index() {
		$this->load->model('catalog/category');
		$this->load->model('catalog/product');
		$this->load->model('tool/image');

		$this->document->setTitle($this->config->get('config_title'));
		$this->document->setDescription($this->config->get('config_meta_description'));

		$this->data['heading_title'] = $this->config->get('config_title');
		
		$this->data['categories'] = $this->model_catalog_category->getCategories();

		// 
		$this->data['products'] = array();
		foreach($this->data['categories'] as $category) {
			$results = $this->model_catalog_product->getProducts(array('filter_category_id' => $category['category_id']));

			$products = array();
			
			if (count($results) >= 1 ) {
				foreach($results as $result) {

					$image = $this->model_tool_image->resize($result['image'], $this->config->get('config_image_related_width'), $this->config->get('config_image_related_height'));

					$products[$result['product_id']] = 
					array('product_id' => $result['product_id'],
						  'name' => $result['name'],
						  'image' => $image
					);	
				}

				$this->data['products'][$category['category_id']] = $products; 

			}

			
				

			
		}




		if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];	
			} else {
				$url = '';
			}

		$this->data['url'] = $url;	

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/home.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/home.tpl';
		} else {
			$this->template = 'default/template/common/home.tpl';
		}
		
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'
		);
										
		$this->response->setOutput($this->render());
	}
}
?>