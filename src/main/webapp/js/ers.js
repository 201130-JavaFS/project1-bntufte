const url = "http://localhost:8089/project-1/";

document.getElementById("submitbtn").addEventListener('click', loginFunc);

async function loginFunc() {
    let usern = document.getElementById("username").value;
    let userp = document.getElementById("password").value;
    let user = {username:usern, password:userp};
    let resp = await fetch(url+'login', {method:"POST", body:JSON.stringify(user), credentials:'include'});
    if(resp.status===200){
        let user = await resp.json();
        if(user.role.roleId === 1) {
            managerDisplay();
        }
        else if(user.role.roleId === 2) {
            employeeDisplay();
        }
    }else{
        logInErrorFunc();
    }
};

async function logOutFunc() {
    let resp = await fetch(url+'logout', {method:"GET", credentials:'include'});
    if(resp.status===200) {
        document.getElementById("banner").innerHTML = "";
        document.getElementById("banner").innerHTML = "<h1>Revature Expense Reimbursment System</h1>";
        document.getElementById("fullcontainer").innerText="";    
        let content = document.createElement('div');
        content.setAttribute("class", "text-center");
        content.setAttribute("id", "login");
        content.innerHTML = "<h4 id='prompt'>Enter username and password</h4> <div class='row d-flex justify-content-center'> <input class='col-sm-2 form-control' id='username' type='text' placeholder='USERNAME'> </div> <div class='row d-flex justify-content-center'> <input class='col-sm-2 form-control' id='password' type='password' placeholder='PASSWORD'> </div> <button id='submitbtn' class='btn btn-warning'>Submit</button>";
        document.getElementById("fullcontainer").appendChild(content);
        document.getElementById("submitbtn").addEventListener('click', loginFunc);
    }
};

async function managerDisplay() {
    generalDisplay();
    let response = await fetch(url+'manReimburses', {method:"GET", credentials:'include'});
    if(response.status===404){
        let data = await response.json();
        for(let reimbur of data){
            let row = document.createElement("tr");
            let cell = document.createElement("td");
            cell.innerHTML = reimbur.id;
            row.appendChild(cell);
            let cell2 = document.createElement("td");
            cell2.innerHTML = reimbur.amount;
            row.appendChild(cell2);
            let cell3 = document.createElement("td");
            cell3.innerHTML = new Date(reimbur.submitted);
            row.appendChild(cell3);
            if(reimbur.resolved != null){
                let cell4 = document.createElement("td");
                cell4.innerHTML = new Date(reimbur.resolved);
                row.appendChild(cell4);
            }else{
                let cell4 = document.createElement("td");                
                row.appendChild(cell4);
            }
            let cell5 = document.createElement("td");
            cell5.innerHTML = reimbur.description;
            row.appendChild(cell5);
            let cell6 = document.createElement("td");
            cell6.innerHTML = reimbur.author.userName;
            row.appendChild(cell6);
            if(reimbur.resolver != null){
                let cell7 = document.createElement("td");
                cell7.innerHTML = reimbur.resolver.userName;
                row.appendChild(cell7);
            }else{
                let cell7 = document.createElement("td");
                row.appendChild(cell7);
            }
            let cell8 = document.createElement("td");
            cell8.innerHTML = reimbur.type.typeName;
            row.appendChild(cell8);
            let cell9 = document.createElement("td");
            cell9.innerHTML = reimbur.status.statusName;
            row.appendChild(cell9);
            document.getElementById("avbody").appendChild(row);
        };
        let content = document.createElement('button');
        content.setAttribute("class", "btn btn-warning topbtn");
        content.setAttribute("id", "addticketbtn");
        content.innerText = "New Reimbursement";
        document.getElementById("banner").appendChild(content);
        document.getElementById("addticketbtn").addEventListener('click', addReimb());
        let content2 = document.createElement('button2');
        content2.setAttribute("class", "btn btn-warning topbtn");
        content2.setAttribute("id", "pendingReimb");
        content2.innerText = "Pending Reimbursements";
        document.getElementById("banner").appendChild(content2);
    }
};

async function employeeDisplay() {
    generalDisplay();
    let response = await fetch(url+'empReimburses', {method:"GET", credentials:'include'});
    if(response.status===200){
        let data = await response.json();
        for(let reimbur of data){
            let row = document.createElement("tr");
            let cell = document.createElement("td");
            cell.innerHTML = reimbur.id;
            row.appendChild(cell);
            let cell2 = document.createElement("td");
            cell2.innerHTML = reimbur.amount;
            row.appendChild(cell2);
            let cell3 = document.createElement("td");
            cell3.innerHTML = new Date(reimbur.submitted);
            row.appendChild(cell3);
            if(reimbur.resolved != null){
                let cell4 = document.createElement("td");
                cell4.innerHTML = new Date(reimbur.resolved);
                row.appendChild(cell4);
            }else{
                let cell4 = document.createElement("td");                
                row.appendChild(cell4);
            }
            let cell5 = document.createElement("td");
            cell5.innerHTML = reimbur.description;
            row.appendChild(cell5);
            let cell6 = document.createElement("td");
            cell6.innerHTML = reimbur.author.userName;
            row.appendChild(cell6);
            if(reimbur.resolver != null){
                let cell7 = document.createElement("td");
                cell7.innerHTML = reimbur.resolver.userName;
                row.appendChild(cell7);
            }else{
                let cell7 = document.createElement("td");
                row.appendChild(cell7);
            }
            let cell8 = document.createElement("td");
            cell8.innerHTML = reimbur.type.typeName;
            row.appendChild(cell8);
            let cell9 = document.createElement("td");
            cell9.innerHTML = reimbur.status.statusName;
            row.appendChild(cell9);
            document.getElementById("avbody").appendChild(row);
        };
        let content = document.createElement('button');
        content.setAttribute("class", "btn btn-warning topbtn");
        content.setAttribute("id", "addticketbtn");
        content.innerText = "New Reimbursement";
        document.getElementById("banner").appendChild(content);
        document.getElementById("addticketbtn").addEventListener('click', addReimb);
    }
};

async function addReimb(){
    document.getElementById("banner").innerHTML = "";
    document.getElementById("banner").innerHTML = "<h1>Revature Expense Reimbursment System</h1>";
    let content = document.createElement('button');
    content.setAttribute("class", "btn btn-warning topbtn");
    content.setAttribute("id", "logoutbtn");
    content.innerText = "LogOut";
    document.getElementById("banner").appendChild(content);
    document.getElementById("logoutbtn").addEventListener('click', logOutFunc);
    document.getElementById("fullcontainer").innerText="";      
    let content2 = document.createElement('div');
    content2.setAttribute("class", "text-center");
    content2.setAttribute("id", "login");
    content2.innerHTML = "<h4 id='prompt'>Enter Reimbursement Details</h4> <div class='row d-flex justify-content-center'> <input class='col-sm-2 form-control' id='amount' type='text' placeholder='AMOUNT'> </div> <div class='row d-flex justify-content-center'> <input class='col-sm-2 form-control' id='desc' type='text' placeholder='DESCRIPTION'> </div> <div class='row d-flex justify-content-center'> <input class='col-sm-2 form-control' id='type' type='text' placeholder='TYPE'> </div> <button id='enterbtn' class='btn btn-warning'>Enter</button>";
    document.getElementById("fullcontainer").appendChild(content2);    
    document.getElementById("enterbtn").addEventListener('click', ticketSubmitFunc);
};

async function logInErrorFunc() {
        document.getElementById("banner").innerHTML = "";
        document.getElementById("banner").innerHTML = "<h1>Revature Expense Reimbursment System</h1>";
        document.getElementById("fullcontainer").innerText="";    
        let content = document.createElement('div');
        content.setAttribute("class", "text-center");
        content.setAttribute("id", "login");
        content.innerHTML = "<h4 id='prompt'>Enter username and password</h4> <h6 style='color:red'>Incorrect Username or Password</h6> <div class='row d-flex justify-content-center'> <input class='col-sm-2 form-control' id='username' type='text' placeholder='USERNAME'> </div> <div class='row d-flex justify-content-center'> <input class='col-sm-2 form-control' id='password' type='password' placeholder='PASSWORD'> </div> <button id='submitbtn' class='btn btn-warning'>Submit</button>";
        document.getElementById("fullcontainer").appendChild(content);
        document.getElementById("submitbtn").addEventListener('click', loginFunc);
   
};

async function generalDisplay() {
    let content = document.createElement('button');
    content.setAttribute("class", "btn btn-warning topbtn");
    content.setAttribute("id", "logoutbtn");
    content.innerText = "LogOut";
    document.getElementById("banner").appendChild(content);
    document.getElementById("fullcontainer").innerText="";
    let content2 = document.createElement('div');
    content2.setAttribute("class", "row");
    content2.setAttribute("id", "table-row");
    content2.innerHTML = "<table class='table table-hover sortable' id='avtable'><thead><tr><th>ID</th><th>Amount</th><th>Submitted</th><th>Resolved</th><th>Description</th><th>Author</th><th>Resolver</th><th>Type</th><th>Status</th></tr></thead><tbody id='avbody'></tbody></table>";
    document.getElementById("fullcontainer").appendChild(content2);
    document.getElementById("logoutbtn").addEventListener('click', logOutFunc);
};