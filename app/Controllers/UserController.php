<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\UserModel;
class UserController extends BaseController
{
    private $user;

    public function __construct(){
        $this->user = new UserModel();

        helper(['form']);
    }
    public function register()
    {
        $rules = [

            'LastName' => 'required|min_length[2]',
            'FirstName' => 'required|min_length[2]',
            'gender' => 'required|min_length[2]',
            'email' => 'required|min_length[4]|valid_email|is_unique[user.email]',
            'ContactNo' => 'required|numeric',
            'UserRole' => 'required',
            'Password' => 'required|min_length[7]',
            'birthdate' => 'required|valid_date'
        ];

        if($this->validate($rules)){
            $data = [
                'LastName' => $this->request->getVar('LastName'),
                'FirstName' => $this->request->getVar('FirstName'),
                'gender' => $this->request->getVar('gender'),
                'email' => $this->request->getVar('email'),
                'ContactNo' => $this->request->getVar('ContactNo'),
                'UserRole' => $this->request->getVar('UserRole'),
                'Username' => $this->request->getVar('Username'),
                'Password' => password_hash($this->request->getVar('Password'), PASSWORD_DEFAULT),
                'address' => $this->request->getVar('address'),
                'birthdate' => $this->request->getVar('birthdate'),
            ];
            $this->user->save($data);
            return redirect()->to('/adminlogin');


        }
        else{
            $data['validation']= $this->validator;
            return view('adminregister', $data);
        }
    }

    public function login()
    {
        $session = session();

        $email = $this->request->getVar('email');
        $password = $this->request->getVar('password');

        $user = $this->user->where('email', $email)->first();

        // if(is_null($user)){
        //     return redirect()->back()->withInput()->with('error', 'Invalid Username or Password!');
        // }

        // $pass_verify = password_verify($password, $user['password']);

        // if(!$pass_verify){
        //     return redirect()->back()->withInput()->with('error', 'Invalid Username or Password!');            
        // }
        if($user)
            {
                $pass = $user['Password'];
                $authenticatePassword = password_verify($password, $pass);
                if($authenticatePassword){
    $ses_data = [
            'UserID' => $user['UserID'],
            'LastName' => $user['LastName'],
            'FirstName' => $user['FirstName'],
            'email' => $user['email'],
            'gender' => $user['gender'],
            'ContactNo' => $user['ContactNo'],
            'file' => $user['file'],
            'UserRole' => $user['UserRole'],
            'birthdate' => $user['birthdate'],
            'address' => $user['address'],
            'Username' => $user['Username'],
            'Password' => $user['Password'],
            'isLoggedIn' => TRUE
        ];

        $session->set($ses_data);
           return redirect()->to('/adminhome');
                }
                else{
                    $session->setFlashdata('msg', 'Password is incorrect.');
                    return redirect()->to('/login');
                }
            }
            else{
                $session->setFlashdata('msg', 'Email does not exist.');
                return redirect()->to('/login');
            }

    }

    public function logout(){
        session_destroy();
        return redirect()->to('/adminlogin');
    }
}
