<style>

        ul, li, body{
            padding: 0;
            margin: 0;
            list-style-type: none;
            
        }
        a{
            text-decoration: none;
            color: black;
        }
        a:hover{
            color: gray;
        }

        #mypage{
            margin-top: 100px;
            width: 100%;
            height: 100vh;
        }
    

        #profilePage{
            width: 30%;
            float: left;
            height: 100vh;
            position: fixed;
        }
        #userProfile{
            margin-left: 50px;
            width: 350px;
            height: 600px;
            border-radius: 10px;
            background-color: rgb(230, 223, 215);
            position: relative;
           
        }
        #userPhoto{
            width: 250px;
            height: 250px;
            border-radius: 50%;
            background-color: blue;
            position: absolute;
            top: 50px;
            left: 50%;
            transform: translate(-50%, 0%);
            background-color: white;
            border: 1px solid #ddd;
        }
        #userid{
            position: absolute;
            top : 310px;
            left: 50%;
            transform: translate(-50%,0%); 
            font-size: 20px;
        }
        #studyDesc{
            position: absolute;
            top : 350px;
            left: 50%;
            transform: translate(-50%,0%); 
            
        }
        #studyDesc li{
            margin: 30px 0px;
            font-size: 18px;
        }

        #category{
            position: absolute;
            top: 550px;
            left: 50%;
            transform: translate(-50%,0%);
            width: 100%;
        }
        #category li{
            float: left;
            width: 50%;
            font-size: 16px;
            text-align: center;
        }
        #studyPage{
            width: 70%;
            float: right;
            height: 100vh;
            text-align: center;
            position: relative;
        }
        h2{
            text-align: center;
            height: 100px;
        }
        .studyState{
           position: absolute;
           left: 50%;
           transform: translate(-50%,0%); 
           margin-top: 70px;
           width: 100%;
        }
        .studyState li{
            float: left;
            width: 400px;
            width: 50%;
        }
        .studyState li a{
            color: gray;
            font-size: 20px;
        }
        .studyList{
            width: 800px;
        }
        .studyRooms{
            width: 100%;
            position: absolute;
            top: 250px;
        }
        .studyRooms li{
            float: left;
            width: 33.3%;
            height: 400px;
        }
        .rooms{
            width: 230px;
            height: 300px;
            border: 1px solid gray;
            border-radius: 15px;
            margin: 0 auto;
            position: relative;
            overflow: hidden;
        }
        .rooms img{
            width: 100%;
            height: 100%;
            opacity: 0.6;
        } 
        .roomDesc{
            font-size: 16px;
            font-weight: bold;
            position: absolute;
            left: 50%;
            top: 30%;
            transform: translate(-50%,0%); 
            color: rgb(61, 60, 60);
        }
        
        .paging{
            position: relative;
        }
        .paging ul{
            left: 50%;
            width: 30%;
            transform: translate(-50%,0%); 
            position: absolute;
            top: 1350px;
            
        }
        .paging ul li{
            float: left;
            width: 20%;
        }
        

    </style>

    <div id="mypage">
        <h2>마이페이지</h2>
        <div id="profilePage">
            <div id="userProfile">
                <div id="userPhoto">
                </div>
                <div id="userid">
                    Istudy님
                </div>
                <div id="userDesc">
                    <div>  
                        <ul id="studyDesc">
                            <li id="joinStudy">참가한 스터디 : 10개</li>
                            <li id="finishStudy">완료한 스터디 : 10개</li>
                        </ul>
                    </div>
                    <div>
                        <ul id="category">
                            <li><a href="#">회원 수정</a></li>
                            <li><a href="#">글 관리</a></li>
                        </ul>
                    </div>
                    
                </div>
            </div>
        </div>

        <div id="studyPage">
            <h3>스터디 관리</h3>
            <ul class="studyState">
                <li><a href="#">진행중인 스터디</a></li>
                <li><a href="#">완료된 스터디</a></li>
            </ul>
            <div class="studyList">
                <ul class="studyRooms">

                    <li>
                        <div class="rooms">
                            <img src="${url}/images/mypage_img/exstudy1.jpg" alt="">
                            <a href="#" class="roomDesc">
                            	<span class="roomCategory">알고리즘 스터디</span><br/>
                            	<span class="roomName">알고리즘 3팀</span>
                            </a>
                            
                        </div>
                    </li>
                    <li>
                        <div class="rooms">
                            <img src="${url}/images/mypage_img/exstudy2.jpg" alt="">
                            <a href="#" class="roomDesc">
                            	<span class="roomCategory">프로젝트</span><br/>
                            	<span class="roomName">IsTudy</span>
                            </a>
                        </div>
                    </li>
                    <li>
                        <div class="rooms">
                            <img src="${url}/images/mypage_img/exstudy3.jpg" alt="">
                            <a href="#" class="roomDesc">
                            	<span class="roomCategory">백엔드 스터디</span><br/>
                            	<span class="roomName">백엔드</span>
                            </a>
                        </div>
                    </li>
                    <li><div class="rooms"></div></li>
                    <li><div class="rooms"></div></li>
                    <li><div class="rooms"></div></li>
                    <li><div class="rooms"></div></li>
                    <li><div class="rooms"></div></li>
                    <li><div class="rooms"></div></li>
                </ul>
            </div>
            <div class="paging">
                <ul>
                    <li><a href="#">1</a></li>
                    <li><a href="#">2</a></li>
                    <li><a href="#">3</a></li>
                    <li><a href="#">4</a></li>
                    <li><a href="#">5</a></li>
                </ul>
            </div>
        </div>
        
    </div>