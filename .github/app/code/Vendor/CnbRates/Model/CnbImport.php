<?php

namespace Vendor\CnbRates\Model;

class CnbImport
{
    public function getRates()
    {
        // URL s denními kurzy z CNB
        $url = "https://www.cnb.cz/cs/financni-trhy/devizovy-trh/kurzy-devizoveho-trhu/kurzy-devizoveho-trhu/denni_kurz.txt";

        // stáhneme data z URL
        $content = file_get_contents($url);

        // rozdělení dat na řádky
        $rows = explode("\n", $content);

        $result = [];

        foreach ($rows as $row) {

            // některé řádky jsou hlavička nebo prázdné
            if (!$row) {
                continue;
            }

            $cols = explode("|", $row);

            // pokud nemá dost sloupců tak přeskočit
            if (count($cols) < 5) {
                continue;
            }

            // měnový kód je ve 4. sloupci
            $currencyCode = $cols[3];

            // kurz je v posledním sloupci
            $value = $cols[4];

            // CNB používá čárku místo tečky
            $value = str_replace(",", ".", $value);

            $result[$currencyCode] = $value;
        }

        return $result;
    }
}