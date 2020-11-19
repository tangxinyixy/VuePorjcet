<%@ page language="java" contentType="text/html; charset=utf-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="js/vue.js"></script>
<script type="text/javascript" src="js/vue-resource.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
</head>
<body>
	<div id="app">
		<p>所有数据 ：{{ info }}</p>
		<p>修改或添加的数据：{{ user }}</p>
		<p>要被删除的数据ID：{{ deleteid }}</p>
		<div>
			<button class="btn btn-primary btn-lg" v-on:click="off();" data-toggle="modal" data-target="#myModal">
	添加
</button>
		</div>
		<table class="table table-hover" border="1">
 <thead>
        <tr>
		<th>编号</th>
        <th>昵称</th>
		<th>地址</th>
         <th>操作</th>	
        </tr>
      </thead>
      <tbody v-for="(item,index) in info ">
      <tr>
       <td>{{item.id}}</td>
       <td>{{item.name}}</td>
       <td>{{item.addr}}</td>
        <td>
        <button v-on:click="deletebyid(item.id)">删除</button>
        <button v-on:click="beforeupdate(item,index)" data-toggle="modal" data-target="#myModal">修改</button>
        </td>
          </tr>
      </tbody>
 
  </table>
  <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					新增
				</h4>
			</div>
			<div class="modal-body">
				<form class="bs-example bs-example-form" role="form">
							<div class="input-group">
								<span class="input-group-addon">名称</span>
								<input type="text" class="form-control"
									name="name" placeholder="名称" value="{{user.name}}" v-model="user.name">
							</div>
							<br>
							
							<div class="input-group">
								<span class="input-group-addon">地址</span>
								<input type="text" name="addr"
									class="form-control" placeholder="地址" value="{{user.addr}}" v-model="user.addr">
							</div>
						</form>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal" v-on:click="off();">关闭
				</button>
				<button type="button" class="btn btn-primary" v-on:click="userAddorupdate();">
					提交更改</button>
			</div>
		</div><!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
	</div>

	<script>
		var vm = new Vue({
			el : '#app',
			data : {
				info : [],
				user : {},
				deleteid : null
			},
			methods:{
				findUsers : function(){
					alert("進來了");
					this.$http.get("/TestVue/findall").then(function(res){
						console.log("请求成功");
						vm.info = res.data.source;
					},function(){
						console.log("请求失败");
					});
				},
				userAddorupdate : function(){
					this.$http.post("/TestVue/addandupdate",this.user).then(function(res){
						vm.user = {},
						vm.findUsers();
						console.log("请求成功");
					},function(){
						console.log("请求失败");
					});
				},
				deletebyid : function(index){
					this.$http.get("/TestVue/remove",{id:index}).then(function(res){
						vm.deleteid=index;
						if(res.data){
							vm.findUsers();
						}
					},function(){
						console.log("请求失败");
					});
				},
				beforeupdate : function(item,index){
					vm.user=item;
				},
				off : function(){
					vm.deleteid=null;
					vm.user={};
				}
			}
		})
		
		vm.findUsers();
	</script>
</body>
</html>