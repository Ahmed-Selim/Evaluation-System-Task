<?php

namespace App\Controllers;

class Home extends BaseController
{

    protected $session;

    public function index()
    {
        $this->session = session() ;
        return view('welcome');
    }
    
    public function sign_in(){
        $this->session = session() ;
        $email = $this->request->getVar('email');
        $password = $this->request->getVar('password');
        
        $employee = (new Employee())->getEmployeeData($email);
        
        // var_dump(password_verify($password, $employee->employee_pass));
        // var_dump(password_hash('123456',1));

        if ($employee) {
            $pass = $employee->employee_pass;
            if (password_verify($password, $pass)) {
                $this->storeCurrentEmployeeData($employee);
                // return $this->redirectEmployee();
                return redirect()->to('/employees') ;
            } else {
                $this->session->setFlashdata('msg', 'Password is incorrect.');
                return redirect()->to('sign-in');
            }
        } else {
            $this->session->setFlashdata('msg', 'Email does not exist.');
            return redirect()->to('sign-in');
        }
    }

    public function sign_out() {
        $this->session = session() ;
        $this->removeCurrentEmployeeData();
        return redirect()->to('/') ;
    }

    public function storeCurrentEmployeeData ($data) {
        $this->session->set ([
            'employee_id' => intval($data->employee_id),	
            'employee_name' => $data->employee_name,	
            'employee_email' => $data->employee_email,	
            'employee_created_at' => $data->employee_created_at,	
            'employee_updated_at' => $data->employee_updated_at,	
            'department' => $data->department,	
            'manager_id' => intval($data->manager_id),	
            'manager_name' => $data->manager_name,	
            'manager_email' => $data->manager_email,	
            'evaluator_id' => intval($data->evaluator_id),	
            'role' => $data->role
        ]);
    }
    
    public function removeCurrentEmployeeData () {
        $this->session->remove ([
            'employee_id',
            'employee_name',
            'employee_email',
            'employee_created_at',
            'employee_updated_at',
            'department',
            'manager_id',
            'manager_name',
            'manager_email',
            'evaluator_id',
            'role'
        ]);
    }

    public function redirectEmployee () {
        $role = $this->session->get('role') ;

        switch ($role) {
            case 'Manager':
                // var_dump('MANG');
                return redirect()->to('/managers/'.$this->session->employee_id) ;
                break;           
            case 'Evaluator':
                var_dump('EVAL');
                return redirect()->to('/evaluators/'.$this->session->evaluator_id) ;            
                break;
            default:
                var_dump('EMP');
                return 'Welcome, '. $this->session->employee_name ;
        }
    }
}
