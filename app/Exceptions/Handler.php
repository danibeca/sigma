<?php

namespace Sigma\Exceptions;

use Exception;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Illuminate\Http\Response as IlluResponse;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Sigma\Utils\Helpers\ResponseHelper;
use Symfony\Component\HttpKernel\Exception\MethodNotAllowedHttpException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Tymon\JWTAuth\Exceptions\JWTException;
use Tymon\JWTAuth\Exceptions\TokenExpiredException;
use Tymon\JWTAuth\Exceptions\TokenInvalidException;

class Handler extends ExceptionHandler {

    use ResponseHelper;

    protected $dontReport = [
        HttpException::class,
    ];

    public function report(Exception $e)
    {
        return parent::report($e);
    }

    public function render($request, Exception $e)
    {
        if ($e instanceof ModelNotFoundException)
        {
            return $this->respondNotFound('Resource not found');
        }

        if ($e instanceof TokenExpiredException)
        {
            return $this->setStatusCode(IlluResponse::HTTP_UNAUTHORIZED)->respondWithError("Token has expired");
        }

        if ($e instanceof TokenInvalidException)
        {
            return $this->setStatusCode(IlluResponse::HTTP_BAD_REQUEST)->respondWithError("Token has not been provided");
        }

        if ($e instanceof JWTException)
        {
            return $this->respondInternalErorr("Error creating token");
        }

        if ($e instanceof MethodNotAllowedHttpException)
        {
            return $this->respondMethodNotAllowed();
        }

        if ($e instanceof NotFoundHttpException)
        {
            return $this->respondNotFound();
        }

        return parent::render($request, $e);
    }
}