<?php

use Illuminate\Foundation\Testing\WithoutMiddleware;
use Illuminate\Foundation\Testing\DatabaseMigrations;
use Illuminate\Foundation\Testing\DatabaseTransactions;
use Symfony\Component\HttpFoundation\Response;

class LoginTest extends ApiTester
{
    /** @test */
    public function it_calls_authentication_without_credentials()
    {
        $data = $this->requestJson('POST', 'api/login');

        $this->assertEquals(Response::HTTP_UNAUTHORIZED, $data->error->status_code);
        $this->assertEquals('Invalid Credentials', $data->error->message);
        $this->assertResponseStatus(Response::HTTP_UNAUTHORIZED);
    }

    /** @test */
    public function it_calls_authentication_with_valid_credentials()
    {
        $data = $this->requestJson('POST', 'api/login', ['email' => 'lloploup@gmail.com', 'password' => 'danibeca']);

        $this->assertResponseOk();
        $this->assertEquals('1', $data->id);
        $this->assertNotNull($data->token);
    }

    /** @test */
    public function it_calls_authentication_with_invalid_credentials()
    {
        $data = $this->requestJson('POST', 'api/login', ['email' => 'invalidemail@gmail.com', 'password' => 'invalid']);
        $this->assertEquals(Response::HTTP_UNAUTHORIZED, $data->error->status_code);
        $this->assertResponseStatus(Response::HTTP_UNAUTHORIZED);
    }
}