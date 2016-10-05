<?php

namespace Sigma\Http\Controllers;

use Illuminate\Http\Request;
use Sigma\Http\Requests;
use Sigma\Models\Security\User;
use Sigma\Utils\Transformers\UserTransformer;


class UsersController extends ApiController {

    protected $userTransformer;

    public function __construct(UserTransformer $userTransformer)
    {
        $this->userTransformer = $userTransformer;
        //$this->middleware('jwt.auth', ['except' => ['index']]);
        $this->middleware('jwt.auth');
    }

    public function store(Request $request)
    {

    }

    public function index()
    {
        $users = User::all();

        return $this->respond([
            'data' => $this->userTransformer->transformCollection($users->all())
        ]);

    }

    public function show($id)
    {
        $user = User::findOrFail($id);

        return $this->respond([
            'data' => $this->userTransformer->transform($user)
        ]);

    }

    public function update(Request $request, $id)
    {
        //
    }

    public function destroy($id)
    {
        //
    }


}
