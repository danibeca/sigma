<?php


class ApiTester extends TestCase
{
    public function requestJson($method, $url, $params = [])
    {
        return json_decode($this->call($method, $url, $params)->getContent());
    }
}