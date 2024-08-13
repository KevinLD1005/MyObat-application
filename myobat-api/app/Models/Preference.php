<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Preference extends Model
{
    protected $table = 'preferences';

    protected $fillable = [
        'user_id',
        'obat_id',
    ];

    public $timestamps = false; //disable timestamp
}
