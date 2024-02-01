<?php

namespace App\Controllers;

use App\Controllers\BaseController;
use App\Models\ProductModel;

class ProductController extends BaseController
{
    private $product;

    public function __construct()
    {
        $this->product = new ProductModel();
    }


    public function AddProduct(){
        
        $rules = [
            'productName'=> 'required|minlength[4]|maxlengt[100]',
            'ProductQuantity'=> 'required|minlength[4]|maxlengt[100]',
            'ProductPrice'=> 'required|minlength[4]|maxlengt[100]',
            'ProductCategory'=> 'required|minlength[4]|maxlengt[100]',
            'ProductCode'=> 'required|minlength[4]|maxlengt[100]',
            'ProductDescription'=> 'required|minlength[4]|maxlengt[100]',
        ];

        if($this->validate($rules)){

            $data = [
                'productName' => $this->request->getVar('productName'),
                'ProductQuantity' => $this->request->getVar('ProductQuantity'),
                'ProductPrice' => $this->request->getVar('ProductPrice'),
                'ProductCategory' => $this->request->getVar('ProductCategory'),
                'ProductCode' => $this->request->getVar('ProductCode'),
                'ProductDescription' => $this->request->getVar('ProductDescription'),
            ];

            $this->product->save($data);
        }

        else
        {
            $data['validation'] = $this->validator;
            return view('inventory/hotcoffee', $data);
        }
    }

    public function editProduct($ProductID){

        $data['product'] = $this->product->where('productID', $ProductID)->findAll();

        return view('product/editProduct', $data);
    }

    public function updateProduct(){
        
        $rules = [
            'productName'=> 'required|minlength[4]|maxlengt[100]',
            'ProductQuantity'=> 'required|minlength[4]|maxlengt[100]',
            'ProductPrice'=> 'required|minlength[4]|maxlengt[100]',
            'ProductCategory'=> 'required|minlength[4]|maxlengt[100]',
            'ProductCode'=> 'required|minlength[4]|maxlengt[100]',
            'ProductDescription'=> 'required|minlength[4]|maxlengt[100]',
        ];
        if($this->validate($rules)){
                $user_id = $this->request->getVar('user_id');
            $data = [
                'productName' => $this->request->getVar('productName'),
                'ProductQuantity' => $this->request->getVar('ProductQuantity'),
                'ProductPrice' => $this->request->getVar('ProductPrice'),
                'ProductCategory' => $this->request->getVar('ProductCategory'),
                'ProductCode' => $this->request->getVar('ProductCode'),
                'ProductDescription' => $this->request->getVar('ProductDescription'),
            ];

            $this->product->set($data)->where('productID', $user_id)->update();
            return view('procuct/editProduct', $data);
        }

        else
        {
            $data['validation'] = $this->validator;
            return view('inventory/hotcoffee', $data);
        }
   

        
    }
    public function deleteProduct($user_id)
    {
        $this->product->delete($user_id);

        return redirect();
    }
}
