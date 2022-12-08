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
    width: 768px;
    margin: 0px auto;
    background: linear-gradient(rgb(245, 200, 184) 5%, rgb(252, 244, 233), rgb(252, 244, 233), rgb(252, 244, 233), rgb(252, 244, 233));
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
    background: rgb(0, 84, 82);
    outline: rgb(0, 84, 82) solid 9px;
    font-weight: 400;
    font-size: 14px;
    font-family: humanbeomseok;
    line-height: 20px;
    color: white;
    margin-top: 9px;
    margin-bottom: 9px;
}

.introduceText{
	width: 230px;
    min-height: 93px;
    background-color: rgb(252, 244, 233);
    color: rgb(0, 0, 0);
    border-color: transparent transparent rgb(186, 184, 181);
    border-bottom-style: solid;
    border-bottom-width: 1px;
    padding-left: 10px;
    text-align: center;
    font-style: normal;
    font-weight: 400;
    font-size: 18px;
    line-height: 25px;
    font-family: humanbeomseok;
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
	    width: 210px;
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
    flex-direction: row;
    place-items: center;
    -webkit-box-pack: center;
    justify-content: center;
    -webkit-box-align: center;
    margin-top: 22.84px;
    margin-bottom: 20px;
    }
    .nick{
        width: 115px;
    height: 25px;
    background-color: rgb(252, 244, 233);
    color: rgb(0, 0, 0);
    border-color: transparent transparent rgb(186, 184, 181);
    border-bottom-style: solid;
    border-bottom-width: 1px;
    padding-left: 10px;
    text-align: center;
    font-style: normal;
    font-size: 18px;
    line-height: 25px;
    font-weight: bold;
    font-family: humanbeomseok;
    }

.cinfo{
	    margin: 0px;
    padding: 0px;
    border: 0px;
    font: inherit;
    vertical-align: baseline;
    font-family: humanbeomseok;
    text-align: center;
    font-weight: 500;
    font-size: 12px;
    }
}
</style>




<title>트리만들기</title>
</head>
<body>

	<div class="background">
		<div class="bg_divide" style="background: white; position: relative;">
			<img src="img/snow.gif" height="308" width="768" style="pointer-events: none; background-color: #fffff; position: absolute; top: 0px; left: 0px; width: 100%; height: 100%;"/>
			<div style="position: relative;">
				<div class="pic">
					<div style="margin-top: 95px; height: 29px; font-size: 22px; font-weight: bold; font-family: humanbeomseok;">
						트리에 들어갈 정보를 입력해주세요!
					</div>
						
					<div class="imag">
						<img src="img/img_tree.png" class="pic_tree"/>
					</div>
						
					<form class="text">
						<input type="text" placeholder="닉네임" class="nick" value="" style="font-weight: bold; font-family: humanbeomseok;">
						<h1 style="font-size: 20px; font-weight: bold; font-family: humanbeomseok;">의 트리</h1>
					</form>
					
					<textarea rows="5" cols="33" placeholder="내 호텔을 소개해 주세요!" class="introduceText"></textarea>
					<br><br>
					<div class="cinfo">* 호텔 이름과 색상은 나중에도 수정할 수 있어요! *</div>
					
					<br>
					
					<form>
						<button class="create">트리 만들기</button>
					</form>
					
				</div>
						
			</div>
		</div>
	</div>

		
		
	
</body>
</html>