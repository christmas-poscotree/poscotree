<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style type="text/css">
.background{
    padding: 0px;
    border: 0px;
    font: inherit;
    vertical-align: baseline;
     min-height: calc(var(--vh,1vh) * 100); 
    /* width: 768px; */
    width: 100%;
    margin: 0px auto;
    /* background: linear-gradient(#A5D8FA 5%, #E8F5FF, #E0EBFF,  #EBFBFF); E1F6FA	#3296D7*/
  	background-image: url( "../img/ssnow.gif" );
  	background-size:cover;
    /*background: linear-gradient(#E1F6FA 5%, #3296D7,#1BBC9B,   #1BBC9B,  #1BBC9B);  */  

    display: flex;
    flex-direction: column;
    overflow: auto;
}

.bg_divide{
	padding: 0px;
    border: 0px;
    font: inherit;
    vertical-align: baseline;
    margin: 0px auto;
    height: 40vh;
    width: 768px;
    display: flex;
    flex-direction: column;
    background: transparent;
    position: relative;
}

.a{
display: flex; 
position: relative; 
left: 70px; 
top: 100px;
}

.create{
	width: 281px;
    height: 29px;
    border-width: 1.5px;
    border-style: dashed;
    border-color: white;
    border-radius: 2px;
    background-color: rgb(175, 32, 16);
    outline: rgb(175, 32, 16) solid 9px;
    font-weight: 400;
    font-size: 14px;
    font-family: Nanum Pen Script;
    line-height: 20px;
    color: white;
    margin-bottom: 50px;
    cursor: pointer;
}

.introduceText{
	width: 230px;
    min-height: 93px;
    border-radius: 2px;
    background: rgb(0, 84, 82);
    color: rgb(255,255,255);
    border-radius: 5px;
    border-color: transparent transparent rgb(186, 184, 181);
    border-bottom-style: solid;
    border-bottom-width: 1px;
    padding-left: 10px;
    text-align: center;
    font-style: normal;
    font-weight: 400;
    font-size: 18px;
    line-height: 25px;
    resize: none;
    white-space: pre-wrap;

}

.pic{
	padding: 0px;
    border: 0px;
    font: inherit;
    vertical-align: baseline;
    margin: 0px auto;
    -webkit-box-align: center;
    align-items: center;
    text-align: center;
}
.imag{
	text-align: center;
    padding: 0px;
    border: 0px;
    font: inherit;
    vertical-align: baseline;
    margin: 0px auto;
    }
    .pic_tree{
        text-align: center;
	    margin: 0px;
	    padding: 0px;
	    border: 0px;
	    font: inherit;
	    vertical-align: baseline;
	    width: 350px;
	    height: 315.16px;
	    margin-top: 27px;
    }

.text{
	text-align: center;
    margin: 0px;
    padding: 0px;
    border: 0px;
    font: inherit;
    vertical-align: baseline;
    display: flex;
    flex-direction: column;
    place-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    margin-top: 22.84px;
    margin-bottom: 10px;
    border-radius: 5px;
    font-family: Nanum Pen Script;
    }
    .nick{
    width: 115px;
    height: 25px;
    border-radius: 5px;
   	border-radius: 2px;
    background: rgb(0, 84, 82);
    border-bottom-style: solid;
    border-bottom-width: 1px;
    padding-left: 10px;
    text-align: center;
    font-style: normal;
    font-size: 18px;
    line-height: 25px;
    font-weight: bold;
    font-family: Nanum Pen Script;
    }
     textarea::placeholder {
        color: white;
        font-weight: italic;
        opacity: 0.33;
        font-family: Nanum Pen Script;
      }
      input::placeholder {
        color: white;
        font-weight: italic;
        opacity: 0.33;
        font-family: Nanum Pen Script;
      }

}
</style>




<title>트리만들기</title>
</head>
<body>

	<div class="background" >
	<audio src="../img/christmas.mp3" controls autoplay loop style="margin-top: 20px; margin-left: 20px;"></audio>
		<div class="bg_divide" style="position: relative;">
			
			<div style="position: relative;">
				<div class="pic">
					<div style="margin-top: 95px; height: 29px; font-size: 22px; font-weight: bold; color:black; text-shadow:2px 2px 30px #fffff">
						트리에 들어갈 정보를 입력해주세요!
					</div>
						
					<div class="imag">
						<img src="../img/img_tree.png" class="pic_tree"/>
					</div>

						<form class="text" action="/tree/create" method="post" accept-charset="UTF-8">
							<input type="text" placeholder="닉네임" class="nick" name="treeNm" style="font-weight: bold; " required>
							<h1 style="font-size: 0px; font-weight: bold; ">트리</h1></br></br>
						<textarea rows="5" cols="33" placeholder="내 트리를 소개해 주세요!" class="introduceText" name="treeInfo" required></textarea><br><br>
						<br>
						<br>
							<button type="submit" class="create">트리 만들기</button>
						</form>
					
				</div>
						
			</div>
		</div>
	</div>

		
		
	
</body>
</html>