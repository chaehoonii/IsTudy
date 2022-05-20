<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="url" value="<%=request.getContextPath()%>"/>

<link rel="stylesheet" href="/css/admin/adminData.css" type="text/css">  

<script src="https://cdn.jsdelivr.net/npm/chart.js@3.5.1/dist/chart.min.js"></script>

    <div class="adminDataPage">
        <div class="profilePage">
            <div class="userProfile">
                <div class="userPhoto">
                	<img src="/upload/user/${logImg}" id="mypage_profile_img" />
                </div>
                <div class="userNickname">
                	${nickName} 
                </div>
                <div class="userid">
                	(${id})
                </div>
                <div class="userDesc">
                    <div class="category">
                        <ul>
	                    	<li><a href="#">신고관리</a></li>
                    	  	<li><a href="/admin/adminUsers">회원관리</a></li>
                          	<li><a href="#">공지사항 관리</a></li>
                          	<li><a href="/admin/adminData">데이터 랩</a></li>
	                    </ul>  
                    </div>
                </div>
            </div>
        </div>
        <div class="contentPage">         
            <div class="contentBox">
            	<div class="title">
            		Data Lab
            	</div>         		          
            	<div class="contents">
            		<div class="container">
            			<div class="chart_title">신규회원 추이</div>
            			<div class="chart">
            				<canvas  id="chart1"  width="520" height="400"></canvas>
            			</div>
            		</div>
            		<div class="container">
            			<div class="chart_title">스터디 개설 분포</div>
            			<div class="chart">
            				<canvas  id="chart2"  width="520" height="400"></canvas>
            			</div>
            		</div>
            		<div class="container">
            			<div class="chart_title">멘토 회원, 일반 회원</div>
            			<div class="chart">
            				<canvas  id="chart3"  width="520" height="400"></canvas>
            			</div>
            		</div>
            		<div class="container">
            			<div class="chart_title">인기 있는 스터디</div>
            			<div class="chart">
            				<canvas  id="chart4"  width="520" height="400"></canvas>
            			</div>
            		</div>           	
            	</div>		        
            </div>  
        </div>
   </div>
  <div style="clear:both"></div>
   
   <script>
   
     	new Chart(document.getElementById("chart1"), {   		
     		type: 'line',
    		data: {
    			labels: [${register_date}],  //날짜 
    			datasets: [{
    				label: '신규 회원 추이(6개월)',   
    				data: [${new_cnt}],   //신규 회원 수 
    				backgroundColor: [  					
    					'rgba(193, 117, 255, 0.2)'
    				],
    				borderColor: [   					
    					'rgba(193, 117, 255, 1)'
    				],   				
    				borderWidth: 1
    			}]
    		},
    		options: {
    			responsive: false,
    			scales: {
    				x: {
    					ticks : {
    						color : 'black',
    						font : {
    							size: 14,
    						},
    					}
    				},
    				yAxes: [{
    					ticks: {
    						beginAtZero: true
    					}
    				}]
    			}
    		}    
     	});
     	
     	
		new Chart(document.getElementById("chart2"), {    		
     		type: 'doughnut',
    		data: {
    			labels: ['프론트엔드', '백엔드', '알고리즘', '프로젝트', 'IT영어', '그외' ],  
    			datasets: [{
    				label: '영역별 스터디 분포', 
    				data: [${frontend}, ${backend}, ${algo}, ${project}, ${english}, ${etc}],   
    				backgroundColor: [
    					'rgba(254,181,177,0.2)',
    					'rgba(163, 189, 237, 0.2)',
    					'rgba(255, 206, 86, 0.2)',
    					'rgba(163, 197, 133, 0.2)',
    					'rgba(179, 153, 212, 0.2)',
    					'rgba(190, 189, 184, 0.2)'
    				],
    				borderColor: [
    					'rgba(254,181,177,1)',
    					'rgba(163, 189, 237, 1)',
    					'rgba(255, 206, 86, 1)',
    					'rgba(163, 197, 133, 1)',
    					'rgba(179, 153, 212, 1)',
    					'rgba(190, 189, 184, 1)'
    				],
    				borderWidth: 1
    			}]
    		},
    		options: {
    			responsive: false,
    			plugins : {
    				labels : {
    					render : 'label',
    					precision : 1,
    					arc : false,
    					position : 'border'
    					
    				}
    			}
    		}  		
     	});		
		
		
		new Chart(document.getElementById("chart3"), {     		
     		type: 'bar',
    		data: {
    			labels: ['멘토', '일반'],  
    			datasets: [{
    				label: '멘토 회원',   
    				data: [${mentor}, ${user}],   
    				backgroundColor: [ 					
    					'rgba(255, 206, 86, 0.2)',
    					'rgba(176,206,255,0.2)',   					   					
    				],
    				borderColor: [  					
    					'rgba(255, 206, 86, 1)',
    					'rgba(176,206,255,1)',					
    				],
    				borderWidth: 1
    			}]
    		},
    		options: {
    			responsive: false,
    			scales: {
    				x: {
    					ticks : {
    						color : 'black',
    						font : {
    							size: 15,
    						},
    					}
    					
    				},
    				y: [{
    					ticks: {
    						beginAtZero: true,
    						color : 'black'
    					}
    				}]
    			}
    		}    		
     	});
		
		new Chart(document.getElementById("chart4"), {   		
     		type: 'bar',
    		data: {  		
    			labels: [${study_rank}],  
    			datasets: [{
    				label: '인기 있는 스터디',   
    				data: [${study_rank_cnt}],   
    				backgroundColor: [    					
    					'rgba(255, 87, 79, 0.2)',
    				      'rgba(255, 159, 64, 0.2)',
    				      'rgba(255, 205, 86, 0.2)',
    				      'rgba(163, 197, 133, 0.2)',
    				      'rgba(147, 174, 209, 0.2)',
    				      'rgba(153, 102, 255, 0.2)',
    				      'rgba(185, 187, 182, 0.2)'
    				],
    				borderColor: [   					
    					'rgba(255, 87, 79, 1)',
    				      'rgb(255, 159, 64)',
    				      'rgb(255, 205, 86)',
    				      'rgb(163, 197, 133)',
    				      'rgba(147, 174, 209, 1)',
    				      'rgb(153, 102, 255)',
    				      'rgba(185, 187, 182, 1)'
    				],
    				borderWidth: 1
    			}]
    		},
    		options: {
    			responsive: false,
    			scales: {
    				x: {
    					ticks : {
    						color : 'black',
    						font : {
    							size: 15,
    						},
    					}	
    				},
    				y: [{
    					ticks: {
    						beginAtZero: true
    					}
    				}]
    			}
    		}     		
     	});
 </script>
