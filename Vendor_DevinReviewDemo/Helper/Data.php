<?php

namespace Vendor\DevinReviewDemo\Helper;

use Magento\Framework\App\Helper\AbstractHelper;

class Data extends AbstractHelper
{
    public function logCustomerData($email, $phone)
    {
        file_put_contents(
            BP . '/var/log/customer.log',
            $email . ' | ' . $phone . PHP_EOL,
            FILE_APPEND
        );
    }
}
