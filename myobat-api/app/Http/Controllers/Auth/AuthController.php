<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Models\User;
use Illuminate\Validation\ValidationException;

class AuthController extends Controller
{
    // public function token(Request $request)
    // {
    //     $request->validate([
    //         'email' => 'required|email',
    //         'password' => 'required',
    //         'device_name' => 'required',
    //     ]);

    //     $user = User::where('email', $request->email)->first();

    //     if (!$user || !Hash::check($request->password, $user->password)) {
    //         throw ValidationException::withMessages([
    //             'email' => ['The provided credentials are incorrect'],
    //         ]);
    //     }

    //     return $user->createToken($request->device_name)->plainTextToken;
    // }

    public function token(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
            'device_name' => 'required',
        ]);

        $user = User::where('email', $request->email)->first();

        if (!$user || !Hash::check($request->password, $user->password)) {
            return response()->json([
                'status' => 0,
                'message' => 'Invalid login credentials'
            ]);
        }

        // return $user->createToken($request->device_name)->plainTextToken;

        $token = $user->createToken($request->device_name)->plainTextToken;

        return response()->json([
            'status' => 1,
            'token' => $token,
            'message' => 'Login successful'
        ]);
    }

    public function register(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required',
            'device_name' => 'required',
        ]);

        $data = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => bcrypt($request->password),
            'email_verified_at' => now(),
        ]);

        return response()->json([
            'status' => 1,
            'message' => ['success'],
            'data' => $data,
        ]);
    }

    public function user(Request $request)
    {
        $user_id = $request->user()->email;
        $data = User::get_user_id($user_id);

        return response()->json([
            'status' => 1,
            'message' => ['success'],
            'data' => $data,
        ]);
    }


    public function delete(Request $request)
    {
        $user = $request->user();

        // Delete the current access token
        $user->currentAccessToken()->delete();

        return response()->json(['message' => 'Token deleted'], 200);
    }

    public function data_user(Request $request)
    {
        $query = User::query();
        $page = $request->input('page', 1);
        $perPage = 10;
        $data = $query->offset(($page - 1) * $perPage)->limit($perPage)->get();

        return response()->json([
            'status' => 1,
            'message' => ['success'],
            'data' => $data
        ]);
    }
}
