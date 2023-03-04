// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract ToDoList{
    /*
    addTask()
    updateStatus()
    updateTaskName()
    listAllTasks()
    removeTask()
    */

    struct Task{
        string name;
        bool status;    //task is complated or not
    }
    Task[] public tasks;

    function addTask(string memory _taskName) public{

        //variable_type variable_name
        Task memory task;   // Task yapısından task objesi oluşturduk
        task.name = _taskName;   

        tasks.push(task); // task objemizi Task[] dizisine push ettik
    }

    function updateStatus(uint _index) public {
    // hangi satk olduğunu bilmemiz için indexine ihtiyacımız var
    //Task = [task0, task1, task2.....]
        
        // tasks[_index].status = true;
        tasks[_index].status = !tasks[_index].status; // true ise false, false ise true
    }

    function updateTaskName(uint _index ,string memory _newName) public {
        tasks[_index].name = _newName;
    }

    function listAllTasks() public view returns(Task[] memory){ // tüm taskları getirmek için kullanılır 
        return tasks;
    }

//     function getOneTask() public view returns(Task memory){ // yalnızca 1 taskı almak için 
//         return tasks[0];
//     }
                                                            //   index =   0    1    2    3    4     
    function removeTask(uint _index) public {               // tasks[] = ["aa","bb","cc","dd","ee"]
        for(uint i =_index; i < tasks.length - 1; i++){     //                       X                  (2 indexli elemanı silmek için)
            tasks[i] = tasks[i+1];                          //           ["aa","bb","dd","dd","ee"]     (yanındakileri bir sola kopyalıyoruz)
        }                                                   //           ["aa","bb","dd","ee","ee"]              
        tasks.pop();                                        //                                  X       (sen sondakini siliyoruz.)  
    }
}