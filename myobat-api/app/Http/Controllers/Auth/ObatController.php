<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\DaftarObat;
use App\Models\KategoriObat;
use App\Models\Preference;


class ObatController extends Controller
{
    public function search_obat(Request $request)
    {
        $nama_obat = $request->input('nama_obat');
        $data = DaftarObat::where('obat_nama', $nama_obat)->first();
        $kategori = KategoriObat::where('kategori_id', $data->kategori_id)->first();

        // return response()->json(['data' => $data], 200);
        return response()->json([
            'data' => [
                'obat_nama' => $data->obat_nama,
                'kategori_nama' => $kategori->kategori_nama, // Accessing kategori_nama through the relationship
                'harga' => $data->harga,
                'description' => $data->description,
            ]
        ], 200);
    }

    public function search_kategori(Request $request)
    {
        $nama_kategori = $request->input('nama_kategori');
        $data = KategoriObat::where('kategori_nama', $nama_kategori)->first();
        // $kategori = KategoriObat::where('kategori_id', $data->kategori_id)->first();

        return response()->json(['data' => $data], 200);
        // return response()->json([
        //     'data' => [
        //         'obat_nama' => $data->obat_nama,
        //         'kategori_nama' => $kategori->kategori_nama, // Accessing kategori_nama through the relationship
        //         'harga' => $data->harga,
        //         'description' => $data->description,
        //     ]
        // ], 200);
    }

    public function show_kategori()
    {
        $query = KategoriObat::query();
        $data = $query->get(); 
        
        return response()->json([
            'status' => 1,
            'message' => ['success'],
            'data' => $data
        ]);
    }

    public function show_obat()
    {

        $query = DaftarObat::query();
        $data = $query->get(); 
        
        return response()->json([
            'status' => 1,
            'message' => ['success'],
            'data' => $data
        ]);
    }

    public function get_kategori_obat(Request $request)
    {
        $nama_kategori = $request->input('nama_kategori');
        $get_kategori = KategoriObat::where('kategori_nama', $nama_kategori)->pluck('kategori_id');

        if ($get_kategori->isEmpty()) {
            return response()->json(['Kategori does not exist'], 404);
        }

        $data_obat = DaftarObat::where('kategori_id', $get_kategori)->get();

        if ($data_obat->isEmpty()) {
            return response()->json(['No obat with that kategori'], 404);
        }

        return response()->json(['data' => $data_obat], 200);
    }

    public function view_preferences(Request $request)
    {
        $user_id = $request->id;
        $user = User::where('id', $user_id)->first();

        if (!$user) {
            return response()->json(['User does not exist'], 404);
        }

        $preferences = Preference::where('user_id', $user->id)->get();
        if ($preferences->isEmpty()) {
            return response()->json(['This User does not have any preference'], 404);
        }

        return response()->json(['data' => $preferences], 200);
    }

    public function add_preferences(Request $request)
    {
        $user_id = $request->id;
        $user = User::where('id', $user_id)->first();

        if (!$user) {
            return response()->json(['User does not exist'], 404);
        }

        $obat_nama = $request->input('nama_obat');
        $obat = DaftarObat::where('obat_nama', $obat_nama)->first();

        if (!$obat) {
            return response()->json(['Obat does not exist'], 404);
        }

        $check_preference = Preference::where('user_id', $user_id)
            ->where('obat_id', $obat->obat_id)
            ->first();

        if ($check_preference) {
            return response()->json(['Preference already exist'], 409);
        }

        $add_preference = Preference::create([
            'user_id' => $user->id,
            'obat_id' => $obat->obat_id,
        ]);

        return response()->json(['message' => 'Preference added successfully', 'data' => $add_preference], 200);
    }


    public function del_preferences(Request $request)
    {

        $user_id = $request->id;
        $preference_id = $request->preference_id;

        $user = User::find($user_id);

        if (!$user) {
            return response()->json(['User does not exist'], 404);
        }

        $preference = Preference::where('preference_id', $preference_id)
            ->where('user_id', $user_id)
            ->first();

        if (!$preference) {
            return response()->json(['Preference does not exist for this user'], 404);
        }

        Preference::where('preference_id', $preference_id)->delete();
        return response()->json(['Preference deleted successfully'], 200);
    }
}
