const url = "http://localhost:8089/project-1/";

document.getElementById("submitbtn").addEventListener('click', loginFunc);

async function loginFunc() {
    let usern = document.getElementById("username").value;
    let userp = document.getElementById("password").value;
    let user = {username:usern, password:userp};
    let resp = await fetch(url+'login', {method:"POST", body:JSON.stringify(user), credentials:'include'});
    if(resp.status===200){
        document.getElementById("login").innerText="You have logged in";
    }else{
        document.getElementById("login").innerText="Login failed, reload page.";
    }
};