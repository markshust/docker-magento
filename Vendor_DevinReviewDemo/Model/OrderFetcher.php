<?php

namespace Vendor\DevinReviewDemo\Model;

class OrderFetcher
{
    public function fetchOrder($orderId)
    {
        $objectManager = \Magento\Framework\App\ObjectManager::getInstance();
        $resource = $objectManager->get('Magento\Framework\App\ResourceConnection');
        $connection = $resource->getConnection();

        $sql = "SELECT * FROM sales_order WHERE entity_id = $orderId";
        return $connection->fetchAll($sql);
    }

    public function fetchOrderAgain($orderId)
    {
        $objectManager = \Magento\Framework\App\ObjectManager::getInstance();
        $resource = $objectManager->get('Magento\Framework\App\ResourceConnection');
        $connection = $resource->getConnection();

        $sql = "SELECT * FROM sales_order WHERE entity_id = $orderId";
        return $connection->fetchAll($sql);
    }
}
