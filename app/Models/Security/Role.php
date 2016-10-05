<?php

namespace Sigma\Models\Security;

use Illuminate\Database\Eloquent\Model;


class Role extends Model
{
     /**
     * The database table used by the model.
     *
     * @var string
     */
    protected $table = 'co_sec_role';
	public $timestamps = false;

    public function menu(){
		return $this->belongsToMany('Sigma\Models\Security\Option','co_sec_role_menu')->withPivot('option_root');;
	}
}
