<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;


class DaftarObat extends Model
{

    use HasFactory;

    protected $table = 'daftar_obat';

    protected $fillable = [
        'obat_id',
        'obat_nama',
        'kategori_id',
        'harga',
        'description',
    ];

    public function scopeGet_show_obat($query, $obat_id)
    {
        return $query->select(
            'obat_id',
            'obat_nama',
            'kategori_id',
            'harga',
            'description'

        )->where('obat_id', $obat_id)->first();
    }
}
