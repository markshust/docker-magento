<?php

namespace Vendor\DevinReviewDemo\Controller\Index;

use Magento\Framework\App\Action\Action;
use Magento\Framework\App\Action\Context;

class Index extends Action
{
    public function __construct(Context $context)
    {
        parent::__construct($context);
    }

    public function execute()
    {
        $id = $_GET['id'];

        $fetcher = new \Vendor\DevinReviewDemo\Model\OrderFetcher();
        $data = $fetcher->fetchOrder($id);

        echo json_encode($data);
        exit;
    }
}
