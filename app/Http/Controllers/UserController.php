<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;


class UserController extends Controller
{
     // List all users
     public function index()
     {
         $users = User::all();
         return response()->json($users);
     }
 
     // Show a single user
     public function show($identifier)
     {
         // Try to find the user by ID or email
         $user = User::where('id', $identifier)
                     ->orWhere('email', $identifier)
                     ->first();
     
         if (!$user) {
             return response()->json(['message' => 'User not found'], 404);
         }
     
         return response()->json($user);
     }     
 
     // Create a new user
     public function store(Request $request)
     {
        $request->validate([
            'name' => 'required|max:255',
            'email' => 'required|email|unique:users',
            'password' => 'required|confirmed|min:8'
        ]);
 
 
         $user = User::create([
             'name' => $request->name,
             'email' => $request->email,
             'password' => Hash::make($request->password),
         ]);
 
         return response()->json([
            'message' => 'User created successfully',
            'user' => [
                'id' => $user->id,
                'name' => $user->name,
                'email' => $user->email,
            ]
        ], 201);
     }
 
     // Update an existing user
     public function update(Request $request, $id)
     {
         $user = User::find($id);
 
         if (!$user) {
             return response()->json(['message' => 'User not found'], 404);
         }
 
         $request->validate([
            'name' => 'sometimes|max:255',
            'email' => 'sometimes|email|unique:users,email,' . $id,
            'password' => 'sometimes|confirmed|min:8'
        ]);
 
         $user->update([
             'name' => $request->name ?? $user->name,
             'email' => $request->email ?? $user->email,
             'password' => $request->password ? Hash::make($request->password) : $user->password,
         ]);
 
         return response()->json(['message' => 'User updated successfully', 'user' => $user]);
     }
 
     // Delete a user
     public function destroy($id)
     {
         $user = User::find($id);
 
         if (!$user) {
             return response()->json(['message' => 'User not found'], 404);
         }
 
         $user->delete();
 
         return response()->json(['message' => 'User deleted successfully']);
     }
}
