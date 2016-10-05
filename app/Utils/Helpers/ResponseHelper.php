<?php

namespace Sigma\Utils\Helpers;

use Illuminate\Http\Response as IlluResponse;
use Illuminate\Support\Facades\Response;
trait ResponseHelper {

    protected $statusCode = IlluResponse::HTTP_OK;

    public function getStatusCode()
    {
        return $this->statusCode;
    }

    public function setStatusCode($statusCode)
    {
        $this->statusCode = $statusCode;

        return $this;
    }

    public function respondNotFound($message = 'Not Found')
    {
        return $this->setStatusCode(IlluResponse::HTTP_NOT_FOUND)->respondWithError($message);
    }

    public function respondInternalErorr($message = 'Internal Error')
    {
        return $this->setStatusCode(IlluResponse::HTTP_INTERNAL_SERVER_ERROR)->respondWithError($message);
    }

    public function respondMethodNotAllowed($message = 'Method Not Allowed')
    {
        return $this->setStatusCode(IlluResponse::HTTP_METHOD_NOT_ALLOWED)->respondWithError($message);
    }


    public function respond($data, $headers = [])
    {
        return Response::json($data, $this->getStatusCode(), $headers);
    }

    public function respondWithError($message)
    {
        return $this->respond([
            'error' => [
                'message' => $message,
                'status_code' => $this->getStatusCode()
            ]
        ]);
    }
}