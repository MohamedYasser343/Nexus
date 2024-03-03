<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Cookie;
use Illuminate\Support\Facades\Hash;
use Symfony\Component\HttpFoundation\Response;
use Validator;

class UserController extends Controller
{
    public function register(Request $request) {
        return $user = User::create([
            'first_name' => $request->input('first_name'),
            'last_name' => $request->input('last_name'),
            'username' => $request->input('username'),
            'email' => $request->input('email'),
            'phone' => $request->input('phone'),
            'password' => Hash::make($request->input('password')),
        ]);
    }

    public function login(Request $request) {
        if (!Auth::attempt($request->only('email', 'password'))) {
            return response([
                'message' => 'Invalid credentials'
            ], Response::HTTP_UNAUTHORIZED);
        }
        
        $user = Auth::user();
        $token = $user->createToken('token')->plainTextToken;
        $cookie = cookie('jwt', $token, 60*24); // 1 day

        return response([
            'message' => $token,
        ])->withCookie($cookie);
    }

    public function userProfile() {
        return Auth::user();
    }

    public function updateProfile(Request $request) {
        try {
            $validator = Validator::make($request->all(), [
                'username' => 'required',
                'email' => 'required|email|unique:users,id',
                'pofile_picture' => 'nullable|image|mimes:jpeg,png,jpg,gif,svg',
            ]);
            if ($validator->fails()) {
                $error = $validator->errors()->all()[0];
                return response()->json(['status'=>'false', 'message'=>$error, 'data'=>[]], 422);
            } else {
                $user = User::find($request->user()->id);
                $user->username = $request->username;
                $user->email = $request->email;
                if($request->profile_picture && $request->profile_picture->isValid()) {
                    $file_name = time().'.'.$request->profile_picture->extension();
                    $request->profile_picture->move(public_path('images'), $file_name);
                    $path = "public/images/$file_name";
                    $user->profile_picture = $path;
                }
                $user->update();
                return response()->json(['status'=>'true', 'message'=>'Profile updated successfully', 'data'=>$user]);
            }
        } catch (\Exception $e) {
            return response()->json(['status'=>'false', 'message'=>$e->getMessage(), 'data'=>[]], 500);
        }
    }

    public function logout() {
        $cookie = Cookie::forget('jwt');
        return response([
            'message' => 'success'
        ])->withCookie($cookie);
    }
}
