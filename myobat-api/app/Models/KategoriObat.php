<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class KategoriObat extends Model
{
    protected $table = 'kategori_obat';

    protected $fillable = [
        'kategori_id',
        'kategori_nama',
        'description',
    ];
}
