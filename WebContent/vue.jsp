<%@ page language="java" contentType="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8"/>
<title>Vue</title>
<script type="text/javascript" src="/js/vue.js"></script>
<script type="text/javascript" src="/js/vue-resource.min.js"></script>
<script type="text/javascript" src="/js/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.min.js"></script>
</head>
<body>
<a href="findall">list</a>
<div id="app">
  <p>{{ name }}</p><br>
  <!--<table  border="1">
 <thead>
        <tr>
		<th>编号</th>
        <th>昵称</th>
		<th>地址</th>
         <th>操作</th>	
        </tr>
      </thead>
      <tbody v-for="item in info">
      <tr>
       <td>{{item.id}}</td>
            <td>{{item.name}}</td>
            <td>{{item.addr}}</td>
            <td>
            <button  @click="abc({{item.id}})">删除</button>
            <button>修改</button>
          </td>
          </tr>
      </tbody>
 
  </table> -->
</div>
<script>
var users = new Vue({
	el:"#app",
	data:{
		name:'fdsafsd',
		usersList:[],
		user:{},
		genderOptions:[
			{text:'男',value:'M'},
			{text:'女',value:'F'}
		],
		nowIndex:-100,
	},
	methods:{
		findUsers : function(){
		alert("1")
			this.$http.get("/findall").then(function(res){
				console.log(res.data);
				users.usersList = res.data;
				alert(res.data);
			},function(){
				console.log("请求失败");
			});
		},
		bfUpdateUsers:function(us,index){
			users.user = us;
			users.nowIndex=index;
		},
		updateUsers:function(){
			alert("1")
			this.$http.post("/users/updateUser",this.user).then(function(res){
				if(res.data){
					console.log("修改成功");
					this.user.gender == 'M'?this.user.gender='男':this.user.gender='女';
					Vue.set(this.usersList,this.nowIndex,this.user);
					this.user={};
					users.findUsers();
				}else{
					console.log("修改失败");
				}
			}),function(){
				console.log("/修改异常");
			}
		},
		bfDeleteUsers:function(us,index){
			users.user = us;
			users.nowIndex=index;
		},
		deleteUsers:function(){
			this.$http.get("/users/deleteUser",{uid:this.user.uid}).then(function(res){
				if(res.data){
					console.log("/删除成功");
					this.usersList.splice(this.nowIndex,1);
					this.user={};
				}else{
					console.log("/删除失败");
				}
			},function(){
				console.log("/修改异常");
			});
		},
		insertUsers:function(){
			this.$http.post("/users/insertUser",this.user).then(function(res){
				alert("1");
				if(res.data != null){
					console.log("添加成功");
					this.user.gender == 'M'?this.user.gender='男':this.user.gender='女';
					this.usersList.push(res.data);
					this.user={};
				}else{
					console.log("添加失败");
				}
			}),function(){
				console.log("/添加异常");
			}
		}
	}
});

users.findUsers();
</script>
</body>
</html>