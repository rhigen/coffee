<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\AdminUserModel;
use App\Models\HistoryModel;
use App\Models\ProductModel;

class AdminController extends BaseController
{
    private $adminuser;
    private $history;
    private $orderprod;
    private $load;
    
    public function __construct(){
        $this->adminuser = new AdminUserModel();
        $this->history = new HistoryModel();
        $this->orderprod = new ProductModel();
    }

    public function edit($id)
    {
        $adminuser = new AdminUserModel();
        $data = $this->adminuser->where('user_id', $id)->findAll();

        var_dump($data);
    }

    public function register(){
        return view('/admin/register');
    }

    public function login(){
        return view('/admin/login');
    }

    public function home(){
       return view('/admin/home');
    }

    public function dashboard(){
        return view('/admin/dashboard');
    }

    public function inventory()
    {
        return view ('/admin/inventory');
    }

    public function order(){
        return view('/admin/order');
    }

    public function gethistory()
    {
        $history = new HistoryModel();
        $data['history'] = $history->findAll();
        return view ('/admin/history', $data);
    }

    public function getmanageuser()
    {
        $mnguser = new AdminUserModel();
        $data['mnguser'] = $mnguser->findAll();
        return view ('/admin/manage_user', $data);
    }

    public function mnguser(){
        return view('/admin/adduser');
    }

    public function adduser()
    {
        $user = new AdminUserModel();
        $data = [
            'name' => $this->request->getPost('name'),
            'username' => $this->request->getPost('username'),
            'password' => $this->request->getPost('password'),
            'role' => $this->request->getPost('role'),
            'Created_at' => $this->request->getPost('Created_at'),
        ];
        $user->save($data);
        return redirect()->to(base_url('adminmanage_user'));
    }
    public function edituser($id)
    {
        $euser = new AdminUserModel();
        $data['euser'] = $euser->find($id);
        return view('/admin/edituser', $data);
    }

    public function updateuser($id)
    {
        $user = new AdminUserModel();
        $data = [
            'name' => $this->request->getPost('name'),
            'username' => $this->request->getPost('username'),
            'password' => $this->request->getPost('password'),
            'role' => $this->request->getPost('role'),
            'Created_at' => $this->request->getPost('Created_at'),
        ];
        $user->update($id, $data);
        return redirect()->to(base_url('adminmanage_user'));
    }
    
    public function deleteuser($id)
    {
        $user = new AdminUserModel();
        $user->delete($id);
        return redirect()->to(base_url('adminmanage_user'));
    }

    public function adminregister()
    {
        $rules = [
            'name' => 'required|min_length[2]',
            'username' => 'required|min_length[2]',
            'password' => 'required|min_length[5]',
            'role' => 'required',
        ];

        if($this->validate($rules)){
            $data = [
                'name' => $this->request->getVar('name'),
                'username' => $this->request->getVar('username'),
                'password' => password_hash($this->request->getVar('password'), PASSWORD_DEFAULT),
                'role' => $this->request->getVar('role')    
            ];
            $this->adminuser->save($data);
            return redirect()->to('/login');
        }
        else{
            $data['validation']= $this->validator;
            return view('adminregister', $data);
        }
    }

    public function adminlogin()
    {
        $session = session();
        $username = $this->request->getVar('username');
        $password = $this->request->getVar('password');

        $user = $this->adminuser->where('username', $username)->first();

        // if(is_null($user)){
        //     return redirect()->back()->withInput()->with('error', 'Invalid Username or Password!');
        // }

        // $pass_verify = password_verify($password, $user['password']);

        // if(!$pass_verify){
        //     return redirect()->back()->withInput()->with('error', 'Invalid Username or Password!');            
        // }
        if($user)
        {
            $pass = $user['password'];
            $authenticatePassword = password_verify($password, $pass);
            if($authenticatePassword){

            $ses_data = [
                'user_id' => $user['user_id'],
                'name' => $user['name'],
                'username' => $user['username'],
                'role' => $user['role'],
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

    public function adminlogout(){
        session_destroy();
        return redirect()->to('/login');
    }
}
