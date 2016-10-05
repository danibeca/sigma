<?php

namespace Sigma\Utils\Transformers;

class UserTransformer extends Transformer
{
    public function transform($user)
    {
    	return [
            'id' => $user['id'],
            'email' => $user['email'],
            'name' => $user['name'],
            'created_at' => $user['created_at'],
            'updated_at' => $user['updated_at'],
            'confirmed' => (boolean) $user['confirmed']
        ];
    }
}