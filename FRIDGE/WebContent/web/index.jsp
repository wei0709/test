<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,com.team2.bean.FoodBean,com.mongodb.*;"%>
<%!@SuppressWarnings("unchecked")%>
<!DOCTYPE html>
<html lang="zh-tw">
<head>
 
    

</head>
<body>
<jsp:useBean id="tem" scope="request" class="com.team2.bean.FoodBean" />
    <div id="allpage">
        <header>
                    
        </header>
        <div id="content">
            <article class="article">
                <section class="section">
                    <!-- <fieldset class="env"> -->
						<div class="st1 row justify-content-between">
                           <div class="col-6">
                            <span class="t1" >Temperature:</span>
                             <% MongoClient mongoClient=new MongoClient("localhost",27017); %>
	               			 <% DB database=mongoClient.getDB("sensors"); %>
	            			 <% DBCollection collection = database.getCollection("dht11"); %>
	            			 <% DBCursor cursor = collection.find(); %>
            			     <% System.out.println("從資料集中讀取資料："); %>
            			     <% String temperature=""; %>
            			     <% String humity=""; %>
            			     <% while(cursor.hasNext()){ %>
            			    	<%  BasicDBObject bdbObj = (BasicDBObject) cursor.next(); %>
            			         <% if(bdbObj != null){ %>
            			             <%  temperature=bdbObj.getString("溫度"); %>
            			             <%  humity=bdbObj.getString("濕度"); %>
            			            <%  } %>
            			        <%  } %>
                            <%= temperature %>
                            <span class="t1">°C</span>
                            </div>
                            <div class="col-5">
                            <button class="btn btn-secondary btn-lg" style="width:150px" onclick="javascript:location.href='http://localhost:5438'">Power saving</button>
                        </div>
        			  </div>
        			  
        			   <div class="st1 row justify-content-between">
                           <div class="col-6">
                            <span class="t1" >Humidity:</span>
                            <%= humity %>
                            <span class="t1">%</span>
                            </div>
                            <div class="col-5">
                            <button class="btn btn-secondary btn-lg" style="width:150px" onclick="javascript:location.href='http://localhost:5438'">Power on</button>
                            
                           </div>
                        </div>
        			  
        			  
        			  
        			  
                       
                     <div id="allpage">
                     <h4 class="text-secondary text-center">Energy regulation</h4>
                <div class="row justify-content-between">
                    <div class="col-7">
                    <span class="t1" >Temperature:</span>
                        <input type="text" class=t1 size=100%>
                    <span class="t1">°C</span>
                    </div>
                    <div class="col-5">
                    <button class="btn btn-secondary btn-lg" style="width:160px" id="stop">Power saving</button>
                    </div>
                <div>
                <div class="row justify-content-between">
                    <div class="col-7">
                    <span class="t1" >Humidity:</span>
                        <input type="text" class=t1 size=100%>
                    <span class="t1">%</span>
                    </div>
                    <div class="col-5">
                    <button class="btn btn-secondary btn-lg" style="width:160px" id="start">Power on</button>
                    </div>
                </div>
            </div>
                     
                     
                     
                     
                     
                    </section>
            </aside>
        </div>  <!--end content-->
        
         <script src="http://code.jquery.com/jquery.js"></script>
         <script src="../node_modules/socket.io/lib/socket.js"></script>
         <script>
          var socket = io();  //io.connect()的縮寫
 

          $('#start').on('click', function () {
    			socket.emit('start_pin16');
			});

		  $('#stop').on('click', function () {
   			 socket.emit('stop_pin16');
				});	
		</script>
  	

    
</body>
</html>